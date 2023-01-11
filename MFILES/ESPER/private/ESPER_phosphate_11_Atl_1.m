function [Y,Xf,Af] = ESPER_phosphate_11_Atl_1(X,~,~)
%ESPER_PHOSPHATE_11_ATL_1 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Feb-2021 18:30:30.
% 
% [Y] = ESPER_phosphate_11_Atl_1(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 7xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.999999996490807;-0.999999994516886;-40;0;9.1619;-177.232103709389;-0.52];
x1_step1.gain = [1.0000000017546;1.00003626070655;0.0153846153846154;0.000309885342423303;0.0656325902039552;0.00425400504498441;0.0145232735458572];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.7984870083274482333;2.0648928686529797183;2.4658517387616378791;4.0474565175065064793;-2.9859517810918956293;1.2347422802761012228;2.1444961946327003588;-1.0201394295932937339;1.7086778520466721076;1.800378841349684178;-2.6862356913027469751;1.3921238435050509175;-2.1433977677421438557;-4.0490107840267937078;0.25285636520383020232;-0.90786647785485330431;-0.43219757248259421667;-0.50115372903911603597;-0.74602265598086758835;-1.3897361419586589104;0.87497212229519172322;-0.55406903803535678676;0.39220018222538904906;0.16042480793337385303;-0.53945908071886528035;0.93334914146442593541;-1.7868501068190967285;-0.49179986058669761251;1.3717319104107743577;0.2332132530485714339;-2.4396818678485043819;1.7610597238396621389;1.2201679387631598761;-2.2689437192158141698;-1.7044042984249987427;-1.639222019541362485;1.2139224116162719014;2.7132450005168591289;0.60415481246971891593;-2.2869509792261855097];
IW1_1 = [-0.43413299163739749176 0.069305250958694206154 -0.42825468193963189822 -0.33013343052943816547 0.4318747468401407108 -1.3060103819365633804 2.7138143535233583137;-0.88373033021346736327 1.8063895511202245903 -2.5115441459794358714 -0.31803014161938758519 0.37869837791453414555 -0.63189538722027116524 0.024693606323832564819;-0.25548289193020606858 -0.23812130921108112802 -0.25383097210003857658 0.88582948390606452982 1.5373148496255071294 -1.6340212666720710377 1.4499107273101254911;0.61534866189760806243 0.32687866070669541196 0.80262879548469190372 1.453743481568931406 -3.1018995337108505872 -1.0236136338989096917 1.7700327592088866968;0.03220439959237421379 1.3294235775488270068 -1.5377611740068841684 -1.0562789762581745734 0.4461629567497417681 -0.31578561551163775167 -1.2670205206997480207;-0.36225848278194239249 -0.034735473477425393707 -1.6652273784044688831 -0.34731925563516080624 -2.2116606230518991438 -0.19869867549606801127 0.9910607306525716087;-0.27848159990044107914 1.0738690898043063982 -1.6383938659160164342 0.068275929968589874064 -0.40184648623197799511 -0.70404271489572745057 -0.62784184096928052909;0.62660964716758149606 0.8553930006713840184 0.5721929471609022988 1.7006215475493522415 -0.5169948521902805183 -0.61548570888585385497 0.38280344120540638064;-0.10759851648388812917 0.18331754762673369008 -1.0893538313356005975 0.18635387385393903381 -0.92064644959746988473 -2.4019567026177610636 0.78714316851365517813;-0.16825881281825588731 -0.013255001560369496227 -1.3744429213282634006 0.63900006313176416217 -3.6757902496690730842 0.69391303220940336871 0.082222829249772852456;0.56386879110199972231 -0.85276206628465756054 0.10862756132178902346 -1.4617155901896004 3.2599224970502067578 -0.081551430385985168581 1.5873882152816902735;-0.11270421593660986948 -1.1968546586726735992 -1.3412823816342094307 0.30899794508815653371 0.47115701237469981288 -1.7317251922816254694 -1.7888332202533816506;-0.10903564717255810612 0.91108040372330356682 -3.1352172876345805186 -0.46729651964723717406 4.2877585383204639413 -1.2245040640384310393 -0.30339229125293365463;-1.2133931508026158941 1.0275680377754059514 -1.0614358772971592693 -0.75540829122254316008 5.0620045408941996001 -2.3811220189051085505 -0.75612027473690202051;-0.45932062615427426966 0.22241283915901138846 1.496276906000088891 -1.2054015711687904311 1.5605255601984597824 -0.29326356180268797758 0.66026088912396796449;1.099285535646895573 1.9310406340636543376 0.1559394413214643671 0.13098068253498976188 -0.67293858518542415403 -2.0485559868684211082 0.1071919921349515914;0.032253308172167823031 -0.21241569886834563152 0.63999593596109949356 -0.80402881963513939123 -2.8510238061763244488 -0.7323007105171338571 -0.94550516545736618124;1.0248525792467253481 1.4596196824113472079 0.72133863124638353259 -0.10716687360692481179 -1.6683157295272852405 -1.4305842013700882376 0.08928209609209993014;0.78407697305506729446 0.039046151900429995618 -1.1166141861625069609 -0.21728569048525636642 1.3789265602966584989 -0.15300363076312767374 -0.5175756755253109187;-0.43572772807808490825 0.51254457430816446895 1.2570487178061351408 -0.31320043650496071086 0.11509252352547624798 -0.72864301693438382479 0.62771095534865695154;-2.177735956051700672 1.5511961595562029359 -0.92156989570452818583 -2.4453298116361503745 0.17881167269561001887 -1.7811936189150678889 -0.93428409428537240178;0.22069657490601435335 -0.45449970689592733564 0.31194086665726683538 -1.1817782882561334024 -2.2476028873596227697 -1.098412918584996012 -1.1039191278363635895;0.18529100527138445131 -0.31186733466940036452 -2.7246564372536172804 -1.9874966319068716469 -0.7643936052664878078 -2.1061729753870310766 -0.40162590627896715967;0.28523341008947966646 -2.2644977617637822576 -0.22843230097331743145 -1.0140265969729680418 -2.3278902739748810191 -0.086160666317203579712 -1.2979227733432758818;-0.85290672765194730509 1.2394358889255538969 0.43629151544599037438 0.55712316133808648111 -1.1470781702947951963 0.90739052280462506594 1.0827477104177791745;1.0302778118442559308 0.17607436338563209333 -1.4354270640423076877 -0.20185112868050839041 0.56506885616824065188 -0.67967334112408761548 0.47517140044240885333;0.14262026271620784068 0.11158371908368558412 0.44186949561675276099 0.87651486346445983688 2.2145033703509100498 0.98572415045967032299 -1.4184390444750059057;-1.6464862827512825039 2.0723123686575748437 1.175951868461996952 -0.19157805439065861419 -0.56802713978759544755 0.37018958582976102534 0.3327345804536671614;0.77768046912558375094 0.50862697360531350377 0.58201500986492082923 -0.83711207951023447471 0.69132170378522794785 -0.10261313239475329528 -1.034679283709442954;0.047591084351405306407 0.020577392204349325561 1.2142460775201491252 -0.084769925150884023468 -1.3724949750937260884 -1.4356170329992601342 -0.30708496024627546239;-1.4359237123228634214 -0.012343341868224579766 1.7796368103613309231 -0.39861661332753078879 -2.6966450426903305626 0.67092403880415507622 0.43680808688873529189;0.77205699610652467335 -0.26758102233803743308 1.7617855277024394578 0.27858480341808011804 -1.1640103644199841781 0.84377602707810317462 -0.86149555351641116108;1.0937818950112758731 1.900323332858128822 1.014867059074340494 0.58501937532431580458 -0.6935177440044805186 0.86585624382642045749 -0.39749618648473739047;0.24319092122360805308 1.0120168188726443859 -0.97484449865341993302 -1.6618301934102410744 -1.3508924274654947606 -0.20950199829631949155 -1.3924376341624824516;-1.4967647600731017743 0.44627971457763032648 -0.041235482281696753115 -1.1267565094678553272 -1.0327832821354074877 1.0456576475413887906 1.8379273876628881013;-0.31372903840320309765 0.72363899876710591208 1.2661784054803797428 1.3070221173552216687 -0.82972733806980492055 1.1882786446604352015 -0.26683989404738783779;1.4443704280937925688 0.080473644888846521117 0.058422965170237206589 1.135430423255231247 -1.1813545266239178222 -1.2636813986115982278 -0.4199424707122194067;1.1332902045388117962 -0.48528169526433367897 -0.18504346808973032301 1.0299375353772810548 -1.506547158962915578 0.26087009686170931078 -0.99621721808908658691;0.14007075573313365613 -0.22132769900654258866 1.0525574403319803984 -0.5925248512432820247 -1.9938331536334366056 -1.4976955346393592272 -0.17184340727337935051;-0.48595595399700408645 1.5625470068008837643 0.88966874034882370559 0.44477184508379685735 1.0806671917762613599 -0.50923043388923883157 -1.5510124405384526636];

% Layer 2
b2 = -1.5348229623646298947;
LW2_1 = [0.59704470424970146336 0.19564350232737254265 -0.85387902405758853153 -0.31228186920253458991 0.74021011991550011988 -0.85942692382186003375 -0.50269635270965162821 0.0981572382993329412 -0.29853717273903440654 1.1912882358945866557 -0.44157919918958438155 0.42927004716759353808 -0.30209139611418917015 -0.24668198316457437547 0.45370409908313658054 -0.36570328020125247859 -1.8012061194389705765 0.34464740179200015202 0.91328649598456412839 1.2187359801999446685 -0.12710799374473405465 0.8250672218251809964 0.11326216848796197278 0.11327934594410493663 -0.20018745702436299694 -0.50124771471952200841 -1.410761989615824552 -0.07459302686216626177 -0.37138869011393421671 1.3152183944100324098 -1.1505797336658891705 0.44894912382583124222 0.11517190300891742838 -0.91250543649263593515 1.1265038415063657329 -0.42253710112097669915 0.092794253053071651394 1.1621583128297547916 -1.5085888300566225873 0.15725230124943959109];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.604229607250755;
y1_step1.xoffset = -0.03;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end