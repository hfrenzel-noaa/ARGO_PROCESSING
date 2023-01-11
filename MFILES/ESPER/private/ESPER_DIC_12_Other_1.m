function [Y,Xf,Af] = ESPER_DIC_12_Other_1(X,~,~)
%ESPER_DIC_12_OTHER_1 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Feb-2021 18:30:14.
% 
% [Y] = ESPER_DIC_12_Other_1(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 6xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1;-0.999998793562952;-77.961;0;29.715;-0.1386];
x1_step1.gain = [1.00000000274156;1.00000063368067;0.0138606862425759;0.0002963841138115;0.248478071810163;0.00826143816767911];
x1_step1.ymin = -1;

% Layer 1
b1 = [5.9696870268356487799;-1.9154909418303456281;-3.6426782544854692247;-5.5073845989898275732;7.6560850903658090871;-0.63798973893771893096;1.5355274319250025172;0.14380394337787139047;-4.6839002396476558943;-0.5378972009833690171;0.94739469035455092794;-1.5696320991115750854;-2.1012273617322816399;-1.5547466988742124627;0.378117222123382557;0.4680064062982455253;0.58910802905139625363;-5.211662563863646902;6.9390518781082501931;0.31881447331674084289;0.65470294905269221797;-1.4762416602510319841;-4.1207839124327749758;-6.6488778647388713239;-1.6625887303469766287;-7.9812801545428193606;-2.5604462783864776476;2.7277152319223705312;-5.7150182544615750757;-0.43540863430878212759;2.6214948627965766192;5.5757149608443148381;-0.67900745039084864363;-5.3664203545955011521;0.28525894513476385272;2.3189294540810050371;-1.6016029607391937262;-0.3234979341816970333;3.5971093026385725366;-0.62550967251134559355];
IW1_1 = [-0.16247790539026252254 0.0097261107499744536842 -0.45786358040114999435 -0.087409569287678276495 -0.71001869103624948298 -0.82146693985160212925;0.039727349767148374682 0.028242565551037934757 1.0218642170590148677 -1.0703332102139651028 0.068651048640585465854 -1.6538757920358895248;9.9782825398930352634 4.4671315992340456802 -5.3685532983721779843 -0.3596909660012641563 -2.068621102543198198 1.7015478869110323146;-0.004296911145535170333 -0.1130164191519716782 0.18034123936298068758 -2.8027302374744738067 0.69778641858642032059 -1.5758418282007531364;-0.024182155264578907711 0.095125191313422452488 0.14517625805429656971 3.9385698773721045107 -0.75455016729293000743 3.7471599372166970454;0.035769281656771234612 -0.062509388215457303839 -1.926954112665205221 0.80741166207265735455 -0.35407628597038626195 -0.19829485541281577365;-0.22522219536787158045 0.1223662548127051608 0.074894737991458584792 -0.19792902804433953889 -0.47787783457525084829 1.5996890044732534619;-0.08056830416271201778 0.047051683932733345817 1.7732281285492510481 0.27444085783131272338 0.78602203798035730209 -1.0868873051632643723;1.6101929363684472918 0.68095372266047893284 -5.6949263422355969055 1.7590012899589915207 4.9972548696115879352 -3.0886364820362497419;-0.29284139202595743656 1.1703473628281464425 -0.0078342589974457477187 -0.91729374650282291537 -0.21468383109376756868 1.8875931095047078223;2.2375789575819560184 4.5409444220529540104 -1.4969062749029706794 -0.63813372335996787488 -2.6033643203060430338 3.5431242351672134205;0.049496070241630267528 0.032439413834055789987 0.82294335426078746298 -0.77981147507622294857 0.16517824098926242593 -1.406635141263931299;-5.4008977520808398864 -1.4218314908349576342 0.32344192107456454233 -0.61837898264301405238 2.3861571249912829629 1.3275240979520170903;0.48258982601716421401 -0.13590793638611586847 0.17829062816645635525 0.21874856641084572395 0.63005909614913335748 -1.2523737026298167319;0.29516688274173802364 -1.1854698894512081253 0.024371706317033958039 0.78967665940810272129 0.80131911262199784218 -1.8772392188026441051;0.69320782919504830843 -0.4055505825533920472 0.22119859366333824435 -0.35956299411127162768 -2.4655096143003216724 -0.5409565987624278538;-0.16634984280738049356 -0.14217968138790756938 0.29499525567168766171 -0.66130548684672540993 -2.5778555758823360478 -0.63128293548435787663;-4.6772522813446446577 -1.1180247376270044946 -4.1834234410272719273 3.3889116671805030734 4.6343615126619299716 -8.1467564333095605633;0.011227369148763863271 0.09791203325256929435 -0.33000585084659422863 3.7894500841237404032 -0.67346719809525057432 2.8115874523799098128;-0.087263584282672973513 0.020429172826849067296 1.5170437023911689245 0.23779428192267157427 0.023703479037885583081 -0.79844721507484439638;0.28422320949401908008 -1.1499213295835644111 -0.0052693758334284180461 0.99220905995159047741 -0.25706394190489489926 -1.859820311911144719;0.15526126696185069131 -0.069369236400297004663 0.060315241707479837208 0.018748940526691449532 0.33013498460757190189 -1.7336975509046173016;-2.7528356722693900771 8.423560198314572034 -2.4600312532200305782 0.48829213463582099575 2.1395056833667416285 5.2005368602582464632;0.63399709007400339988 4.6665459295342319734 -0.35254634062654838234 -1.188820897909012908 11.362741339022017328 2.9125244827598950614;0.07088852748295750017 0.042036513266884990847 0.91696612379856834441 -0.93583169564787449524 2.7918173511047785773 -1.721479666166896072;0.025981576611081764333 -0.065613364539110027862 -0.53627862654010582943 -4.0965021683948910081 0.76995373968302216472 -3.8450848915777586789;-6.1116152635974803076 -2.4045007684262400538 0.075351161070434699574 -0.22475226591574992696 7.562825074068108222 1.0343535565761345918;4.8513691226458375283 -1.5121754168950949371 8.5282391286874279501 -0.61206087063070147014 4.2286383100963389481 1.0179621797251259263;-0.064968408470818070355 0.35745335123477112171 -4.1144194768206485691 -1.972327813129997276 0.59031813931369236936 -2.3872297892662488472;0.12395111437388892095 0.054977435522497841713 -1.0993244039545233548 0.61508979881013092772 -0.24188855556653565682 -1.0577987727582551791;1.3673760087613204828 -0.09375335418654681674 -3.5977194910871754807 0.00061418676888363131494 -9.0966046321735731794 -2.1845510543426778227;0.06620120846991432717 -0.3545082187668620044 3.9028853508295262564 1.9727974096038991547 -0.72761670992236271438 2.3451344591776934756;0.070885421237226561852 0.0071287513582235992327 -1.3883149020580314303 0.60503688839205516103 0.2851883648794827919 -0.66307003570233902234;0.98984703700353626754 -0.321736315868935141 4.747778955196647388 -2.2268428187644198069 -2.2090587080667920539 -1.435190566187430905;-0.048042568096072733874 0.82733756211922826473 6.5329972660852613231 3.4097594816335319301 2.7977460329633383473 -1.9337725590655161501;1.2582138939525140398 -1.5490731425510400054 -2.9203548914001280501 0.72094518592091716425 -4.3406511332941830617 -2.2186342757526218428;0.069280168131104560847 -0.86634050678743990126 -5.1492022857639119238 -3.2540089297339984675 4.3683418832994957981 -0.83222695500089938214;-0.16005748130127195328 0.1306713027422433393 0.68963358580587441615 -0.80539488984084639522 2.5262536375513513498 -0.35014375536692798896;2.3187509018166245767 -1.8877270606381966189 -0.92620472751593663219 -0.26359601771283180938 -8.6001961986034736185 -2.3649235790957505721;0.012076037262046446577 -0.0743870831405539501 -2.3116995064496861367 0.9908901371736527075 -0.6970739512880722577 0.20205647055154449254];

% Layer 2
b2 = 2.6200237940281874138;
LW2_1 = [2.6404594484016294942 4.1884056353813932105 0.027356449424654989688 9.8116146107019641676 -5.6307341972696063337 -6.6500625949959886185 7.3551204841626578457 -3.3466019594423834782 -0.039597568784210529502 -9.3434993316967869248 0.022903084006094372171 -7.7797861435455146761 -0.047055678224204769422 2.3238794065015264678 -4.182724519399620533 0.29524960966346991409 0.84223014036862287046 0.021745546090068120643 6.3851876564030973782 4.3757222006976705941 -5.4704304736329678605 5.8369190045647592058 -0.013937404093241859138 0.043780725933425142238 0.99934588339173324734 -3.4110532242954505477 0.043011478642564916763 0.016679567846926889041 2.5480125615529156669 -4.1992486034139435702 -0.04052750256372022325 2.7178448466872962008 8.8861873577904795241 0.24687496639242023644 0.10781347690599892009 -0.078232519686531470926 0.11444062466720705817 -0.77854610610425256656 0.044942516445852016826 2.5607926503646045724];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.00314743155299998;
y1_step1.xoffset = 1774.26765577007;

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