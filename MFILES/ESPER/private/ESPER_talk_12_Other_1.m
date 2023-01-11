function [Y,Xf,Af] = ESPER_talk_12_Other_1(X,~,~)
%ESPER_TALK_12_OTHER_1 neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 12-Jan-2021 17:03:49.
% 
% [Y] = ESPER_talk_12_Other_1(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.999999984769129;-0.999540494077341;-75.751;0;29.715;-0.1386];
x1_step1.gain = [1.00000001035699;1.00022983623563;0.0140762793578401;0.000302617642608564;0.251952632905014;0.00826143816767911];
x1_step1.ymin = -1;

% Layer 1
b1 = [4.6753836383187766;-1.2070812041706434;2.1240977405920569;-0.55256231443033976;-3.5504981502941986;-1.6149408072462985;1.8816287520165496;2.131661526825662;-3.0551229795763666;-0.24365839853188628;2.6664161501100589;-1.9549199927224818;-0.26313121395518863;-2.6639615453341334;-2.8530629481074414;-0.15747836603998758;-2.0884278325573353;-0.59038046839995362;1.0166693793755956;2.8211090074999259;-1.7049371489819514;0.11825630039114252;-1.4884457802523048;-0.14718552627178225;-0.050381552605713122;0.031069454631525818;-0.78030038983733185;-0.60473272720752802;2.2412999996284415;0.55149264688975519;0.45833551848343901;1.7703045510278479;0.90284869932714995;0.23161521207870753;0.62368601606252383;-3.9442377330569069;1.9486968362945025;0.89617417395191645;-1.7920952000828596;3.0400238302867746];
IW1_1 = [-0.057667162253109396 0.21582280928256958 0.38658646263194452 4.184444473109731 1.0513057448309542 1.3183736128786101;0.29517463190912319 -0.27535842725328874 1.6414102091394007 -0.12326960273535291 -0.38694035482840577 -0.8386459052984635;1.267330732567681 1.94474547322666 -0.30683822971183439 -0.61620753283922691 -0.5789462190925132 0.34207501437386062;0.35250485552032912 0.16003709772341959 0.240972779111951 -0.96488675517257561 -1.8093161169509484 -0.030826795374207159;0.76566101756621041 3.9692486940362404 2.5473433943193906 1.6546050799580012 -1.0404577251367535 1.7558433048168165;0.23617154136852864 0.80682936623006152 -0.69225883671800181 0.75642116633674006 3.4047865002335267 -3.9129519811096194;-1.3146827746281275 -1.7385272770345306 0.86626102462601184 0.56870524225727037 -1.9766959320276478 -3.367509070019318;-1.1635795369547266 -3.036558396969558 -2.6877925673428202 -1.5966866555519696 3.1281577018371824 -0.88668065916353533;4.7258117224635692 1.0014640474506842 0.169771013486022 1.7001795147981347 -1.3347754889161332 0.95044479341447874;0.062416390095866664 0.096455564176888609 0.19339828131080813 -0.52193407816452109 2.2938472246156647 -0.97484268472966318;-3.1522345948366453 1.2575180965733548 3.5827241840561048 -3.339907527934777 2.1098153222298142 2.7399317453666172;0.14456045188687602 -0.12559246710864239 -0.44152003528268091 -0.43999361868429471 0.46786498065430426 -0.72114191996532961;1.5078650285353563 0.40074355667822298 -0.75147478788695321 -0.62107265436992665 3.3377841464923588 0.65540280041026455;0.11058702013051787 0.19557074231333205 -3.0415903764555181 0.49527741142929244 3.3654067359556272 -0.22236265843173189;-0.070502015216961478 -4.2295218523064824 -0.054284497771705152 1.5082663530865383 -0.73432125180360908 -1.6528262961022453;-0.40611312467575889 -0.25650556249732703 0.24490572165151131 -0.023060637283616851 0.91412529984372359 -0.35265089569747921;-0.23378719232143114 -0.024993416340641082 -3.3160821983448492 0.18044814855361177 6.2586357813046734 0.066349662177634536;-0.12381918600578759 0.17221286727312193 -0.88907829750383527 -1.1600806671226433 -0.210740371497456 0.013120887610473184;-0.28434873146324074 0.28319691122673041 -1.9217306398527667 -0.20361915700762467 0.4841626279601009 0.65138733901187484;-2.1834122323795704 -3.9332693979009679 3.4981048556563503 -0.20819267674032652 -1.956836077483868 -0.19801796044356476;-3.9110772521449486 -0.99203144192608239 -2.393738845316193 4.0696426219590984 0.82932033947900086 -0.16343398076824367;-0.1863364958022351 0.55151744626355925 0.29851629424386189 -0.67566432981680824 0.66204554310575381 -0.50597339304973299;-1.5908861736395881 1.97788766932389 2.7326925051308928 1.5579178612393421 0.87342440049319714 -4.7404771968155872;1.0031551169833928 -0.72984304215668494 0.67034162354485938 0.22323941745997042 -0.34896298063087944 -0.1269468901196448;0.011071123163293024 -0.016607371694619514 -0.59303206769743444 0.79877186186375326 -0.55009022583105216 -0.59191355685141167;0.62086702004225447 -0.78053730865347581 0.22939321418194047 0.38372302299210642 0.086833132656405548 -0.3674411410166995;0.39943871018582644 -1.4247164736547009 -0.66461296810429138 0.28689715414632277 2.5156991524834531 -1.0026189498318574;-0.057223250371183282 0.18848197909937001 -1.090621286829691 -0.91928836270656611 -0.26721229517908962 0.44656341309769959;1.8416903740029573 -0.33870752999062681 -0.21675241949162627 -1.2568078695839853 -3.227399961908703 2.5617592494049064;0.1797030408569234 -0.29288537213846882 1.5430442740837833 0.88861343771374357 0.37523888290225033 -1.2091230617315978;1.1842443898037294 0.43147976487934958 0.47511637452505634 -0.63741683829039575 1.2656167807435301 -0.40045873849427815;1.9736729512535349 2.4855236714555793 -2.026971677602083 -2.2563538790716189 -2.3997297047364539 -4.0509137701315758;-0.73568622186405619 0.57723831849779883 -1.1109015766747981 -0.95698294678424345 -0.46144245838178016 -0.59482544565278028;2.1840278797189208 -1.3129308238590078 1.9932437236910132 -0.23196343659850072 -0.78402555964172493 4.3915722929909853;0.098078491933755896 -0.1413092663299241 0.87672992721142262 -0.86225730337568185 -0.25920947619233498 -0.052710277750009013;-2.0799068370396991 -0.43575614008808122 -3.2668698075011853 2.3779928373542694 1.9524760547602309 -1.2200370266881624;2.6573550396861196 -1.3442079843027455 0.025207123437541078 3.0441960893883917 3.0371598985650925 2.9191560250003326;0.006346886755032961 0.595938735392333 -1.458089002983576 -0.7794079579383596 -2.7706875519783627 -1.1500819311750246;-0.69166436995367198 -0.14652658116189426 0.1637879463092323 -1.3496373042214966 -1.6165019991139797 -0.0012499717560875785;1.9449363610213111 0.51716083494141751 -0.048701886741393231 2.0600273003257379 2.128218416174485 -0.43480334973736678];

% Layer 2
b2 = 2.8080529249970709;
LW2_1 = [0.096528600934707401 -1.6543646584046592 -0.29697498685135643 -0.89447626594875917 0.12561256089686396 -0.03330625008003682 0.062622419003462923 0.15320534943693673 0.055558232221962961 1.2191774970613729 0.032349338256383378 2.8165376361641319 0.1205041872022123 -0.22546160258463019 0.089538665594684319 -1.8953132578885905 -0.087535991751191616 1.4363565336486182 -1.4630879511559296 0.028496661067386221 -0.016290924342133264 -1.0510960165305174 -0.023403232393162044 0.81545148922752264 -1.1569791156744607 -1.2422818977067849 0.089025447672870225 -2.5557787818365121 -0.069056771650394283 -0.74738285830359286 -0.56385967288089534 0.018494302900010463 0.534364727504825 -0.040750194832515969 -0.95862657096473503 -0.079636045940538649 -0.014418031315562099 -0.29260217527228138 0.91335106828096613 0.3242156194914112];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.00492610837438424;
y1_step1.xoffset = 2075.6;

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