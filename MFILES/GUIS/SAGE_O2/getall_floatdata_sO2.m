function DATA = getall_floatdata_sO2(dirs,MBARI_ID,floatTYPE)
% ************************************************************************
% getall_floatdata_sO2.m
% ************************************************************************
%
% Function to loop through all .msg files for a particular float in
% specified directory.
%
%
% INPUTS:  pn      = input directory path structure
%          floatID = MBARI float ID
%          floatTYPE = NAVIS or APEX? ('N', or 'A')
%
% OUTPUTS:
%
%
% AUTHOR: Tanya Maurer
%         Monterey Bay Aquarium Research Institute
%         tmaurer@mbari.org
%
% DATE: 12/15/16
% UPDATES:
% 12/12/18, TM: added code to better handle duplicate floats.  Still
%               not perfect (some hard-wiring...)!
% 01/10/19, TM: added code to deal with float 12768, with no position fix
%               for first handful of cycles. (went under ice prior to
%               transmission of first cycle).
% 11/18/19, JP: Changed  code to deal with data.aircal data. Simple count
%               1st 4 are near surf measurement. Warning to see if
%               deplicate near surf & air measurment cycles
% 09/29/20, TM: Changed code again to better deal with all cases of data.aircal data.
%               Perform a diff on pneumatic pressure to identify the
%               transition from near-surface to true in-air sampling.
% 03/30/21, TM: Modifications to reflect system overhaul upon launch of
%               GO-BGC.  Float naming scheme has changed, and msg file
%               directory specifications and access are much better
%               defined.  Code is now a bit cleaner.  Input variable
%               "isDUP" is now obsolete and was removed from this fx.
% 7/26/21,  TM: Code updates in support of APEX SBE83.  Code could be
%               cleaned up!  We should really start accessing in-air data
%               from the mat files rather than recomputing here.
% 2/8/24 	TM: Added enhancements in support of Navis Nautlis 0066 with SBS83...
% 04/25/24  JP: Minor change to deal with small error for 1st standard NAVIS with 
%               SBE83 (strcmp to strncmp)
% 04/29/24 TM: Added check on data parsing -- if nothing returned, skip
%               cycle! (ie WHOI 1560.002)
% 07/17/24 TM: This code needs major revamping...Modified to fit yet more
%              firmware 'flavors' of Navis with SBS83.  The new Nautilus
%              have optode T in volts, and time in unix time (for aircal)
%
% 11/6/24 LG: - Check whether the list of .msg files ("themsgfiles") has a .000.msg
%             file. Float 7902100 does not, causing SAGE O2 to load the float on 
%             cycle 2, instead of cycle 1 and making ERA data out of sync.
%
%             - Errors were getting thrown for the code that populates "airk" for 
%             redundant if statement blocks. New code is functionally identical.
%
% NOTES:
%
% *************************************************************************
% TESTING
% dirs      = SetupDirs_sO2;
% pn        = '\\atlas\chemwebdata\floats\f18608\';
% floatID   = '12652';
% floatTYPE = 'A';
% isDUP     = 0;

% *************************************************************************

% ************************************************************************
% ************************************************************************
% DUPfloats = {'6966HAWAII','8501CALCURRENT','8514HAWAII','9254SOOCN','0412HAWAII','0948STNP'};
% [float_names, UW_ID, WMO_ID] = get_MBARI_WMO_list(dirs);
% if isDUP
%     inds = strfind(DUPfloats,floatID);
%     IndX = find(not(cellfun('isempty',inds)));
%     floatNAME = DUPfloats{IndX};
%     if strfind(floatNAME,'8514HAWAII')
%         dirs.msg = [dirs.dup,'f8514_2\'];
%     else
%         dirs.msg = dirs.dup;
%     end
%     dirs = rmfield(dirs,'alt');
% else
%     inds = strfind(float_names,floatID);
%     IndX = find(not(cellfun('isempty',inds)));
%     if length(IndX)==1
%         floatNAME = float_names{IndX,1};
%     else
%         floatNAME = float_names{IndX(2),1}; %WARNING: Temporary fix for duplicate floats.  Default to most recent deployment (This will be the second entry for current dups: 0948, 8501, 8514.  Not fool-proof moving forward!! May need revisiting if/when more duplicates are deployed).
%     end
% end
% DATA.floatNAME = floatNAME;

Optode_tempVorC{1} = 0;
Optode_tempVorC{2} = 0;
Optode_tempVorC{3} = 0;
Optode_tempVorC{4} = 0;

% GET FLOAT CALS___________________________________________________________
float_cal_path = [dirs.cal,'cal',MBARI_ID,'.mat'];
if exist(float_cal_path,'file')
    disp(['Loading existing calibration file: ',float_cal_path])
    load(float_cal_path);
else
    cal = get_float_cals(MBARI_ID, dirs);
end
cal_info = cal.info;

if isempty(cal)
    disp(['NO CALIBRATION DATA FOR ',MBARI_ID])
    return
end

%GET MSG FILES, COPY TO TEMP DIR___________________________________________
L = get_msg_list(cal_info,'msg');
cplist = get_msg_list(cal.info, 'cp');

if ~isempty(ls([dirs.temp,'*.msg']))
    delete([dirs.temp,'*.msg']) %clear any msg files already in temp dir
end
for ilist = 1:size(L.list,1)
    mytmpfile = [L.list{ilist,2},'\',L.list{ilist,1}];
    copyfile(mytmpfile,dirs.temp);
end
% for Navis Nautilus and beyond, be sure to copy HR cp files!
for iClist = 1:size(cplist.list,1)
    mytmpfileC = [cplist.list{iClist,2},'\',cplist.list{iClist,1}];
    copyfile(mytmpfileC,dirs.temp);
end
%PROCESS MSG FILES FOR GIVEN FLOAT_________________________________________
fltdir = dir([dirs.temp,'*.msg']);
themsgfiles = char(fltdir.name);
DATA.msgfiles = [];
if ~isempty(themsgfiles)
    DATA.Nprof = 0; % # of profiles
    d = [];
    gps = [];
    raw_data = [];
    ac_s = [];
    ac_a = [];
    aircal_surf=[];
    aircal_air=[];
    air=[];
    O2prof=[];
    waitmsg = sprintf(['Please Wait. \nProcessing .msg files for Float ',...
        MBARI_ID,'. \n',num2str(size(themsgfiles,1)),' files to process.']);
    WB = waitbar(0,waitmsg);
    k=1;
    
    % LG 11/06/2024: Check whether the list of .msg files ("themsgfiles")
    % contains a .000.msg file
    hasStartMsg = contains(string(themsgfiles(1,:)),'.000.msg');

    %IF THERE IS A .000.msg FILE, START THE LOOP ON THE SECOND FILE (.001.msg)
    if hasStartMsg
        startMsg = 2;

    %IF THERE IS NOT A .000.msg FILE, START THE LOOP ON THE FIRST FILE
    else
        startMsg = 1;
    end
    
    %Using the list of msg files, go through and individually process each one
    for i = startMsg:size(themsgfiles,1)
        msg_file = [dirs.temp,'\',themsgfiles(i,:)];
        disp(msg_file); % TESTING
        if strcmp(floatTYPE,'APEX')==1
            data = parse_APEXmsg4ARGO(msg_file);
            DATA.floatTYPE = 'APEX';
        elseif strcmp(floatTYPE,'NAVIS')==1
            data = parse_NAVISmsg4ARGO(msg_file);
            DATA.floatTYPE = 'NAVIS';
            myindices = ~cellfun(@isempty,regexpi(data.lr_hdr,'tV$'));
%         	LRTv = strfind(data.lr_hdr,'O2tV'); Index = find(not(cellfun('isempty',LRTv)));
            if ~isempty(myindices)
                Optode_tempVorC{1} = 1;
            end
            if isfield(data,'aircal_hdr')
                % Check for Tvolts
                myindices = ~cellfun(@isempty,regexpi(data.aircal_hdr,'tV$'));
%                 AIRTv = strfind(data.aircal_hdr,'O2tV'); Index = find(not(cellfun('isempty',AIRTv)));
                if sum(myindices)~=0
                Optode_tempVorC{2} = 1;
                Optode_tempVorC{3} = 1;
                Optode_tempVorC{4} = 1;                
                end
                % Check for UNIX time
                % Unix time = number of seconds since Jan 1, 1970 00:00:00.
                isUnix = ~cellfun(@isempty,regexpi(data.aircal_hdr,'UNIXtime$'));
                sdnInd = find(isUnix);                
                if ~isempty(sdnInd)
                    data.aircal(sdnInd) = datenum(1970,1,1,0,0,0) + data.aircal(sdnInd)/86400;
                end
            end        
        else
            msgbox('FLOAT IS NOT APEX OR NAVIS. EXITING...')
            return
        end

        %Check for data!! 
        if data.cast == 0 || (isempty(data.lr_d) && isempty(data.hr_d))
            disp(['WARNING: no hi or lo res data parsed; skipping cycle ',num2str(data.cast)])
            continue
        end

        % GET SOME VARIABLE INDICES________________________________________________
        if strcmp(floatTYPE,'APEX')==1
            float_vars = data.lr_hdr; %get msg file hdr (lr for APEX)
            iP   = find(strcmp('p',      float_vars) == 1); % CTD P
            iT   = find(strcmp('t',      float_vars) == 1); % CTD T
            iS   = find(strcmp('s',      float_vars) == 1); % CTD S
            To_ind  = find(strcmp('Topt',   float_vars) == 1); % optode temp
            TPh_ind = find(strcmp('TPhase', float_vars) == 1); % T Phase 4330
            if isempty(TPh_ind)
                TPh_ind = find(strcmp('Phase',float_vars) == 1); %SBE83 on APEX
                To_ind = find(strcmp('T83', float_vars) == 1); % SBE83 on APEX
            end
            RPh_ind = find(strcmp('RPhase', float_vars) == 1); % R Phase 4330
            BPh_ind = find(strcmp('BPhase', float_vars) == 1); % B Phase 3830
            pH_ind  = find(strcmp('pH(V)',  float_vars) == 1); % pH
            F_ind = find(strcmp('FSig',   float_vars) == 1); % CHL fluor
            Bb_ind  = find(strcmp('BbSig',  float_vars) == 1); % Backscatter
            NO3_ind = find(strcmp('no3',    float_vars) == 1); % Nitrate
        else
            float_vars = data.hr_hdr; %get msg file hdr (HiRes for NAVIS)
            iP_H   = find(strcmp('p',      float_vars) == 1); % CTD P
            iT_H   = find(strcmp('t',      float_vars) == 1); % CTD T
            iS_H   = find(strcmp('s',      float_vars) == 1); % CTD S
            To_ind_H  = find(strcmp('O2tV',   float_vars) == 1); % optode temp
            Oph_ind_H = find(strcmp('O2ph', float_vars) == 1); % O2phase
            pH_ind_H  = find(strcmp('phV',  float_vars) == 1); % phase volts
            pHT_ind_H  = find(strcmp('phT',  float_vars) == 1); % pH
            F_ind_H = find(strcmp('Fl',   float_vars) == 1); % CHL fluor
            Bb_ind_H  = find(strcmp('Bb',  float_vars) == 1); % Backscatter
            NO3_ind_H = find(strcmp('no3',    float_vars) == 1); % Nitrate

            float_vars = data.lr_hdr; %get msg file hdr (LoRes for NAVIS)
            iP_L   = find(strcmp('p',      float_vars) == 1); % CTD P
            iT_L   = find(strcmp('t',      float_vars) == 1); % CTD T
            iS_L   = find(strcmp('s',      float_vars) == 1); % CTD S
            To_ind_L  = find(strcmp('O2tV',   float_vars) == 1); % optode temp
            Oph_ind_L = find(strcmp('O2ph', float_vars) == 1); % O2phase
            pH_ind_L  = find(strcmp('phV',  float_vars) == 1); % phase volts
            pHT_ind_L  = find(strcmp('phT',  float_vars) == 1); % pH
            F_ind_L = find(strcmp('Fl',   float_vars) == 1); % CHL fluor
            Bb_ind_L  = find(strcmp('Bb',  float_vars) == 1); % Backscatter
            NO3_ind_L = find(strcmp('no3',    float_vars) == 1); % Nitrate
        end
        %         if i==2
        %         end
        % CHECK AANDERAA OPTODE INDICE TYPE & SET TO COMMON NAME___________________
        
        if strcmp(cal.O.type,'3830')
            iPhase = BPh_ind;
            Nair_cols = 2;
            iTuse = iT; %slow T response on 3830 optode; use CTD temp
            iTopt = To_ind; %replicate here (this is messy!!)
        elseif strcmp(cal.O.type,'4330') || (strncmp(cal.O.type,'SBE83',5) && strcmp(floatTYPE,'APEX')==1)
            iPhase = TPh_ind;
            iTuse = iT;
            iTopt = To_ind;
            Nair_cols = 3;
        elseif (strncmp(cal.O.type,'SBE83',5) && strcmp(floatTYPE,'NAVIS')==1)
            %             iPhase = TPh_ind;
            %             iTuse = iT;
            %             iTopt = To_ind;
            %             Nair_cols = 3;
            iPhase_H = Oph_ind_H; %HiRes
            iPhaseV_H = To_ind_H;
            iTuse_H = iT_H;
            iPhase_L = Oph_ind_L; %LoRes
            iPhaseV_L = To_ind_L;
            iTuse_L = iT_L;
        else
            iPhase_H = Oph_ind_H; %HiRes
            iPhaseV_H = To_ind_H;
            iTuse_H = iT_H;
            iPhase_L = Oph_ind_L; %LoRes
            iPhaseV_L = To_ind_L;
            iTuse_L = iT_L;
        end

        if ~isnan(data.cast) % 000.msg files not from true cast
            if (data.cast == 1) && strcmp(MBARI_ID,'12768')==1 %Force lat and lon for first cycle to that in 000.msg
                g = data.gps;
                g(1,2) = 189.999;
                g(1,3) = -71.009;
                gps(k,:) = g  ;
            elseif size(data.gps,1) > 1 % if more than one gps fix, take median
                g = median(data.gps);
                gps(k,:) = g;
            else
                g = data.gps;
                gps(k,:) = g;
            end



            % CHECK FOR BAD GPS TIME TM 8/30/21
            % WE ARE GETTING TIME FROM PROFILE TERMINATION TIME NOT GPS FIX TIME!!!
            [last_cast, missing_casts, first_sdn] = get_last_cast(dirs.mat, ...
                cal.info.WMO_ID);
            if ~isempty(first_sdn) && ~isempty(gps)
                INFO.sdn = gps(k,1);
                dvec = datevec(INFO.sdn);
                if INFO.sdn > first_sdn + 365*20 && dvec(1) == 2099 % 20 yrs from start?
                    disp(['GPS time for this profile is > 20 years past start ', ...
                        '- gps week day number bug?!!'])
                    %dvec = datevec(INFO.sdn); % I think this should be moved above 2nd IF? jp 06/20/21
                    dvec(1)  = 1999; % per aoml suggestion don't quite understand jump to 2099
                    INFO.sdn = datenum(dvec) + 1024*7;
                elseif INFO.sdn < first_sdn % bad gps time fix 10/30/19
                    disp('GPS time for this profile is unreasonable - gps week day number bug!!')
                    disp(['days since first profile = ',num2str((INFO.sdn - ...
                        first_sdn),'%0.0f')]);
                    INFO.sdn = INFO.sdn + 1024*7;
                end
            end
            gps(k,1)=INFO.sdn;

            d{k} = data;
            % AIRCAL PROCESSING (NO NAVIS)
            % 11/18/19 JP There are 3 flavors of measurement pairs for air bladder
            % inflation (data.aircal). The 1st 4 are at surface & the last 8 are in air
            % APF9 4@ ~100 & 8@127
            % APF11 bug 4@209 & 8@193 (intenal float pressure vs bladder pressure
            % APF11 4@125 & 8@155 new readings
            
            %% TM 09/29/2020 Modified to fit all firmware cases (and cases where there are more than 4 near-sfc samples in in-air sequence, ie float 12652.
            % This approach keys off of pneumatic pressure.  Performs a diff to find the jump (transition to in-air from near-sfc sampling)
            if isfield(data,'aircal')~=0 && ~isempty(data.aircal)
                diffPneuPres = abs(diff(data.aircal(:,2)));
                Xmax = find(diffPneuPres == nanmax(diffPneuPres));
                MAXind = Xmax+1; %index of start of true in-air.  Should reflect a large shift in pneumatic pressure.
                Bdef_s = 1:Xmax; %indices of air-cal surface samples
                Bdef_a = MAXind:size(data.aircal,1);
                ac_s = data.aircal(Bdef_s,:);
                ac_a = data.aircal(Bdef_a,:);
                fltnum = regexp(MBARI_ID,'\d*','match','once');
                if str2num(fltnum)>18000 %18xxx series of Apf11 with bad bladder.  Should really do a check on firmware version and add range check to all pneum pres
                    xx = find(ac_a(:,2) < 150 | ac_a(:,2) > 160);
                    %                     ac_a
                    %                     pause
                    ac_a(xx,3:end) = nan;
                end
                aircal_surf = [aircal_surf;[repmat(data.cast,size(ac_s,1),1) ac_s]];
                aircal_air = [aircal_air;[repmat(data.cast,size(ac_a,1),1) ac_a]];
            end
            if ~isempty(data.air)
                if size(data.air,2) ~=3
                    nancol = NaN(size(data.air,1),1); %because some older 4330s do not carry RPhase...
                else
                    nancol = [];
                end
                
                % if size(data.air,1) == size(data.gps,1) %if sdn fix for each air msmt
                %     if strncmp(cal.O.type,'SBE83',5)
                %         airk = [data.gps(:,1) repmat(data.cast,size(data.air,1),1) data.air nancol]; %use gps fix sdn for each sample sdn
                %     else
                %         airk = [data.gps(:,1) repmat(data.cast,size(data.air,1),1) data.air nancol]; %use gps fix sdn for each sample sdn
                %     end
                % else
                %     if strncmp(cal.O.type,'SBE83',5)
                %         %airk = [repmat(data.sdn,size(data.air,1),1) repmat(data.cast,size(data.air,1),1) data.air(:,2) data.air(:,1) nancol]; %else use profile sdn for all aircal msmts
                %         airk = [repmat(data.sdn,size(data.air,1),1) repmat(data.cast,size(data.air,1),1) data.air nancol]; %else use profile sdn for all aircal msmts
                %     else
                %         airk = [repmat(data.sdn,size(data.air,1),1) repmat(data.cast,size(data.air,1),1) data.air nancol]; %else use profile sdn for all aircal msmts
                %     end
                % end
                % LG 11/06/2024: Errors were getting thrown for the above code having redundant if statement blocks.
                % I'm keeping them in case something goes awry, but this statement below is functionally identical.
                if size(data.air,1) == size(data.gps,1) %if sdn fix for each air msmt
                    airk = [data.gps(:,1) repmat(data.cast,size(data.air,1),1) data.air nancol]; %use gps fix sdn for each sample sdn
                else
                    airk = [repmat(data.sdn,size(data.air,1),1) repmat(data.cast,size(data.air,1),1) data.air nancol]; %else use profile sdn for all aircal msmts
                end
            else
                airk = [];
            end
            air = [air;airk];

            %PROFILE DATA PROCESSING (APEX AND NAVIS)__________________________________
            if strcmp(floatTYPE,'APEX')==1 %lores for APEX
                lng_lr_d = size(data.lr_d,1); %LoRes data exist for APEX?
                if lng_lr_d > 0
                    rd = [repmat(data.sdn,lng_lr_d,1) repmat(data.cast,lng_lr_d,1), ...
                        repmat(g(1,3),lng_lr_d,1) repmat(g(1,2),lng_lr_d,1), ...
                        data.lr_d(:,iP) data.lr_d(:,iT) data.lr_d(:,iS)];
                    raw_data = [raw_data; rd];
                    Otmp = [repmat(data.sdn,lng_lr_d,1) repmat(data.cast,lng_lr_d,1) data.lr_d(:,iS) ...
                        data.lr_d(:,iP) data.lr_d(:,iTuse) data.lr_d(:,iPhase) data.lr_d(:,iTopt)];
                    O2prof = [O2prof; Otmp];
                end
            else % NAVIS
                lng_hr_d = size(data.hr_d,1); %HiRes data exist for NAVIS?
                lng_lr_d = size(data.lr_d,1); %LoRes data exist for NAVIS?
                if lng_lr_d > 0
                    rd = [repmat(data.sdn,lng_lr_d,1) repmat(data.cast,lng_lr_d,1), ...
                        repmat(g(1,3),lng_lr_d,1) repmat(g(1,2),lng_lr_d,1), ...
                        data.lr_d(:,iP_L) data.lr_d(:,iT_L) data.lr_d(:,iS_L)];
                    raw_data = [raw_data; rd];
                    Otmp = [repmat(data.sdn,lng_lr_d,1) repmat(data.cast,lng_lr_d,1) data.lr_d(:,iS_L) ...
                        data.lr_d(:,iP_L) data.lr_d(:,iTuse_L) data.lr_d(:,iPhase_L) data.lr_d(:,iPhaseV_L)];
                    O2prof = [O2prof; Otmp];
                end
                if lng_hr_d > 0
                    rd = [repmat(data.sdn,lng_hr_d,1) repmat(data.cast,lng_hr_d,1), ...
                        repmat(g(1,3),lng_hr_d,1) repmat(g(1,2),lng_hr_d,1), ...
                        data.hr_d(:,iP_H) data.hr_d(:,iT_H) data.hr_d(:,iS_H)];
                    raw_data = [raw_data; rd];
                    Otmp = [repmat(data.sdn,lng_hr_d,1) repmat(data.cast,lng_hr_d,1) data.hr_d(:,iS_H) ...
                        data.hr_d(:,iP_H) data.hr_d(:,iTuse_H) data.hr_d(:,iPhase_H) data.hr_d(:,iPhaseV_H)];
                    O2prof = [O2prof; Otmp];
                end
            end
            DATA.msgfiles = [DATA.msgfiles;msg_file];
            k=k+1;
            DATA.Nprof = DATA.Nprof+1;
            waitbar(i/size(themsgfiles,1),WB)
        end %end ~isnan(data.cast)
    end %end i = 1:size(themsgfiles,1)

    % First, use near-surface profile salinity for near-surface in-air msmt
    if ~isempty(aircal_surf)
        xcast = unique(O2prof(:,2));
        kj=1;
        for kc = 1:length(xcast)
            casttmp = O2prof(O2prof(:,2)==xcast(kc),:);
            mp = find(casttmp(:,4) == min(casttmp(:,4)));
            mysal(kj,1) = xcast(kc);
            mysal(kj,2) = casttmp(mp,3);
            kj=kj+1;
        end

        % 06/07/24. This block of code breaks the aircal_surf asignment
        % around line 467 for float ua20496 because cycles 71,72,73 are
        % missing profile data (stuck on bottom) and thus the mysal variable
        % but data exist for aircalcasts variable the OptodeAirCal P = 960
        % (stuck on bottom) so not a true in air meaurement

        % mysalfinal = [];
        % aircalcasts = unique(aircal_surf(:,1));
        % for acs = 1:length(aircalcasts)
        %     tmsf = find(aircal_surf(:,1)==aircalcasts(acs));
        %     mysaltmp = mysal(mysal(:,1)==aircalcasts(acs),2);
        % 
        %     msft = repmat(mysaltmp,length(tmsf),1);
        %     mysalfinal = [mysalfinal;msft];
        % end

        aircalcasts = unique(aircal_surf(:,1));
        mysalfinal = NaN(size(aircal_surf,1),1);
        for acs = 1:length(aircalcasts)
            tmsf     = find(aircal_surf(:,1)==aircalcasts(acs));
            mysaltmp = mysal(mysal(:,1)==aircalcasts(acs),2); % scalar pasl value
            if ~isempty(mysaltmp)
                mysalfinal(tmsf) = mysaltmp;
            end
        end
    end

    %__________________________________________________________________________
    % ORGANIZE O2 PHASE ARRAYS FOR CONSISTENCY
    % [sdn, cast, s, p, t, phase, (Tvolt)]
    % Each entry in cell array contains different 'flavor' of O2 data
    % {1} = O2 profile data
    % {2} = O2 air cal measurements taken during each GPS fix
    % {3} = "new method" O2 air cal measurements, taken in water, pre
    %        bladder inflation.
    % {4} = "new method" O2 air cal measurements, taken in air, post
    %        bladder inflation.
    %__________________________________________________________________________
    % aircal_surf = [aircal_surf(:,2) aircal_surf(:,1) zeros(size(aircal_surf,1),1)...
    if isempty(air) && isempty(aircal_air)
        mbx = msgbox({'NO AIR CAL MEASUREMENTS EXIST FOR THIS FLOAT.' ...
            'WILL CALIBRATE SURFACE TO WOA.'},'Error','error');
    elseif ~isempty(air)
        if strcmp(floatTYPE, 'NAVIS')
            air = [air(:,1) air(:,2) zeros(size(air,1),1) zeros(size(air,1),1) air(:,4:5)];
        else
            air = [air(:,1) air(:,2) zeros(size(air,1),1) zeros(size(air,1),1) air(:,3:4)];
        end
        if ~isempty(aircal_air)
            if strcmp(floatTYPE, 'NAVIS')
                aircal_surf = [aircal_surf(:,2) aircal_surf(:,1) mysalfinal...
                    aircal_surf(:,4) aircal_surf(:,end) aircal_surf(:,end-1)];

                aircal_air = [aircal_air(:,2) aircal_air(:,1) zeros(size(aircal_air,1),1)...
                    aircal_air(:,4) aircal_air(:,end) aircal_air(:,end-1)];
            else
                aircal_surf = [aircal_surf(:,2) aircal_surf(:,1) mysalfinal...
                    aircal_surf(:,4) aircal_surf(:,5) aircal_surf(:,6)];

                aircal_air = [aircal_air(:,2) aircal_air(:,1) zeros(size(aircal_air,1),1)...
                    aircal_air(:,4) aircal_air(:,5) aircal_air(:,6)];
            end
        end
    end

    O2phase{1} = O2prof;
    O2phase{2} = air;
    O2phase{3} = aircal_surf;
    O2phase{4} = aircal_air;
    %__________________________________________________________________________
    % LOOP THROUGH DIFFERENT O2 MEASUREMENT GROUPS AND CALCULATE O2 VALUES
    %[sdn, cast, S, P, T, Phase,  O2, O2sol, pO2, pH20, O2Sat]; % umol /L & % sat
    %__________________________________________________________________________
    for ii = 1:length(O2phase)
        if ~isempty(O2phase{ii})
            mydata = O2phase{ii};
            if ii == 1 %profile data
                % Look for bad phase value
                t_phase = mydata(:,6) < 10 | mydata(:,6) > 70; % from argo-parameters-list-core-and-b.xlsx
                if sum(t_phase) > 0
                    bad_phase = mydata(t_phase,:);
                    mydata=mydata(~t_phase,:); % remove bad o2 line
                    disp([num2str(sum(t_phase)), ' rows with bad Phase values removed in profile data.'])
                    %             disp(bad_phase);
                end
            else %aircal data
                %Look for bad phase or topt value (can't use ctd T for
                %aircal msmnts)
                if ii == 3
                    t_phase = mydata(:,6) < 10 | mydata(:,6) > 70 | mydata(:,5) < -2 | mydata(:,5) > 40; % from argo-parameters-list-core-and-b.xlsx
                else
                    t_phase = mydata(:,6) < 10 | mydata(:,6) > 70; % from argo-parameters-list-core-and-b.xlsx
                end
                if sum(t_phase) > 0
                    bad_topt = mydata(t_phase,:);
                    %                     mydata=mydata(~t_phase,:); % remove bad phase or topt lines
                    mydata(t_phase,3:6) = nan; %replace bad data with nans, keep date and cycle for indexing in sageO2 plotter (want all 'flavors' of aircal to have the same #of cycles
                    disp([num2str(sum(t_phase)), ' rows with bad Phase or Topt values removed in aircal data.'])
                end
            end
            if strcmp(floatTYPE,'APEX')==1 && ~strncmp(cal.O.type,'SBE83',5)
                % mydata = [sdn, cast, s, p, t, phase (V)]
                tmp = calc_O2_4ARGO(mydata(:,3), mydata(:,5), mydata(:,4), mydata(:,6), mydata(:,5), cal.O); %[S, T, P, Phase, CalPhase, O2, O2sol, pO2]; % umol /L & % sat
                T = tmp(:,2); %tempterature
                S = tmp(:,1); %salinity
                TK     = tmp(:,2) + 273.15;
                DENS = density(S,T);
                DENSfac = DENS;
                pH2O   = exp(52.57 -(6690.9./TK) - 4.681 .* log(TK)); %from Atamanchuk et al, 2014.
                O2Sat = tmp(:,end) ./ ((1013.25- pH2O) * 0.20946) * 100;
                %                ii
                %                 O2data_temp = [O2phase{ii}(:,1:6) tmp(:,6:8) pH2O O2Sat]; %[sdn, cast, S, P, T, Phase,  O2, O2sol, pO2, pH20, O2Sat]; % umol /L & % sat  %%%O2 params will be "NaN" if Phase value is out of range.
                O2data_temp = [mydata(:,1:6) tmp(:,6:8) pH2O O2Sat]; %[sdn, cast, S, P, T, Phase,  O2, O2sol, pO2, pH20, O2Sat]; % umol /L & % sat  %%%O2 params will be "NaN" if Phase value is out of range.
                O2data_temp(:,7) = (O2data_temp(:,7)./DENSfac).*1000;
                O2data_temp(:,8) = (O2data_temp(:,8)./DENSfac).*1000;
                O2data{ii} = O2data_temp;
            else
                td = O2phase{ii};
                %if strcmp(cal.O.type,'SBE83')
				if strncmp(cal.O.type,'SBE83',5)
                    if ii == 1
                        tmp_data = [td(:,4) td(:,5) td(:,3) td(:,6) td(:,7)]; %P,ctdT,S,Ph,optT
                    else
                        tmp_data = [td(:,4) nan(size(td,1),1) td(:,3) td(:,6) td(:,5)]; %P,[uses optode T],S,Ph,optT
                    end
                else
                    tmp_data = [td(:,4) td(:,5) td(:,3) td(:,6) td(:,7)]; %P,ctdT,S,Ph,optV
                end
                %                 [pO2, pH2O, O2_uM, O2_T] = Calc_SBE63_O2(tmp_data, cal.O,cal.O.type);
                [pO2, pH2O, O2_uM, O2_T] = Calc_SBE63_O2(tmp_data, cal.O,Optode_tempVorC{ii});

                S = tmp_data(:,3);
%                 T = tmp_data(:,2);
                T = O2_T;
                TK     = T + 273.15;
                DENS = density(S,T);
                O2 = O2_uM./DENS*1000;
                O2sol = oxy_sol(T,S,0);
                O2Sat = 100*(O2./O2sol);
                if ~strncmp(cal.O.type,'SBE83',5)
                    pO2 = nan(length(O2sol),1);  %in seawater
                    pH2O = nan(length(O2sol),1); %cuz in seawater
                else
                    pH2O = exp(52.57 -(6690.9./TK) - 4.681 .* log(TK));
                end
                O2data{ii} = [O2phase{ii}(:,1:6) O2 O2sol pO2 pH2O O2Sat];

            end
        else
            O2data{ii} = [];
        end
    end %end for ii = 1:length(O2phase)

    %__________________________________________________________________________
    % PERFORM SOME AVERAGING OF AIR O2 VALUES TO GET ONE PER CAST FOR
    % PLOTTING AGAINST CLIMATOLOGY ((BUT MAINTAIN A STRUCTURE HOLDING THE
    % DIFFERENT MEASUREMENT GROUPS, AIR, AIRCAL_SURF, AIRCAL_AIR)).
    %__________________________________________________________________________

    if ~isempty(O2data{2}) && sum(isnan(O2data{2}(:,3)))~=size(O2data{2},1)  %if aircal data exists (for 12768, the variable isn't empty because it should have in-air, but mostly nans because no surface sequence yet) 1/10/19
        castnums = unique(O2data{2}(:,2)); %unique cast numbers for air vals
        avgj = NaN(length(castnums),size(O2data{2},2));
        stdj = NaN(length(castnums),size(O2data{2},2));
        for jj = 2:length(O2data) %exclude profile data
            tmpO = O2data{jj};
            if ~isempty(tmpO)
                for j = 1:length(castnums)
                    %castnums(j)
                    outj = tmpO(:,2)==castnums(j);
                    %                     avgj(j,:) = nanmean(tmpO(outj,:),1);
                    TMPO = tmpO(outj,:);
                    if ~isempty(TMPO)
                        if size(TMPO,1) == 1
                            avgj(j,3:end) = TMPO(:,3:end);
                        else
                            avgj(j,3:end) = nanmedian(TMPO(:,3:end),1); %should really be using median?
                        end
                        avgj(j,1) = nanmean(tmpO(outj,1),1); %maintain sdn and cast number columns for standard deviation matrix
                        avgj(j,2) = nanmean(tmpO(outj,2),1);
                        stdj(j,3:end) = std(tmpO(outj,3:end),0,1);
                        stdj(j,1) = nanmean(tmpO(outj,1),1); %maintain sdn and cast number columns for standard deviation matrix
                        stdj(j,2) = nanmean(tmpO(outj,2),1);
                    else
                        avgj(j,1) = nan; %maintain sdn and cast number columns for standard deviation matrix
                        avgj(j,2) = nan;
                        stdj(j,3:end) = nan;
                        stdj(j,1) = nan; %maintain sdn and cast number columns for standard deviation matrix
                        stdj(j,2) = nan;
                    end
                end
                O2air_avgd{jj-1} = avgj;
                O2air_std{jj-1} = stdj;
            else
                O2air_avgd{jj-1} = [];
                O2air_std{jj-1} = [];
            end
        end
    else
        O2air_avgd = [];
        O2air_std = [];
    end


    %__________________________________________________________________________
    % ASSIGN OUTPUT STRUCTURE VARIABLES
    %__________________________________________________________________________
    gps(gps(:,2)<0,2) = gps(gps(:,2)<0,2)+360;
    p = [ d{:} ];
    cast = [ p(:).cast ];
    sdn = [ p(:).sdn ];
    DATA.profs = d;
    t_nan           = isnan(gps(:,3)); % flag missing lon casts
    missing_pos_str = '';
    interp_pos_str  = '';
    %     misscasts = cast(t1);

    if sum(t_nan) > 0 % missing lon and lat

        diff_nan   = [0;diff(t_nan)]; % 1 = start of NaN, -1 = start of good
        nan_start  = find(diff_nan == 1);
        nan_end    = find(diff_nan == -1) - 1;

        % MAKE SURE 1st STARTING INDEX IS GREATER THAN 1st ENDING INDEX 11/19/18 - jp
        % IF NOT REMOVE 1st ENDING INDEX (float starts with Bad position fix
        %        if nan_start(1) > nan_end(1)
        %            nan_end(1) = [];
        %        end
        % some interp may be possible - resize to complete bounds only
        % # of start indices should equal # of end indices
        if size(nan_start,1) > size(nan_end,1) % more starts than ends, no last profile
            nan_start = nan_start(1:size(nan_end,1));
        elseif size(nan_start,1) < size(nan_end,1) % more ends than starts
            nan_end = nan_end(2:end); % 1st profile doesn't have a position
        elseif nan_end(1)<nan_start(1) && nan_start(end)>nan_end(end) % same number of starts, ends, but don't line up cuz missing positions at both beginning and end
            nan_end = nan_end(2:end);
            nan_start = nan_start(1:end-1);
        end

        for i = 1 : size(nan_start,1)
            % no upper bound, can't interpolate, move on
            if isempty(nan_end)
                break
            end

            % all good now, nan's bounded at this point, procede to interp
            if size(nan_start,1) == size(nan_end,1)
                bnds = gps([nan_start(i)-1,nan_end(i)+1],:); % bounds
                bait = gps(nan_start(i):nan_end(i),:); % data to interp
                % Meridian crossing - float unlikely to move more than 180 deg
                if abs(bnds(2,2) - bnds(1,2)) > 180
                    t1 = bnds(:,2) < 180;
                    bnds(t1,2) = bnds(t1,2) + 360; % temp add 360 to small side
                end
                missing_pos = [bait(:,1), ...
                    interp1(bnds(:,1),bnds(:,2:3),bait(:,1))]; %sdn lon lat
                % bring meridian crossing back to reality if need be
                t1 = missing_pos(:,2) > 360;
                missing_pos(t1,2) = missing_pos(t1,2) - 360;
                gps(nan_start(i):nan_end(i),2:3) = missing_pos(:,2:3);
                %                 for j = 1:size(missing_pos,1) % step through casts
                %                     t1 = rdata(:,1) == missing_pos(j,1);
                %                     rdata(t1,2:4) = ones(sum(t1),1) * missing_pos(j,2:4); % matrix
                %                     rdata(t1,5)  = 3; %set QF to 3, ODV coversion takes it to 4
                %                     if strcmp(info.float_type, 'APEX')
                %                         t1 = hrrdata(:,1) == missing_pos(j,1);
                %                         hrrdata(t1,2:4) = ones(sum(t1),1) * missing_pos(j,2:4);
                %                         hrrdata(t1,5)  = 3; %set QF to 3, ODV coversion takes it to 4
                %                     end
                %
                %                 end
            end
        end
        clear diff_nan nan_start nan_end bnds bait i j t1

        % NOW ASSES WHAT HAS BEEN INTERPOLATED AND WHAT HAS NOT
        t_nan2 = isnan(gps(:,3)); % Still any nan's in LAT? NO INTERP YET
        t_nan3 = t_nan & ~t_nan2; % used to be nan's but now interpolated
        if sum(t_nan3 > 0) % Interpolated values
            interp_pos_str = ['Missing Float position interpolated for ', ...
                'station(s): ', sprintf('%0.0f ',cast(t_nan3))];
            %             interp_pos_str = [interp_pos_str,'\r\n//Latitude quality flag = 4',...
            %                 ' for interpolated float positions'];
            disp(interp_pos_str)
        end
        if sum(t_nan2 > 0) % Could not interpolate these casts
            missing_pos_str = ['No position for station(s): ', ...
                sprintf('%0.0f ',cast(t_nan2))];
            disp(missing_pos_str)
            %             rdata(isnan(rdata(:,4)),5) = 99;  % BIO ARGO MISSING DATA QF VALUE
            %             if strcmp(info.float_type, 'APEX')
            %                 hrrdata(isnan(hrrdata(:,4)),5) = 99;
            %             end

        end
        %         adata(:,3:5) = rdata(:,3:5); % ADJUSTED POSITIONS EQUAL RAW
        %         %clear t_nan t_nan2 t_nan3
    end
    clear diff_nan nan_start nan_end







    %        d_format = 'mm/dd/yy HH:MM';
    %        gps(t1,2:3) = interp1(gps(~t1,1),gps(~t1,2:3),gps(t1,1),...
    %                       'linear','extrap'); % interpolated missing lat and lon
    %        tmp         = tmp(t1,:); % just missing cast now
    %        [r,~]       = size(tmp);
    %        for i = 1:r % step through profiles missing data and fill in w/ interp
    %            t1 = data(:,2) == tmp(i,2);
    %            data(t1,3) = tmp(i,3);
    %            data(t1,4) = tmp(i,4);
    %            disp(['Missing lon & lat interpolated for: Profile ',...
    %                num2str(tmp(i,2)),'   ',datestr(tmp(i,1),d_format),'   ',...
    %                num2str(tmp(i,3),'%3.3f'),'   ',num2str(tmp(i,4),'%3.3f')]);
    %        end
    %     end
    DATA.track = [gps(:,1) cast' gps(:,2:3)];
    DATA.PTSdata = raw_data; %pres, temp, salinity data; not QC'd
    DATA.PTSdata_hdr = {'sdn','cast','lat','lon','p','t','s'};
    DATA.O2phase=O2phase; %[sdn, cast, s, p, t, phase]
    DATA.O2data=O2data;
    DATA.O2air{1} = O2air_avgd; %averages for air cal samples
    DATA.O2air{2} = O2air_std;  %standard deviations for air cal samples


    % CHECK BAD SENSOR LIST FOR BAD O2 PROFILES & REMOVE FROM PROFILE DATA
    % WHY is O2data a 1x4 cell array?  TM: The answer is because there are 4
    % 'flavors' of O2data that we want to carry along (although I realize that in hindsight there is probably a cleaner approach!):
    % (1) profile O2 data
    % (2) telemetry phase in-air data
    % (3) in-air sequence near-sfc data
    % (4) in-air sequence in-air data
    if exist([dirs.cal,'bad_sensor_list.txt'],'file') && ...
            exist('parse_bad_sensor_list.m','file')
        bad_sensor_list = parse_bad_sensor_list([dirs.cal,'bad_sensor_list.txt']);
        iM   = find(strcmp('MBARI ID STR',bad_sensor_list.hdr) == 1);
        iSEN = find(strcmp('SENSOR',bad_sensor_list.hdr) == 1);
        iCYC = find(strcmp('CYCLES',bad_sensor_list.hdr) == 1);
        iBLK = find(strcmp('CYCLE BLOCKS',bad_sensor_list.hdr) == 1);
        tSENSOR = strcmp(MBARI_ID, bad_sensor_list.list(:,iM)) & ...
            strcmp('O', bad_sensor_list.list(:,iSEN));
        tf_BSL = 1;
    else
        tf_BSL = 0;
    end
    if tf_BSL == 1 && sum(tSENSOR) > 0 % won't check tSENSOR unless tf_BSL = 1
        disp([MBARI_ID,' found on the bad sensor list!'])
        BSL = bad_sensor_list.list(tSENSOR,:); % should only be 1 line for O2
        bad_cyc = BSL{iCYC};
        bad_blk = BSL{iBLK};
        Lia = ismember(O2data{1,1}(:,2),bad_cyc); % flag bad cycles. handles bad_cyc = []
        O2data{1,1}(Lia,:) =[]; % remove bad individual profiles from data

        %OK NOW DO THE SAME FOR CYCLE BLOCKS IF THEY EXIST
        if ~isempty(bad_blk)
            for blk_ct = 1:size(bad_blk,1)
                tf = O2data{1,1}(:,2) >= bad_blk(blk_ct,1) & ...
                    O2data{1,1}(:,2) <= bad_blk(blk_ct,2);
                O2data{1,1}(tf,:) =[]; % remove bad cycle blocks
            end
        end
        DATA.O2data=O2data;
        clear iM iSEN iCYC iBLK tSENSOR tf_BSL Lia bad_cyc bad_blk tf
    end

else  % if ~isempty(themsgfiles); else
    warning('There are no .msg files to parse');
    msgbox('WARNING: There are no .msg files to parse.','WARNING')
end %end if ~isempty(themsgfiles)
close(WB)
%end % end getall_APEX_floatdata_sO2


