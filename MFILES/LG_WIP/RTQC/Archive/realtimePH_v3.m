warning("off")

%===========================================================================================
%===================================== LOAD DATA ===========================================
%===========================================================================================

%LOAD FLOATS
floatList = readtable("\\atlas\Chem\ARGO_PROCESSING\DATA\CAL\MBARI_float_list.txt");

%Sort any dead floats and those that haven't been deployed yet (Shouldn't be getting new data from those anyways)
floatList = floatList(floatList.tfDead==0 & ~isnat(floatList.x1stDate),:);
%floatList = sortrows(floatList(~ismissing(floatList.maxCycleProcDate),:), "maxCycleProcDate", "descend");
%newFloats = floatList(datenum(floatList.maxCycleProcDate)>=datenum(now-hours(24)),:);
floatList = sortrows(floatList(~ismissing(floatList.latestCycleFileDate),:), "latestCycleFileDate", "descend");
floatList = floatList(datenum(floatList.latestCycleFileDate)<=datenum(now),:);
wmoList = floatList.WMO;

%LOAD BSL AND IDENTIFY CYCLES FOR PH, P, T, AND S:
BSL = readtable("\\atlas\Chem\ARGO_PROCESSING\DATA\CAL\bad_sensor_list.TXT");
BSL = sortrows(BSL,"WMO_","ascend"); %Sort by WMO's in ascending order to match floatsDir

%Regular expression matches any string that's a number followed by a dash but NOT FOLLOWED by a dash 
%and a number, ensuring that only indefinite failures are accounted for
badCycles.PH_cycles = cellfun(@str2double, regexp(BSL.CYCLES(contains(BSL.SENSOR,"PH")&BSL.FLAG==4), ...
    '\d+(?!\-\d+)(?=-)','match'), "UniformOutput",false);
badCycles.PH_wmo = BSL(contains(BSL.SENSOR,"PH")&BSL.FLAG==4,"WMO_").WMO_;

badCycles.P_cycles = cellfun(@str2double, regexp(BSL.CYCLES(contains(BSL.SENSOR,"P(?!H)")&BSL.FLAG==4), ...
    '\d+(?!\-\d+)(?=-)','match'), "UniformOutput",false);
badCycles.P_wmo = BSL(contains(BSL.SENSOR,"P(?!H)")&BSL.FLAG==4,"WMO_").WMO_;

badCycles.T_cycles = cellfun(@str2double, regexp(BSL.CYCLES(contains(BSL.SENSOR,"T")&BSL.FLAG==4), ...
    '\d+(?!\-\d+)(?=-)','match'), "UniformOutput",false);
badCycles.T_wmo = BSL(contains(BSL.SENSOR,"T")&BSL.FLAG==4,"WMO_").WMO_;

badCycles.S_cycles = cellfun(@str2double, regexp(BSL.CYCLES(contains(BSL.SENSOR,"S")&BSL.FLAG==4), ...
    '\d+(?!\-\d+)(?=-)','match'), "UniformOutput",false);
badCycles.S_wmo = BSL(contains(BSL.SENSOR,"S")&BSL.FLAG==4,"WMO_").WMO_;

badCycles.O_cycles = cellfun(@str2double, regexp(BSL.CYCLES(contains(BSL.SENSOR,"O")&BSL.FLAG==4), ...
    '\d+(?!\-\d+)(?=-)','match'), "UniformOutput",false);
badCycles.O_wmo = BSL(contains(BSL.SENSOR,"O")&BSL.FLAG==4,"WMO_").WMO_;
%Everything is put into the struct "badData" with the cycle and associated WMO

%LOAD THE LIST OF PUMP OFFSET FLOATS:
pH_pumpoffset_980 

%LOAD THE QC LOG AND POPULATE WITH TEST PARAMETERS:
%Open up a qc log text file to store qc messages
userDir = getenv("USERPROFILE");
qcLog = fopen(userDir+"\Documents\realtime_qc_log.txt","w");

%Set QC parameters
deltaThd = .01;
refAnomThd = .0075;
phMagThd = [7.3; 8.5];

%Write all parameters at the top of the file, %.3g limits numbers to 3 sig figs
fprintf(qcLog, "Cycle delta threshold = %.3g\n" + ...
    "Reference anomaly threshold = %.3g\n" + ...
    "pH magnitude bounds = %.3g-%.3g\n\n", ...
    deltaThd, refAnomThd, phMagThd(1), phMagThd(2));

%===========================================================================================
%================================ BEGIN REALTIME QC LOOP ===================================
%===========================================================================================

for c = 1:length(wmoList)
    
    %For keeping track of issues from specific floats
    disp(wmoList(c))

    % %===========================================================================================
    % %CHECK IF FLOAT PH IS MARKED INDEFINITELY ON BSL
    % if ~isempty(cell2mat(badCycles.PH_cycles(badCycles.PH_wmo==wmoList(c))))
    %     endCycle_new = 
    %     disp("All future pH cycles already listed on BSL")
    %     continue; %CONTINUE ONTO NEXT FLOAT IF CONDITION IS MET
    % end
    % 
    % if ~isempty(cell2mat(badCycles.P_cycles(badCycles.P_wmo==wmoList(c))))
    %     disp("All future PRESSURE on BSL, pH unreliable")
    %     continue; %CONTINUE ONTO NEXT FLOAT IF CONDITION IS MET
    % end 
    % 
    % if ~isempty(cell2mat(badCycles.S_cycles(badCycles.S_wmo==wmoList(c))))
    %     disp("All future SALINITY on BSL, pH unreliable")
    %     continue; %CONTINUE ONTO NEXT FLOAT IF CONDITION IS MET
    % end 
    % 
    % if ~isempty(cell2mat(badCycles.T_cycles(badCycles.T_wmo==wmoList(c))))
    %     disp("All future TEMPERATURE on BSL, pH unreliable")
    %     continue; %CONTINUE ONTO NEXT FLOAT IF CONDITION IS MET
    % end 
    % 
    % if ~isempty(cell2mat(badCycles.O_cycles(badCycles.O_wmo==wmoList(c))))
    %     disp("All future OXYGEN on BSL, pH unreliable")
    %     continue; %CONTINUE ONTO NEXT FLOAT IF CONDITION IS MET
    % end 
    % %===========================================================================================

    %===========================================================================================
    %SEARCH FOR QC FLOATVIZ FILE
    if exist("\\atlas\chem\ARGO_PROCESSING\DATA\FLOATVIZ\QC\"+wmoList(c)+"QC.txt", 'file')
        DATA = get_FloatViz_data("\\atlas\chem\ARGO_PROCESSING\DATA\FLOATVIZ\QC\"+wmoList(c)+"QC.txt");
    
    %LOAD NON-QC FILE IF IT'S NOT AVAILABLE
    elseif  ~exist("\\atlas\chem\ARGO_PROCESSING\DATA\FLOATVIZ\QC\"+wmoList(c)+"QC.txt", 'file') & exist("\\atlas\chem\ARGO_PROCESSING\DATA\FLOATVIZ\"+wmoList(c)+".txt", 'file')
        disp("No QC floatviz file, loading non-processed file")
        DATA = get_FloatViz_data("\\atlas\chem\ARGO_PROCESSING\DATA\FLOATVIZ\"+wmoList(c)+".txt");

    %IF NO FLOATVIZ FILE EXISTS THEN MOVE ONTO NEXT FLOAT
    else
        disp("No floatviz files exist for this float, check float status")
        continue;
    end

    % GET SOME RAW INDICES
    DATA.iStn  = find(strcmp('Station', DATA.hdr) == 1);
    DATA.iP    = find(strcmp('Pressure[dbar]', DATA.hdr)  == 1);
    DATA.iT    = find(strcmp('Temperature[°C]', DATA.hdr)  == 1);
    DATA.iS    = find(strcmp('Salinity[pss]', DATA.hdr)  == 1);
    DATA.iZ    = find(strcmp('Depth[m]', DATA.hdr)  == 1);
    DATA.iO    = find(strcmp('Oxygen[µmol/kg]', DATA.hdr)  == 1);
    DATA.iN    = find(strcmp('Nitrate[µmol/kg]', DATA.hdr) == 1);
    DATA.iPH   = find(strcmp('pHinsitu[Total]', DATA.hdr)  == 1);
    %===========================================================================================
    
    %CHECK IF FLOAT HAS PH (MOVE TO NEXT FLOAT IF NO PH)
    %===========================================================================================
    if any(contains(DATA.hdr,'pHinsitu[Total]'))==0
        disp("Float has no pH")
        continue;
    end
    %===========================================================================================
   

    %CHECK THAT A FLOATQCLIST FILE EXISTS TO OBTAIN START CYCLE
    %===========================================================================================
    if exist("\\atlas\Chem\ARGO_PROCESSING\DATA\CAL\QC_LISTS\"+wmoList(c)+"_FloatQCList.txt",'file')

        %Identify the last cycle where qc was performed by looking at the floatQClist file
        fid = fopen("\\atlas\Chem\ARGO_PROCESSING\DATA\CAL\QC_LISTS\"+wmoList(c)+"_FloatQCList.txt", 'r');
        
        %Create empty string array
        startCycle = {};
        
        %Get the first line of the floatQClist file
        next_line = fgetl(fid);
        
        %Iterate through the file until reaching a blank line, indicating
        %the end of the most recent text block
        while ~isempty(next_line)
            next_line = fgetl(fid); %Read the current line
            if isempty(next_line)|next_line==-1 %If the current line is empty, end the while loop
                break;
            else
                startCycle{end+1} = split(next_line,',');  %Split the string and store it
            end
        end
        
        %The cycle that the qc process will begin on
        startCycle = str2double(startCycle{end}{2});

    %IF NO FLOATQCLIST FILE EXISTS, START FROM CYCLE 1
    else
        startCycle = 1;
    end

    %CHECK IF THERE ARE ANY NEW CYCLES
    endCycle = DATA.data(end,DATA.iStn); %The final station in the dataset
    
    if startCycle == endCycle
        disp('No new cycles to process')
        continue;
    end
    %===========================================================================================
    
   
    %CHECK IF CRITICAL FLOAT VARIABLES ARE MARKED INDEFINITELY ON BSL
    %===========================================================================================
    
    %PH
    %If the listed BSL cycle is <= the last qc'd cycle, then float has already been corrected to last good cycle
    endCycle_new = cell2mat(badCycles.PH_cycles(badCycles.PH_wmo==wmoList(c)));
    if endCycle_new <= startCycle + 1
        disp("All future PH cycles already listed on BSL")
        continue; %CONTINUE ONTO NEXT FLOAT IF ALL FUTURE DATA IS BAD
    
    %If the listed BSL cycle is newer than last DMQC but before the most recently cycle, make the BSL cycle the endCycle
    elseif endCycle_new > startCycle & endCycle_new <= endCycle
        endCycle = endCycle_new;
    end
    
    %PRESSURE
    endCycle_new = cell2mat(badCycles.P_cycles(badCycles.P_wmo==wmoList(c)));
    if endCycle_new <= startCycle + 1
        disp("All future PRESSURE cycles already listed on BSL")
        continue;
    elseif endCycle_new > startCycle & endCycle_new <= endCycle
        endCycle = endCycle_new;
    end

    %SALINITY
    endCycle_new = cell2mat(badCycles.S_cycles(badCycles.S_wmo==wmoList(c)));
    if endCycle_new <= startCycle + 1
        disp("All future SALINITY cycles already listed on BSL")
        continue;
    elseif endCycle_new > startCycle & endCycle_new <= endCycle
        endCycle = endCycle_new;
    end

    %TEMPERATURE
    endCycle_new = cell2mat(badCycles.T_cycles(badCycles.T_wmo==wmoList(c)));
    if endCycle_new <= startCycle + 1
        disp("All future TEMPERATURE cycles already listed on BSL")
        continue;
    elseif endCycle_new > startCycle & endCycle_new <= endCycle
        endCycle = endCycle_new;
    end

    %OXYGEN
    endCycle_new = cell2mat(badCycles.O_cycles(badCycles.O_wmo==wmoList(c)));
    if endCycle_new <= startCycle + 1
        disp("All future OXYGEN cycles already listed on BSL")
        continue;
    elseif endCycle_new > startCycle & endCycle_new <= endCycle
        endCycle = endCycle_new;
    end
    %===========================================================================================
    
    %SUBSAMPLE GOOD DATA
    %===========================================================================================
    %Now that the data has made it through initial screening, we can begin
    %to prep it for QC analysis by subsetting good data at depth
    
    %Subsample new and old profiles with GOOD and QUESTIONABLE data only,no BAD data
    DATA.newProfiles = DATA.data(DATA.data(:,DATA.iStn)>startCycle & DATA.data(:,DATA.iPH+1)~=8 & DATA.data(:,DATA.iPH)>-1e10,:);
    DATA.oldProfiles = DATA.data(DATA.data(:,DATA.iStn)<=startCycle & DATA.data(:,DATA.iPH+1)~=8 & DATA.data(:,DATA.iPH)>-1e10,:);
    
    %If all recent data is cut because of filter, then mark on QC log and continue to next float
    if isempty(DATA.newProfiles)
        disp('No recent GOOD data, either marked bad or missing')
        pumpOffset = ismember(wmoList(c),pH_pumpoffset_980_floats);         %LOGICAL STRING CODE FROM "JAN" AT: 
        LogicalStr = {"", "(pump offset float)"};                           % https://www.mathworks.com/matlabcentral/answers/258287-fprintf-for-logical-statement                            
        fprintf(qcLog, "\n%d\t%s\tcycles:\t%d-%d\n" + ...
            "All recent data either marked as BAD or MISSING in floatviz file\n", ...
            wmoList(c), LogicalStr{pumpOffset + 1}, startCycle, endCycle);
        continue;
    end

    %IF FLOAT IS ON PUMP OFFSET LIST THEN SUBSAMPLE TO 950m
    if ismember(wmoList(c),pH_pumpoffset_980_floats)

        disp("Pump offset float")

        %Subsample the deep data to 950-980m
        dDeep = DATA.newProfiles(DATA.newProfiles(:,DATA.iZ)>=920 & ...
            DATA.newProfiles(:,DATA.iZ)<=980,:);

    else %IF NOT THEN SUBSAMPLE DEEP PH FROM 980-1520m

        %Subsample the deep data to 980-1520m
        dDeep = DATA.newProfiles(DATA.newProfiles(:,DATA.iZ)>=980 & ...
            DATA.newProfiles(:,DATA.iZ)<=1520,:);
    end
    
    if isempty(dDeep)
        disp('No recent deep data for this float')
        %LOGICAL STRING CODE FROM "JAN" AT: 
        % https://www.mathworks.com/matlabcentral/answers/258287-fprintf-for-logical-statement
        pumpOffset = ismember(wmoList(c),pH_pumpoffset_980_floats);
        LogicalStr = {"", "(pump offset float)"};
        fprintf(qcLog, "\n%d\t%s\tcycles:\t%d-%d\n" + ...
            "No data from 950-1520m, no qc performed\n", ...
            wmoList(c), LogicalStr{pumpOffset + 1}, startCycle, endCycle);
        continue;
    end
    %===========================================================================================

    %CHECK FOR GPS ISSUES AND CALCULATING ESPERMIX
    %===========================================================================================

    %If there are any missing or wonky GPS fixes, search for good gps points
    if any(dDeep(abs(dDeep(:,3))>360|abs(dDeep(:,4))>90))

        %List of stns without a gps fix
        noGPSstns = unique(dDeep(abs(dDeep(:,3))>360|abs(dDeep(:,4))>90,DATA.iStn));

        %Index of data with a gps fix
        gpsIDX = abs(dDeep(:,3))<360 & abs(dDeep(:,4))<90;

        %Subset data that has a gps fix to calculate Esper
        dDeep_noGPS = dDeep(gpsIDX,:);

        %Create an empty array of NaNs to fill with Esper data
        newEstimates = NaN(length(dDeep),1);
        
        %If there's no good gps fixes, then EsperMix = NaN array
        if isempty(dDeep_noGPS)

            disp('Missing gps locations for ALL stations')
            Estimates.pH = newEstimates;
        %If there are SOME gps fixes, then estimate EsperMix where possible
        else

            disp('Missing gps locations for SOME stations')
            % CALCULATE ESPER pH & NO3
            Estimates.DesireVar = [3]; %pH & nitrate (5)
            Estimates.OutCoords = [dDeep_noGPS(:,3), dDeep_noGPS(:,4), dDeep_noGPS(:,DATA.iZ)]; % lon,lat,Z
            Estimates.PredictorTypes    = [1 2 6]; % PSAL, TEMP, DOXY_ADJ,
            Estimates.Measurements = [dDeep_noGPS(:,DATA.iS), dDeep_noGPS(:,DATA.iT), dDeep_noGPS(:,DATA.iO)];
            Estimates.dvec = datevec(dDeep_noGPS(:,1));
            Estimates.dec_yr = Estimates.dvec(:,1) +(Estimates.dvec(:,2)*30)/365 + Estimates.dvec(:,3)/365; % very crude decimal year
            Equations    = 7; % S, T, O2
    
            [Estimates,~] = ESPER_Mixed(Estimates.DesireVar, Estimates.OutCoords, Estimates.Measurements,...
                            Estimates.PredictorTypes, 'Equations', Equations, 'EstDates', Estimates.dec_yr);
    
            %Fills the NaN array with Esper estimates where GPS fixes exist available
            newEstimates(gpsIDX,1) = Estimates.pH ;
    
            %Replace Estimates.pH with the modified NaN array
            Estimates.pH = newEstimates;
        end
    
    %If there are NO MISSING GPS fixes, then estimate EsperMix normally
    elseif all(dDeep(abs(dDeep(:,3))<=360|abs(dDeep(:,4))<=90))

        % CALCULATE ESPER pH & NO3
        Estimates.DesireVar = [3]; %pH & nitrate (5)
        Estimates.OutCoords = [dDeep(:,3), dDeep(:,4), dDeep(:,DATA.iZ)]; % lon,lat,Z
        Estimates.PredictorTypes    = [1 2 6]; % PSAL, TEMP, DOXY_ADJ,
        Estimates.Measurements = [dDeep(:,DATA.iS), dDeep(:,DATA.iT), dDeep(:,DATA.iO)];
        Estimates.dvec = datevec(dDeep(:,1));
        Estimates.dec_yr = Estimates.dvec(:,1) +(Estimates.dvec(:,2)*30)/365 + Estimates.dvec(:,3)/365; % very crude decimal year
        Equations    = 7; % S, T, O2

        [Estimates,~] = ESPER_Mixed(Estimates.DesireVar, Estimates.OutCoords, Estimates.Measurements,...
                        Estimates.PredictorTypes, 'Equations', Equations, 'EstDates', Estimates.dec_yr);
    end
    %===========================================================================================
    
    %BUILD DATA MATRICES FOR QC TESTS
    %===========================================================================================    
    %Create array of unique stations in deep PH dataset
    stns = unique(dDeep(:,DATA.iStn));
    
    %Retrieve indices of the first cycle to start from
    stnInd = dDeep(:,DATA.iStn)==stns(1);
    
    %Mean pH over 980-1520m
    deepPH = NaN(length(stns),1);
    
    %Mean Esper at depth
    EsperPH = NaN(length(stns),1);

    %Mean Float-to-Esper anomaly at depth
    refAnom = NaN(length(stns),1);

    %Test for anomalously high or low pH
    profileMagTest = NaN(length(stns),1); 

    for i = 1:length(stns)
        
        %Assign indices for the current station
        stnInd = dDeep(:,DATA.iStn)==stns(i);
        
        %Find pH at all deep depths
        deepPH_allPoints = dDeep(stnInd,DATA.iPH);
        
        %Find EsperMix pH at depth
        deepEsper = Estimates.pH(stnInd);
        
        %Average. float pH at depth that can be used to calculate the
        %cycle-to-cycle difference in pH
        deepPH(i,1) = mean(deepPH_allPoints);
    
        %Avg. EsperMix pH at depth
        EsperPH(i,1) = mean(deepEsper);
    
        %Avg. anomaly between deep float and EsperMix pH
        refAnom(i,1) = mean(deepPH_allPoints-deepEsper);
        
        %Test whether any part of the profile is anomalously high or low
        profileMagTest(i,1) = any(DATA.newProfiles(DATA.newProfiles(:,DATA.iStn)==stns(i),DATA.iPH) <= phMagThd(1)| ...
            DATA.newProfiles(DATA.newProfiles(:,DATA.iStn)==stns(i),DATA.iPH) >= phMagThd(2));
    end
    
    %Append phDelta with a 0 at the beginning to compensate for indices offset
    phDelta = [0; diff(deepPH)];
    %===========================================================================================  

    %FILL IN REALTIME QC LOG FILE
    %===========================================================================================  
    if exist("noGPSstns", 'var')||any(phDelta>=deltaThd)||any(refAnom>=refAnomThd)||any(profileMagTest==1)||(endCycle>startCycle && endCycle<DATA.data(end,DATA.iStn))
        %LOGICAL STRING CODE FROM "JAN" AT: 
        % https://www.mathworks.com/matlabcentral/answers/258287-fprintf-for-logical-statement
        pumpOffset = ismember(wmoList(c),pH_pumpoffset_980_floats);
        LogicalStr = {"", "(pump offset float)"};
        fprintf(qcLog, "\n%d\t%s\tcycles:\t%d-%d\n", wmoList(c), LogicalStr{pumpOffset + 1}, startCycle, endCycle);
    end

    if endCycle>startCycle && endCycle<DATA.data(end,DATA.iStn)
        fprintf(qcLog, "Since last DMQC, data has been placed on BSL at cycle %d\n", endCycle);
    end

    if exist("noGPSstns", 'var')
        horizontal_str = sprintf('%d\t', noGPSstns);
        fprintf(qcLog, "No GPS fix for cycle(s)\t%s\n" + ...
            "Espermix cannot be calculated for cycles without GPS\n", horizontal_str);
        clear noGPSstns
    end
    
    if any(phDelta>=deltaThd)
        horizontal_str = sprintf('%d\t', stns(phDelta>=deltaThd));
        fprintf(qcLog, "Cycle delta threshold exceeded at cycle(s)\t%s\n", horizontal_str);
    end
    
    if any(refAnom>=refAnomThd)
        horizontal_str = sprintf('%d\t', stns(refAnom>=refAnomThd));
        fprintf(qcLog, "Reference anomaly threshold exceeded at cycle(s)\t%s\n", horizontal_str);
    end
    
    if any(profileMagTest==1)
        horizontal_str = sprintf('%d\t', stns(any(profileMagTest==1)));
        fprintf(qcLog, "pH magnitude threshold exceeded at cycle(s)\t%s\n", horizontal_str);
    end
    %===========================================================================================  
end

%Close the qc log file after all floats have been viewed
fclose(qcLog);