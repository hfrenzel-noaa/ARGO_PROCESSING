function [Y,Xf,Af] = ESPER_tco2_2_Other_1(X,~,~)
%ESPER_TCO2_2_OTHER_1 neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 12-Jan-2021 17:03:52.
% 
% [Y] = ESPER_tco2_2_Other_1(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 8xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1;-0.999998793562952;-77.961;0;29.715;-2.08184650291172;-0.9;-0.1386];
x1_step1.gain = [1.00000000274156;1.00000063368067;0.0138606862425759;0.0002963841138115;0.248478071810163;0.0588359962254402;0.0419287211740042;0.00826143816767911];
x1_step1.ymin = -1;

% Layer 1
b1 = [24.02928613894796;1.8681735871445033;-1.0759495687459193;-1.2101964792291315;-4.646419991062201;-0.15901697950042476;0.47948499043588044;0.5849852737117146;17.363711556696387;-3.9191504443218874;2.3259064898148574;-1.7534813573543089;0.10398735507000532;3.0627643839703014;-0.609496010781306;-1.2283235233019467;-3.4565189346917777;-11.560465622131275;-0.7247194890670301;-1.3868788105855434;-7.3925552845202267;6.13185504031064;-4.1015278955562859;-12.876388583845134;-1.8006965441659453;-13.360759028645164;0.35945618469830021;1.7480431258297362;-39.345521294331533;-0.20212485522523352;1.8303141919758319;-2.9049393412556652;-2.0360564450708538;-1.7560277812434895;-14.420250667687663;19.985555461942361;0.30133335329083394;2.0641052479754149;-1.1452968669134371;21.511080225160722];
IW1_1 = [-4.4008626598870011 0.6737920626439704 1.7635162418152495 30.439421676246369 -1.951625272283749 -24.574581997848387 -24.874672339197307 1.6737669998592604;0.077742657322903558 0.28644148063235159 0.58689206140673156 0.30315995725573275 1.6690129775995495 -1.124691710596748 -0.28738154906143665 0.72953037430138501;-0.56638050653893846 -0.55717704716278671 0.10513983476327719 0.20141606116260735 -2.3083849167182455 -1.5072972970138783 -0.50220276734734082 0.022722163652623827;0.22575513065342467 0.007859490342146034 -0.35213112495466115 -0.22098526669647767 -1.2121916732585472 -0.94586077428193382 -0.58869540729003378 -0.16223842275831266;-0.14376922936197045 -0.54592294820689591 1.047433687485033 0.86429775303211798 3.8050462564573775 -1.2568525418278027 0.16769789553947145 -4.3648769386667503;4.3926748812236323 -11.988300898705583 8.3740497319735674 -17.427687182387917 6.226384325684462 -18.600267808364357 8.9906235281839919 -0.84325962046966219;-0.63742737229324598 -0.63221589225550501 2.2646192156222429 -2.6418224788388729 9.1051144792571215 -2.5261564165557147 -7.6835175099617778 4.4398035826177829;2.3185377957573303 0.027187675341346536 -1.7448794262492131 -0.26156822217919368 -0.34568441481648438 0.24884466700882824 -0.85687015145046541 1.1318288480727385;3.5825636244819226 14.19801450924864 1.236143065439592 13.117346581998072 -26.030703857162838 1.3467623918224374 -27.420801150340239 18.517259195859271;-0.23028771757145133 0.079721939139683645 -0.82904996119946861 -0.44920034125038949 4.4011478623981546 -1.3689680987956383 -1.1998388103257762 -2.9648130914879669;-0.09292590470406735 -0.26534951886602737 0.17633304384601153 0.94216445560895834 1.2530125384802044 0.086610033405662784 1.9277851419785399 -0.62867766783488632;-0.6147181990336047 -0.30994690258476704 -0.1511576669505095 0.4317344668108426 10.463923590650175 4.9118208705021775 3.6709592157279891 -1.5822567943875614;0.040759964835367125 0.083257468081162189 -0.84665540524896754 -0.051327760254778948 -4.5385652575858044 -1.6367281209429936 -0.77340286067582498 -2.2699524802597355;-29.448075758249946 -20.992061342698261 0.3384771332579895 6.4755479789620747 20.811468016949323 -36.708720262462982 -4.4941021840209556 -6.3804726720454239;0.021495839537789642 0.019106985344101046 0.72070821126236428 -0.035875274175768433 2.1121934352257967 -0.67563203726432941 -0.16741081092943016 -1.2803123465471418;0.21131383496026207 0.1646432045242118 -1.3097641794254709 -0.34499991185517426 -1.8924507135756523 -0.70225953123970608 -0.29187717718164286 1.7279041019727401;0.97783200414796489 -0.034938832507121542 -1.1103467459769392 -1.9994611755809621 5.8978037055246419 0.2135969311374952 7.1121875469729492 -1.7942847295686317;-2.1503882502063272 2.9310151970751743 -1.3625316382744821 -0.34161429894205814 17.643364787613329 -8.8585939490018184 1.7645457148112496 -5.1465400182235745;-0.049082753919971529 -0.17012575301692476 0.55571387099250724 0.11358010776529676 -0.44639542413620636 -0.56075178109687251 -0.44945210568333721 -0.21019759693497569;2.6431737635626273 0.050854572641008206 -1.318242807583037 -0.70230736890283851 -0.20611508529901826 -2.3718442042619108 -0.050760549413941751 1.5650278235773216;2.9703534085745762 5.3125868664928682 -13.471111643177517 3.011211370252191 -1.561010182438614 -0.7557958342177522 4.6605003956041173 -6.0507264200234472;-4.1704548863128235 21.985283664253746 -16.04948301012173 10.263122193022223 -7.3473742899002898 -25.160133566395611 -13.847982195563596 11.662572028406592;-1.5989320687046622 2.8236352873548731 -1.3414638951628783 3.3954686660095592 9.5850440338053708 -2.4479158706412809 -2.1710959565557224 0.13429911939077321;-19.118693340573401 15.834278493660337 -6.9702094072000742 16.261114791361184 51.143386154601785 20.411472104110146 24.741746782063306 -8.6388134508198231;0.014697645613613135 -0.67735535662280777 0.026072459672437962 0.36485232517548333 1.4328958893421009 1.0748066902007156 0.011079349920900664 -2.5913344321524687;10.699807447956664 14.887826665414204 -1.6012799510717366 -17.807812093626286 11.677495442590438 -7.1971277112850487 2.6070916190838362 -1.5347718852340644;0.11476806918994215 0.23860874902957432 -0.46096104818985595 -0.62830136704363582 -2.0067032161750427 0.76886308236913614 -0.90156518729398483 0.59268473027127344;-14.723426329793659 2.6341816359400627 8.6830574389728277 -6.4744935999247213 -19.41358547317547 18.487436555047168 -19.058593193447837 27.032093587069081;12.421605687773091 8.0718252414665699 -8.9796587103029992 32.841086993290844 -3.2284649734687019 -2.4149711455288156 25.181458662535803 29.854505451532948;0.93977523336283098 0.12451497336950754 -1.2769648278556105 -0.3956391351768852 -0.6836522574158086 0.4893832446328773 -1.2285904211473966 -0.80926812974605766;-2.4817446458800627 -1.3189274686718488 4.9226064643822536 -0.95872856089945102 -0.36169201957684516 2.1267069956602347 1.26923208230228 2.3864458035914606;-5.7891991810983621 1.1422138614343273 -4.843858618234111 -0.24453332250961854 -4.3736182114557565 5.1182917650594728 7.170747660120627 -7.4179695843761406;1.7352040616493571 0.39874942213279668 -2.0069895836244607 0.096106694011502458 0.23957334836539559 -1.0045449663628614 -0.76362494605994635 -1.4626306736579076;-0.76776491425724047 -0.28349690653779064 -0.16150262231951279 1.3349290499506885 1.093442562509648 -4.2865476586747109 -1.7229551420725726 -1.0507525735478955;1.3239073860305528 0.46291050874376372 -10.848091832463 1.1560786593672914 8.4121343910456243 -4.6833627935071389 -1.1445523436341651 -2.0041264394664018;-1.5281183064170238 1.4964643318199404 -10.871676092306338 0.95351346584949725 7.4344309640654904 -3.1151229425809479 -5.4140582522617624 23.747073563658819;0.43096199235298815 -0.33671137371960369 -0.051149211722466802 0.017708060293949331 0.89937306976344666 1.5320879917517705 2.4541586805978923 -1.2921263892094763;-0.27290418784075965 -0.73507071149194436 -3.0343158083582491 0.71954445919229038 12.381338375630046 3.2434670849016873 -7.4955881386454637 7.1250953792437119;0.11394333917790143 0.09647574364298131 -0.37761780585337956 -0.35949068252489264 -0.80047814679860974 -0.81804591717664621 -0.70115304504206422 0.12862120873849595;-1.953732426348934 -1.4366257520349162 -5.2779744222098683 0.038687030206428288 -56.072158602407129 8.5366947355305118 -0.1935851641040445 8.4371269992124844];

% Layer 2
b2 = -0.33806093593762665;
LW2_1 = [-0.0048930430915732235 0.71308259687768738 -0.18543305642256616 -1.4882319393488441 -0.23581523658194986 -0.0032178988680860608 -0.016205687089937075 0.093141517385894976 -0.0024869397319071188 -0.081409116078774033 0.55473590031786413 0.035253199029463174 -0.1004643110000841 -0.0030658860149610505 -0.52799017811606774 -0.39050104212729697 0.019484269302435051 0.0095218835308264974 0.66329433960987105 -0.062339814137599106 0.011994435715339018 0.0030348942575642158 0.011276704162109396 0.004462045348908635 0.21328696961111521 -0.0034186924649622159 -0.61257197045108891 0.0065196538999412711 -0.0014195172467402731 0.11402841251761513 0.036789233001203646 -0.0052955744990004442 -0.079296534661294757 -0.072196567235732437 0.022577888460116591 0.042170067433113682 0.12911539963225213 -0.010836933339701236 2.4137721123494496 0.0068675805925937587];

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