function [Y,Xf,Af] = ESPER_talk_4_Atl_2(X,~,~)
%ESPER_TALK_4_ATL_2 neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 12-Jan-2021 17:03:45.
% 
% [Y] = ESPER_talk_4_Atl_2(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.999999996490807;-0.999999999390765;-40;0;11.29;-1.99149636107278;-0.12];
x1_step1.gain = [1.0000000017546;1.00031699124092;0.0153846153846154;0.000310077519379845;0.0705602618858232;0.0604107502911417;0.0145655815308426];
x1_step1.ymin = -1;

% Layer 1
b1 = [-4.1131749759549052;-3.3778592343566443;-2.1095159180418364;1.9622123052634846;-2.3053847719211005;-3.4901832025887445;1.8327096063621204;-1.9205201013745707;-0.40548909733846161;0.49312636768118956;-0.76868672508784275;-0.95583730945009671;-3.3100921936591772;-0.81702706106193423;1.1279544305507907;-5.2782625603338857;2.5671913861346756;-1.4252498688513344;-3.5044268536160614;-0.87463197176418328];
IW1_1 = [0.5249273448990478 -0.030733881809870977 4.0782471172835022 0.76773781780179884 -1.4730145942340469 -1.8217421408437431 -0.37829267420136597;0.45332724879147679 -0.33562617318430277 -0.32164937237591784 0.29671187305300611 3.3519513002142172 -1.269001439005049 -0.18724653667404118;0.52101340259700157 -0.086986323112433581 -0.58947081636796139 -0.14790795982650126 1.1291737562653932 -0.76414298960322735 0.82855233526411654;0.23101990991413004 -0.25899153156673121 -1.5072201938903538 -0.0096128757616737066 -2.2934799436351789 0.91463116811470435 -0.017557500639877877;1.0926805877607639 0.27879881097390491 -0.27600720454185212 -0.088298710227252331 0.85820163481680234 -0.69545108527408828 -1.7115402313890826;0.5205703158820203 1.2730578829690846 -1.8654547740240326 -0.14550978766703634 3.6836283790234661 -0.2127619160484624 -0.40871023034996201;-2.001537769978126 2.7280598053970673 -2.3558383363957565 -0.7846080654345714 -0.75684956802545111 0.292870081653967 -1.143726964878421;0.51032434000116766 -0.52541589545966416 0.38881520552059906 0.12420798476690355 1.8969766945745017 -0.58786436338435399 0.355819055571647;-0.60489469853662781 -1.3425332121220228 -2.2569874772149898 0.063499154059981952 0.68129893802765529 0.58767140168151522 -0.51309182224122007;-0.81862591815558927 0.30533638574655753 0.25966999790385537 0.37815256491090277 0.47474855402917426 -0.60568093044380966 -0.16362916023370008;0.78233167133350401 -0.14662371995131293 2.9832155238123739 -0.075203945394812663 -0.12908808096570668 -0.36130211738965889 1.4271413862242357;-0.40530301007369546 0.3814275700315366 1.0584911232896601 0.034880131320659001 1.1105240839633721 0.84717183973714294 0.56218189509884731;-1.3460404122302401 1.0766588615505703 0.16446267354076552 -0.35452317725014126 1.0681492583092012 -1.5104733684016864 -2.6968604829714837;0.603607987317613 0.87633707065958377 2.062616787832718 -0.061540542886689552 0.61957125492070719 -0.7289517219273115 0.47574930475961635;-0.94504629884020419 0.44756583469483852 0.44059342156680559 0.38176484722070031 -0.11578099935660729 -0.51128159629688208 -0.20305980644414823;0.10946049199252242 2.0711459151830396 1.7357699441580712 0.048869133053968887 3.5382616432397849 0.36021057181683513 1.699617037626777;0.15868606960261042 -0.21840847520238008 0.039036971866379888 -0.27782263157340165 -2.8647534750690418 1.3859903471562824 0.54888552682165959;-0.59711201337619046 0.061591506182430367 -0.059211218011890221 0.0027342712226741512 1.2277601104264906 0.40776473429647342 0.1508588794662534;0.013757264669959078 -0.11033413184879202 0.27647772537585485 -0.2102636247041092 -0.30201419568005111 -0.53050511201329387 -1.1460387728104402;-0.19994887136796449 0.04764883263076488 0.047143584471294256 0.11043039136438101 -1.079258030622702 -1.3712810733631908 -0.16650119974715807];

% Layer 2
b2 = [-7.4906724793103043;1.8879627097356266;29.206403734965807;2.069849423605171;3.6420782078778413;-5.2233965153099318;-0.83872624684708652;1.5583746961966145;-3.7417349391113923;14.164165052313578;9.4498219522288611;0.96515882100270733;0.72052285376158698;2.4083739039028087;-6.9982722042721264;-1.4426347425312198;1.6969117817495019;-5.8426764994767169;-1.3647674935263119;-1.3128190503709252];
LW2_1 = [0.53013104899834451 -0.17809535307074831 0.78453307106413805 -0.018584536508215947 0.29971748199863796 -0.012115480616011838 -0.38968943994010291 -0.043569158792975252 -0.94855748284970509 0.60974936629828602 -0.39389829967638224 -1.4077948362671184 0.82429757907117407 -0.44060078588001728 -0.25807666443338978 0.685736829724233 -0.29571970248018553 3.7673919615118852 -12.91408739628015 -1.3380094200808705;-0.61626458668071071 0.018884299386489205 -1.4687994113422014 -2.15156078236115 0.75284753625062528 -0.73266710406906266 1.5169277354364221 2.9764639462056675 -1.4692214216922785 4.9415465276356665 -0.58357494363540663 1.7007138624433056 -0.17001396478344064 -2.4981638220048907 -6.2423261533037531 -0.23461100111345901 0.46320697636376568 -0.344085630454397 4.8520899340286832 -0.59035891179061151;3.534653498669083 0.037219194825904897 -1.8753946749505039 -2.6796382042449274 0.75636395994527306 -1.5543644792430216 -0.6916016389837939 -1.5383949716086118 -1.0098201745336977 1.6230005493130544 -1.831764716033345 1.7318563501744342 -2.9873035692072341 1.5272686036138921 -3.2536809641701252 -4.5012963068295129 1.7911242910442842 -1.4989215382946841 36.236206687460829 -3.7893578390953304;-0.40043526414785763 -1.0893498522719789 -7.0477337855482842 -0.10353393192577946 2.9660392308848156 0.1395420690865353 -0.65224066318204654 -4.6262812168547134 7.3325185100840651 4.1219853166114682 3.8689662642518452 4.1105671586518415 -4.518376932784415 2.3282129731850105 -5.0466781856899674 -3.7837623820339132 3.3251918443429322 -2.1107513601342593 8.3111224144932443 -1.0296131148279457;0.21975173361983769 -1.7306804343522408 0.05163924065275026 2.6468028034168904 -0.68673896423655978 -0.48514940674859308 0.17475800131683605 3.0566512766972598 -0.16018783876545203 -0.58089518221411995 0.61087973417173835 -1.9978952370091609 -0.68652557102053913 -0.25386871308782005 -0.24950594850307029 1.3163451770132157 -2.7776993987293457 1.4735678843625326 2.0824590818668383 3.0649100189198113;-0.57365283633651498 2.2618613283141831 -3.2274029375288165 -1.145041396892212 0.13428140275497433 -1.8023556477290013 -0.20915377030075039 -3.1798115517371128 1.0109313295901514 -5.5472186272385446 0.56680107774384259 -1.636588465225687 0.073675460499676243 1.3912772897818111 6.6696136421390415 2.0095241362615015 1.5757385031088447 1.8546255946079226 -0.054755395865890247 -1.489491592981983;-1.1774116897016669 0.923855495157197 0.20322062940350466 1.7168593794973181 0.7781501079163512 -3.4807872759176313 -0.21136957242030055 -2.555954915985855 0.97557094367611019 2.0441972310381811 1.3748021656570864 -2.1336257858341856 1.5647141555510435 -3.0478308724530678 -1.2165184584033275 3.0508436235506076 -0.89056278275144074 -0.6276593254275078 -3.8134204496978259 0.78329895324456011;0.55413531563149787 -1.2017942367988024 2.4653367735264027 -2.6479967893848202 0.2316516262066988 -0.56346459596692278 -0.82363835883339287 -3.6481645363105502 -2.110958204559402 3.4544398113491237 1.7379118473286819 0.12645096708089715 -1.4901228298904472 -5.2324035433634153 -3.4048987863526134 -1.3301938170953507 -1.644500390032521 -0.13184062321734177 -0.8471227933876907 0.53188319587839894;1.3910654178215787 -10.114590869406459 2.5784963389295128 3.346877064247582 -1.6042652249668621 9.5549102024874415 -1.9544756247155655 -0.24474257812056585 -2.1318902176675643 2.0250737372508705 4.9276273527395 0.29622468659569029 -4.6000354916942321 -2.1623110619832331 12.291676383384832 14.826631563981975 1.7473030459247212 -3.3612353147238032 -15.546683181410375 1.023773787501397;0.8131244339931607 3.7873700565837747 0.30467329033363177 -2.3375759954724358 0.50571177707572579 -1.3053311380333472 0.58850579066351594 -4.7721925466594053 4.2519151597018841 4.2419466087425448 0.67249068514447319 -0.12399709133986631 -0.1329277845754589 5.1657755919245085 -5.9446644000102991 2.2303866079879278 4.3640387739755848 3.046353841900789 9.5289426224360074 1.3126992142722074;1.2493486908506917 1.824843066247593 -2.5973456464302886 -2.3954830759074013 0.41185950709973446 -0.8409086361868976 -1.2638449888194176 -3.0850614077684408 1.3909241468469746 -3.1266310636344832 3.2132964986661152 -1.0035868197613087 -0.55731425877756136 -0.034673928091676326 4.073068263131737 1.1569198481996308 2.518097334168572 2.7659978619810754 7.1766761004338022 1.6806718506104972;-0.017200087354012249 2.1268746278143618 2.1177249417011175 2.311256104111167 3.7348444124092333 -3.4816979488340647 -1.3455437264245267 -2.5752139565514129 1.042600316465139 1.1894870598668481 2.2845700384951129 1.7022320651598681 -8.2022463650117459 -4.115537777318889 -1.2513082020768276 -3.8705493653923395 -8.9077719901031251 9.0072692109201693 1.7976002335101091 -1.7131634521502814;0.71126759461424338 -1.5622378886991435 1.7567134977589876 0.94906050866570435 0.038778120255381902 -1.0046304446848184 0.72904111908571101 -0.32740447511272947 -1.0330158697558398 -0.083544740577484622 -1.0612992999247051 -1.2676393011212843 -0.51404933137735231 0.21030515795829274 0.07018060252779619 1.5951287500492723 -1.6577117014466307 -1.8466903727456241 -1.0813606705841492 2.1992210659978211;1.3392797685490001 -2.030896130172402 -0.7807298339638572 1.169341531191284 3.0231347125031096 -1.4167620015813278 0.085702154719122986 1.3075408510187201 1.758306876801063 4.4845585140813231 -0.2738016705052948 1.4185439880187187 -1.0967615656754248 -0.5429684639281589 0.0034749021441650048 2.3575727776596929 -2.1014118351121165 -1.5137814857477576 8.8497766450916728 -1.8191153645936597;0.6808738272329985 -0.11913519698950432 2.5966511220067456 -1.4600090811628963 0.34348217513993246 -0.51841179990336572 -0.84762485244037589 -4.1548537854150931 0.16185362725559488 -0.76178964465770094 1.9401139323071679 -0.23925156213778717 -1.1384714810943743 -1.9491064389560218 0.94983596295788308 -2.8828113157347368 -1.0023981346866391 1.0117826013070601 -9.13242386556011 0.62244198114582627;0.83664811266866046 3.4052217367052791 -1.4044529341578971 -4.342450459682393 -3.6240894007364788 2.060123658202146 1.7399401370633663 4.105590406802099 -1.3071396174027896 -2.178217888462771 1.13553502697605 -7.3015390150806994 4.2326405100812305 0.042250234945863135 -1.147669829101889 0.35530231494114317 1.4177880357552179 5.393814684454207 1.3607346214872456 -7.2245231357874635;4.4794946425211215 0.73449440066901395 -1.951454245673268 -0.17764140436854761 -0.28538594450502835 0.59546670342452157 1.3856118720396793 0.84641874350534152 1.5495471687674052 -3.2366606051144755 -2.4207682034854372 2.0816992205419633 -4.6930544491739044 -1.5730208801342713 9.7105578634220855 0.4070376210176076 4.8782170034383112 5.8850733717124672 2.354358192326913 -0.42879258355363425;-0.80667676971906632 3.0125474441540994 -0.97813352599055359 -1.4416266619114595 -3.1923459867841313 3.4490247536364662 0.21918915494393726 1.9102087948289161 -0.54473860636301108 -7.7095957271254889 -0.66514342174116292 -1.5159843496520122 -0.89969958074428402 -1.0127908033866551 2.5941748311226172 -0.61640304802680634 -2.1042847269289409 -0.24748921473837115 -7.9443752125200602 -0.98732995024915793;-0.86301606547458187 2.0771391123049803 2.6511116951177964 -1.6933300135019913 -0.2009569301116437 -1.8224101760484144 2.6197650185290593 1.0476975224688141 0.70273901161207564 -8.7790267864290108 -0.18294469381059481 5.9795669808256768 -0.39900866281552932 -0.050861241903166127 7.3539936651811955 -2.188720965992029 -1.9226024823868988 -3.0470965155337026 -0.40560544085433003 -3.6256192718135956;0.79615025108508086 -0.73931690332380584 0.13645534341169391 0.077343169439720361 1.6202597604562314 0.10055568389329747 -0.82693599097014825 -1.9652624795516453 -2.4183299713139541 -0.89835471185929805 -0.20297024217493237 3.3159287044008261 -1.6345187678057884 1.0944405810556306 2.2975965555428237 0.19646852254270275 0.38185314206276816 0.31565291833094011 -3.8413675270082273 -3.0374335772143501];

% Layer 3
b3 = -0.65758161080466371;
LW3_2 = [1.2311110793782452 0.29030376454776213 0.0081822188777212861 0.0033638420676317098 0.024824091861300305 -0.078562295352003958 0.031846333229657964 -3.1201983963477398 0.0059788843318918268 -0.02943307310299955 -0.016622739105580642 0.0054581062862988959 -0.07877084513992888 -0.022739985008272554 3.2151537897821534 -0.014818291622684443 0.0054314705307716522 -0.03843049021843465 0.021591416723768176 -0.014195376235090261];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.00111018595614765;
y1_step1.xoffset = 1025.5;

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
    a2 = tansig_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Layer 3
    a3 = repmat(b3,1,Q) + LW3_2*a2;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a3,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(3,0);

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