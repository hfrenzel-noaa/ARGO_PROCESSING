function [rtqcDATA] = RTQC_tests(DATA, varType, qcDepth, badO2Test, omitBadDeepData,refAnomTest)
    
    % INPUTS
    % DATA: A data structure in the same format as floatViz files (can be a subset of the data)
    
    % varType: inputs to the EsperMix function to output a desired variable
    % 3 = PH
    % 5 = NITRATE
    
    % qcDepth: A lower and upper bound of depths that the deep tests will be applied to
    % I.E. qcDepth = [1480 1520]

    % badO2Test: A logical indicating whether the O2 sensor has been placed on the BSL
    % 0 = O2 is NOT on the BSL
    % 1 = O2 is on the BSL (ESPER with no O2 will be used)

    % omitBadDeepData: A logical indicating whether the subset of deep data includes
    % data flagged as bad (8) or omits it/
    % 0 = Bad data is NOT omitted and will be included in the deep tests
    % 1 = (default) Bad is omitted and will not be included in the deep tests
    
    %Retrieve indices for the relevant variables within DATA
    iStn  = find(strcmp('Station', DATA.hdr) == 1);           %Station
    iLat  = find(strcmp('Lat [°N]', DATA.hdr) == 1);          %Latitude
    iLon  = find(strcmp('Lon [°E]', DATA.hdr) == 1);          %Longitude
    iZ    = find(strcmp('Depth[m]', DATA.hdr)  == 1);         %Depth
    iO    = find(strcmp('Oxygen[µmol/kg]', DATA.hdr)  == 1);  %Oxygen
    iT    = find(strcmp('Temperature[°C]', DATA.hdr)  == 1);
    iS    = find(strcmp('Salinity[pss]', DATA.hdr)  == 1);
    dat = DATA.data;

    %Identify the subsampled deep data from DATA depending on the desired varType
    
    if varType == 5 %NITRATE
        %Retrieve index for desired variable (Nitrate in this case)
        iVar = find(strcmp('Nitrate[µmol/kg]', DATA.hdr) == 1);  %Nitrate
        
        %TEST THRESHOLDS
        rtqcDATA.deltaThd = 1; %Cycle-to-cycle delta for NITRATE
        rtqcDATA.refAnomThd = 1; %Float-to-Esper anomaly for NITRATE
        rtqcDATA.rangeChk = [-10 55]; %Range check test
        rtqcDATA.consecCounter = 3; %Number of consecutive test breaches before flagging

    elseif varType == 3 %PH
        iVar = find(strcmp('pHinsitu[Total]', DATA.hdr)  == 1);  %pH
        
        %TEST THRESHOLDS
        rtqcDATA.deltaThd = .01; %Cycle-to-cycle delta for PH
        rtqcDATA.refAnomThd = .01; %Float-to-Esper anomaly for PH
        rtqcDATA.rangeChk = [7.3 8.5];
        rtqcDATA.consecCounter = 3;
    else
        disp("Error locating data in DATA structure; check varType")
    end
    
    if omitBadDeepData
        %Subset deep data within "qcDepth" range that is also flagged as good or questionable
        deepDATA = dat(dat(:,iZ)>=qcDepth(1) & dat(:,iZ)<=qcDepth(2) & dat(:,iVar+1)~=8,:);
    else
        deepDATA = dat(dat(:,iZ)>=qcDepth(1) & dat(:,iZ)<=qcDepth(2),:);
    end

    %CHECK FOR GPS ISSUES AND CALCULATE ESPERMIX
    %===========================================================================================
    %GPS is a necessary variable to estimate ESPERMIX, so if a float is missing a GPS fix for a cycle
    %than it is returned as a NaN. The stations without gps are kept track of to display in the final message.

    %List of stns WITHOUT a gps fix (also generates a the output data structure "rtqcDATA")
    rtqcDATA.noGPSstns = unique(dat(isnan(dat(:,iLon))|isnan(dat(:,iLat)),iStn));
    
    %CHECK FOR ANY MISSING OXYGEN
    %===========================================================================================
    %O2 is not required to estimate EsperMix, but does change the equation. This block locates any cycles
    %that are missing O2 at the qc depth. If any cycles are missing O2 at the then EsperMix is calculated 
    %without O2. This is done to keep consistent with how MBARI qc's floats.

    %Identify missing O2 stations

    %Retreive station data
    stnDATA = deepDATA(:,iStn);

    %Create array of unique stations in deep PH dataset
    rtqcDATA.stns = unique(deepDATA(:,iStn))';
    
    %Create empty logical array to populate with test results
    noO2logical = logical.empty(length(rtqcDATA.stns),0);
    
    %Loop through all stations
    for i = 1:length(rtqcDATA.stns)
    
        %Test if any oxygen is missing from each station and store the test result in the logical array
        noO2logical(i) = isnan(mean(deepDATA(stnDATA==rtqcDATA.stns(i),iO), "omitmissing"));
    end
    
    %Retrieve any stations that are missing O2
    rtqcDATA.noO2stns = stnDATA(noO2logical);
    
    %Apply a blanket test to the entire float
    %If there are missing O2 stations, then it's possible this float is qc'd using ESPER (no O2)
    missingO2Test = ~isempty(rtqcDATA.noO2stns);
    %===========================================================================================
    
    if refAnomTest
        %ESTIMATE ESPERMIX
        %=========================================================================================== 
        %This block takes all of the data with GPS fixes and estimates EsperMix either with O2 or without O2.
    
        %If there's no good gps fixes, then EsperMix = NaN array
        % if ~isempty(rtqcDATA.noGPSstns)
        %     disp('GPS missing from all or some of the data.')
        % end
        
        %If there's no missing O2 and GPS fixes, calculate ESPERMIX as normal
        % if (isempty(rtqcDATA.noO2stns) & ~badO2Test & ~missingO2Test)
    
        % CALCULATE ESPER pH or NO3
        Estimates.DesireVar = varType;
        Estimates.OutCoords = [deepDATA(:,3), deepDATA(:,4), deepDATA(:,iZ)]; % lon,lat,Z
        Estimates.PredictorTypes    = [1 2 6]; % PSAL, TEMP, DOXY_ADJ,
        Estimates.Measurements = [deepDATA(:,iS), deepDATA(:,iT), deepDATA(:,iO)];
        Estimates.dvec = datevec(deepDATA(:,1));
        Estimates.dec_yr = Estimates.dvec(:,1) +(Estimates.dvec(:,2)*30)/365 + Estimates.dvec(:,3)/365; % very crude decimal year
        Equations    = 7; % S, T, O2
    
        %IF THERE'S MISSING O2 OR O2 IS ON BSL, SWITCH TO ESPER (NO O2)
        if badO2Test | missingO2Test
            Equations = 8; % S, T
        end
        
        %Estimate ESPERMIX for the desired variable with the proper equation
        [Estimates,~] = ESPER_Mixed(Estimates.DesireVar, Estimates.OutCoords, Estimates.Measurements,...
                    Estimates.PredictorTypes, 'Equations', Equations, 'EstDates', Estimates.dec_yr);
    
        %Identify the subsampled deep data from DATA depending on the desired varType
        if varType == 5
            RefData = Estimates.nitrate;
        elseif varType == 3
            RefData = Estimates.pH;
        else
            disp("Error location data in DATA structure; check varType")
        end
    
        rtqcDATA.Esper = RefData;
        %===========================================================================================
    end
    
    %REALTIME QC TESTING
    %===========================================================================================
    %The heart of this function is the realtime qc tests. This block runs the data through the cycle delta
    %and reference anomaly tests. Using logical indices of the cycles that breach the qc thresholds (in the
    %beginning of the code), a third test is run to find any sequences of 3 or more consecutive cycles that 
    %breach the thresholds. This ensures that natural noise during 1 or 2 cycles doesn't trigger a warning.
    
    %Create blank array for mean deep data at each station
    rtqcDATA.deepDATA_mean = NaN(length(rtqcDATA.stns),1);
    
    if refAnomTest
        %Create blank array for mean deep Esper data at each station
        rtqcDATA.RefDATA_mean = NaN(length(rtqcDATA.stns),1);
    
        %Mean Float-to-Esper anomaly at depth
        rtqcDATA.refAnom = NaN(length(rtqcDATA.stns),1);
    end
    
    %Range check for data throughout the entire profile
    rtqcDATA.rangeChkBreach = logical.empty(length(rtqcDATA.stns),0);

    for i = 1:length(rtqcDATA.stns)
        
        %Assign indices for the current station
        stnIDX_deep = deepDATA(:,iStn)==rtqcDATA.stns(i);
        stnInd_prof = dat(:,iStn)==rtqcDATA.stns(i);
        
        %Deep data at the current station in the loop
        deepData_atStn = deepDATA(stnIDX_deep,iVar);
        
        %Entire profile at the current station in the loop
        profData_atStn = dat(stnInd_prof,iVar);
        
        %Mean of float data at depth for the current cycle
        rtqcDATA.deepDATA_mean(i,1) = mean(deepData_atStn,'omitmissing');
        
        if refAnomTest
            %Deep EsperMix data at the current station in the loop
            deepRefData_atStn = RefData(stnIDX_deep);
        
            %Mean of EsperMix data at depth for the current cycle
            rtqcDATA.RefDATA_mean(i,1) = mean(deepRefData_atStn,'omitmissing');
        
            %Mean anomaly between float and EsperMix data at depth for the current cycle
            rtqcDATA.refAnom(i,1) = mean(deepData_atStn-deepRefData_atStn,'omitmissing');
        end

        %Perform a range check test over the entire profile
        rtqcDATA.rangeChkBreach(i,1) = any(profData_atStn<=rtqcDATA.rangeChk(1) | profData_atStn>=rtqcDATA.rangeChk(2));
    end
    
    rtqcDATA.rangeChkTriggerStns = rtqcDATA.stns(rtqcDATA.rangeChkBreach);

    %Append phDelta with a 0 at the beginning to compensate for indices offset
    rtqcDATA.cycleDelta = [0; diff(rtqcDATA.deepDATA_mean)];

    %RUN CONSECUTIVE TRIGGER TESTS
    %Code based on example found from:
    %https://www.mathworks.com/matlabcentral/answers/366126-how-many-consecutive-ones
    
    %FOR GROSS SENSOR DRIFT (CYCLE DELTA)
    %===========================================================================================

    %Create logical arrays for delta and ref anom tests (any delta or refAnom beyond the 
    %threshold is flagged)
    cycleDeltaBreach = abs(rtqcDATA.cycleDelta) >= rtqcDATA.deltaThd; %& (abs(rtqcDATA.refAnom) >= refAnomThd);

    
    %Create empty zero arrays to populate with indices later
    deltaOut = zeros(size(cycleDeltaBreach'));
  
    %Duplicate that zero array but prepend and append a zero for indexing
    deltaOutB = [0,cycleDeltaBreach',0];
   
    %Find the index of any INITIAL failure, where (i.e. any location where cycleDeltaBreach goes from 0 to 1)
    iDelta = strfind(deltaOutB, [0 1]);

    %Now find the index of any FINAL failure and subtract the INITIAL failure index to
    %calculate how many consecutive points exist between the initial and final failure 
    deltaOut(iDelta) = strfind(deltaOutB, [1 0]) - iDelta; %append the zeros array "delta/ref Out"

    %i.e. If failures begin at cycle 3 and end at cycle 7, this means cycle 3,4,5,6,7 get flagged. By taking
    %the difference between the initial (3) and final (7), we find that this test was triggered 5 
    %consecutive times from cycle 3 (the initial cycle is counted)

    %Filters out instances of 1 or 2 consecutive failures that could be natural noise in the environment
    iDelta = iDelta(deltaOut(iDelta) >= rtqcDATA.consecCounter);
    
    %Create an array of cycle blocks that consists of each INITIAL and FINAL failure
    deltaStnBlocks = [rtqcDATA.stns(iDelta); rtqcDATA.stns(iDelta)+deltaOut(iDelta)-1]';

    %Create empty arrays to be appended with all failed stations
    rtqcDATA.cycleDeltaTriggerStns = [];

    %For each pair of cycles, populate the previous empty array with ALL cycles between the INITIAL and FINAL failure cycles
    deltaDim = size(deltaStnBlocks);
    
    if deltaDim(1) == 1 & ~isempty(deltaStnBlocks)
           rtqcDATA.cycleDeltaTriggerStns = [rtqcDATA.cycleDeltaTriggerStns, deltaStnBlocks(1):1:deltaStnBlocks(2)];
    elseif deltaDim(1) > 1
        for x = 1:deltaDim(1)
            rtqcDATA.cycleDeltaTriggerStns = [rtqcDATA.cycleDeltaTriggerStns, deltaStnBlocks(x,1):1:deltaStnBlocks(x,2)];
        end
    end
    
    if refAnomTest
        %FOR GROSS REFERENCE ANOMALY
        %===========================================================================================
        refAnomBreach = abs(rtqcDATA.refAnom) >= rtqcDATA.refAnomThd;
        refOut = zeros(size(refAnomBreach'));
        refOutB = [0,refAnomBreach',0];
        iRef = strfind(refOutB, [0 1]);
        refOut(iRef) = strfind(refOutB, [1 0]) - iRef;
        iRef = iRef(refOut(iRef) >= rtqcDATA.consecCounter);
        refStnBlocks = [rtqcDATA.stns(iRef); rtqcDATA.stns(iRef)+refOut(iRef)-1]';
        rtqcDATA.refAnomTriggerStns = [];
        refDim = size(refStnBlocks);
        if refDim(1) == 1 & ~isempty(refStnBlocks)
            rtqcDATA.refAnomTriggerStns = [rtqcDATA.refAnomTriggerStns, refStnBlocks(1):1:refStnBlocks(2)];
        elseif refDim(1) > 1
            for x = 1:refDim(1)
                rtqcDATA.refAnomTriggerStns = [rtqcDATA.refAnomTriggerStns, refStnBlocks(x,1):1:refStnBlocks(x,2)];
            end
        end
    end
end
%=========================================================================================== 