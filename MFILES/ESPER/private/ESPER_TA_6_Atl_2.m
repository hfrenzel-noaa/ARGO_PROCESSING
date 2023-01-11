function [Y,Xf,Af] = ESPER_TA_6_Atl_2(X,~,~)
%ESPER_TA_6_ATL_2 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Feb-2021 18:30:01.
% 
% [Y] = ESPER_TA_6_Atl_2(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.999999996490807;-0.999999999390765;-40;0;11.29;-1.99149636107278;-0.2178];
x1_step1.gain = [1.0000000017546;1.00031699124092;0.0153846153846154;0.000310077519379845;0.0705602618858232;0.0604107502911417;0.0479365703301392];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.8310112146515953313;2.0124180875203654395;-1.172581843222938458;-1.617822357225456642;0.45658305018366796002;-0.95363492209320477322;-1.2414863437322873896;1.1784145172391187195;-1.014414562221942484;3.0758928891781063264;-1.4325871387176265515;-1.557721112296912569;2.0753379727883021211;0.25269354920683645416;0.24907165833053696025;-0.65330797458219025398;-0.31083616044358636232;-1.064878456698480802;-1.4042300200710491342;2.1982317011485785763];
IW1_1 = [-0.13949773661148215376 0.62969265666841645057 -0.013835358523811517456 0.19568435833542391356 -3.5729911982442743579 1.6826814451368408143 6.1149600556708021831e-06;-1.2923075259323555386 -0.20680801114949234898 -2.1279011187133018979 -0.78852669815429132782 -0.45642406344109842653 0.12573487629842602931 -1.1509046263698188284;0.49768674030711529399 -2.0842347459652730279 -0.34940828953317432104 -0.34225662857969485486 -0.94110343561011600144 1.1795632280630818922 -0.89200471850148799202;0.31151002154131784971 0.28512304264899834827 0.60907333400785490518 1.3882582580417990314 -1.0331323406841228518 0.082059342394714018809 1.3747157157897142987;0.11089589478218847551 1.8455932962154744104 0.89661941601414318903 -0.42616036496533643563 0.9373475832870564739 -0.083407625822558673079 -0.015694534079658005454;-0.20030198844102320432 0.62049129325747798269 -2.296453660837452837 0.19659792051406535518 2.2268452412640646898 -1.2700967790191350915 1.5384212690900713749;-0.31848027793948163744 -0.1309238757783286744 0.03444143456739511 0.80840189562730169204 3.1314660049830331801 0.06586921847546040043 0.45676855673901706201;-0.69338507175356189904 0.086612930939118690232 -1.958837090766136102 0.32062967980869383489 2.5770718044967773075 2.0535967492948179469 -0.6129579590062306238;-0.61448344707720470304 -0.096193603346254069608 -0.67692713205028931522 0.24402463084078671041 -1.0140899293415557292 -1.4585203065506051612 -0.041101500688567833841;-1.0851413259113169563 -0.053130781612107269574 0.91885351051872854455 1.0429094060920360842 -2.8607146553418925095 -0.38955078897821482364 0.5258751276218809334;0.56937933639058002644 -0.63664834073574949613 0.65158490885305664353 -0.092826220274059303983 0.73829247612369619524 -0.5831338769410966405 -1.1507244605499804546;0.37555620299400405138 -0.41464838395062691978 1.3223330386690250737 0.2693081621434091355 2.6829238096451981654 1.4950103249804529426 0.012054192564074956914;0.32374499819474106266 -0.57332561018497041339 0.64947231187726894852 0.42842161181078053378 -2.6118882896997170917 1.9976342402691016353 -0.0063916272405859231309;0.61375674054834283844 0.56558880521897736404 -0.36698318212796143811 -0.35642098108154940395 -0.93127369684529803795 -0.3503078070065914762 -0.25349051947761558345;0.055482244320495498202 -1.4960606232261506321 0.44720853961031808987 -0.049020767730826864117 -1.263907609613470262 -0.54116563539809348082 -0.30988897042908314372;-2.6419423495684881686 -1.325178101103203554 -0.042889116274644784044 1.051791159070177839 -2.2397030352137869968 0.97093523287481608985 1.0711506367744616508;-1.2906253061826045148 1.11527314351154061 1.5374647200303093175 -0.081138680520908376681 0.1259030073362528146 2.6329853356113348539 -0.30275440918973844928;0.60725024177970854389 -2.2633538206878749399 -0.079296563945959949726 0.41558440944206470613 -1.8005044431178187647 -0.45845687250329369977 0.43997944594635457483;-0.70961745492531191903 -0.64419255322696689081 -1.0481948449320384054 -0.31652816641792574925 1.2124850453436795128 1.1261004496483173476 1.6744431273771169799;0.40087578019264380469 0.25900647090884276746 -1.1010841163987117319 0.49188997342883583608 -0.074269973000271369279 1.9210281307253800342 0.073642491132641887952];

% Layer 2
b2 = [-1.842532309790320566;-1.1396535534986915739;-2.9886783813164403689;-1.5375774061028388839;-0.89875123709016158102;-0.99824602560106989735;0.9849255671966097303;0.51153379086885941707;0.15176297257524917761;0.45501229107369783877;0.33970304777555976328;-1.0553827378816176275;-0.84844466761179548886;-1.0668319821301368577;-1.2747642799584337769;-1.133121095322463745;-1.7787360357570027869;-1.9006686432211641335;-1.7817636779142611569;-2.1352438099326200849];
LW2_1 = [1.0921363774272967451 0.48175692304239609021 0.28624371884191485149 0.17088257050429617179 -0.40196607568259129506 0.085044209790642130709 -0.86621354421819451996 -1.1234519026139033748 0.81504759964220852009 1.7328477627945189088 -1.0138927796968701944 0.013992952536819246515 0.057926915290560890281 1.138315240638902992 1.2383644933627226958 -0.94329687353274649375 -0.42952541573220487381 -0.91667967688927531889 -0.10565988819316454728 1.4766764700586931802;1.0254321474655765378 -0.29366527710006179452 0.29251795498487703773 -0.41179937919550674286 0.26310370429417240246 0.32238550819463485109 -1.3972094781229140725 0.49436936282742643956 -1.557183684207166019 0.3273775909845256793 0.15027711347096450734 1.2661196051515084537 -1.3272933648218361302 -0.68301717488350233154 -0.55140153832036886694 -0.19255787935736695671 -0.25069656132262713166 1.4229030781196723154 0.43146104621915593036 0.14325506833395124096;-1.4352331070284605197 0.45283152228113549009 -1.9697036438752739684 0.85901629593942818719 -0.47756081188383198155 0.82462980760399096081 -1.7265918982256622805 1.9309595958846947905 -0.61624734852112605932 -1.47789510124836454 3.3348400991228834833 -0.90466493153178051401 2.1911100865814661098 -1.0703665513472180315 -1.0943739980438846882 -0.52967127964920324157 0.6518270641755020689 0.65723681342564632679 1.0871501128351264143 -1.1585320227850266495;0.74197473571385119673 0.52244320319427428601 0.50294601018742179921 0.89949746332670532656 -0.1160333312048108384 0.55198053644834699227 0.0039750484457712559686 0.25031469594454047733 -0.24463167750065506478 0.88559690926300560498 -1.1472010889611166107 0.98692426243283326581 -0.54796623268123123562 0.94984461015159804553 0.48781091663620979038 -0.95966867675933442694 -0.39120263155049506132 0.052436644982617540423 -0.74922778389112842934 -0.25470994797923635078;0.19494601654786153366 0.80300858672206143485 -0.19582792547093924584 0.47957312991799394553 0.070533541760266077469 -0.094135236987178558254 0.52913617643512533828 0.99042076392478184399 0.33156180943024554653 0.58299665293359892448 -0.78419292914681348883 0.47202681194347401172 -0.27123010883311426955 -0.063473355784496435228 -0.46522004578393999497 0.39722508341760254247 -0.30191229034354549743 -0.50317572450836545173 -0.26794776071054904332 0.55946150716370712797;0.84552179190851428636 -0.58005373833149476148 0.74340790966122016759 -0.43855943508293737665 0.11303441376722768441 0.3614605110244353825 1.0005831413933263807 0.49219351475321782008 0.8842344316890562439 1.0894834714798860009 -0.2873067144652571292 -0.2963070422964373396 -0.96544282483658738769 -0.52677976329173514802 -0.22082057652812212001 0.80506888834499046315 -0.36857792071800260514 0.68239566885314506539 -0.13443173042318151689 0.27703442124623389731;0.96266366097864120022 0.32220480159194925251 -0.173315200792460683 0.10334297329392733156 0.4093109687800389751 0.14351759040937606127 -0.27220326344783013495 0.90371085122368899345 0.48143776554831468895 0.10285695443353240486 -0.21217257219151841596 -0.036399251430419485298 -0.73943663899118672322 -1.5319050227675312659 -0.22610434770644238789 -0.50821287196101494477 -0.64055911815327137848 0.37662827018769978737 -0.27428832090444732472 -1.0894588645814375916;-1.2287152318650602645 0.86695907032456931418 -0.4162277551404950926 0.46580719915120871732 -0.18425604247020024862 0.30941892140449295256 -0.27059882095632326049 -0.19624443988138409734 0.20372234743098283083 -1.1526033491022853461 0.10553883451832467288 0.79417326447786262822 -0.66486105108184412327 -0.41906977724835026144 -0.90666263918933409638 -0.12234941719687873751 0.44775960577512863292 -0.13755876665451757801 -0.42442888858215077619 1.676386608795624289;-1.6587703538468154818 -0.2484539518765506716 -0.40400370983253175439 0.26249823457090459833 -0.81934153075431670477 0.20328514335046407591 0.71734877708355981873 -0.14181375234922191653 0.67473925959356251258 -1.2274900738197420669 -0.59535639345350310769 0.81038573385699519402 0.36666104752273198653 0.81243021318578889645 -0.7358385085468038822 -0.58392539014804722974 0.34284343121724530912 -0.29157130360064797969 -0.77110779525499928422 0.099906452616946528344;0.068168850205039682733 -0.065463937078063347275 0.75975435216799291904 -0.20487432869470284524 -0.14443478175981308564 0.70656805468478744992 1.1238982584328547354 0.26897624561696731327 0.88964776513744403541 0.27394178670428431799 0.37722801743174788625 0.78349036416386941273 -0.48098618899555112272 -0.61755401101439877376 -1.0096979717206555627 0.10566890735314576899 -0.13994431927108372249 0.23527609647604888488 -0.88229623937929779753 -1.0701371488639637164;-0.83953314928338018674 1.1343814451477185479 0.84999153425196050105 -0.30573144775086646963 -0.95912094248646562189 -0.51078020099256038478 0.57505127303970537955 -0.89915145440473520644 1.362561521017476851 0.24446270306832143526 0.6815286851513044919 0.23768519825019385205 0.77892062182601362608 0.70899518213400414268 0.66364141852540103894 0.86482282467805282611 -0.75765429815748885911 -0.21294695114231820821 -0.2626717636634808839 -0.53566825045080446177;-0.0043332196078750950113 -0.030290676866830335695 -0.85012082920597364932 0.32197499067321677657 -0.66434042346555088887 0.32303773305117011727 -0.65658762328376363282 0.60544278438463550174 1.3482811530142553291 -0.27570778959729053126 1.0898911564585900269 0.10107954409161466758 1.4041073017589835725 0.8361662488873379262 -0.35567192719025864101 -1.5627218391707362599 0.71380175333640649704 0.2889413417179159671 0.34529097447740797477 -0.39431927430406654711;-0.34953324403804769682 -1.0572278548537916709 -0.044704489652677419087 0.14388362878685920232 -0.021361549766723827298 -0.58797675726785991746 -0.35887475461108614416 0.73876634878974223319 -0.93526658315186428361 -0.33201102866525789015 -0.86937776614017714394 0.23283178294862005853 -0.28027478230787206126 0.89761335835758693236 0.27019810169807118028 0.048844342716428859608 0.61346129109151159575 0.13081831949441219409 0.38155212653575942827 -0.063850689465923538002;-1.3483071370506367614 1.2038819439308805492 -0.89817784304063363887 0.72251399795649517976 -0.27291655803032488503 0.87029442504164900019 1.3689382747525009609 0.32734836154654206597 1.3011851396695854888 0.27709217491321175286 0.24960673018127940703 0.45560146297061782095 -1.4199728535749494007 -0.38268027369086182743 -1.1421108984872812009 -0.31715238421997704599 0.99392628182623443678 -0.42720355588472164188 -0.51780182494841275886 -0.99260805566452603443;-1.1083088621931083129 -0.38169257107503851145 0.082015517581560851146 0.94002210768065874724 0.85351745764373743164 -0.78022274128243962465 0.20951008222282960225 0.3556536084843410217 0.35962598924515287724 0.93803478499585524197 -0.25492137645652579447 -0.50609497965543237541 -0.12527732163986288194 -0.49984138337720357415 -0.51668560808135188811 0.42939748045991071868 0.11628557929904483059 0.22367498497996016193 1.1543839403311904057 -0.3490278522029308661;-0.24400952932637465231 -0.20598307422970124625 -0.66734764919741096367 0.55040021914817782722 -1.6142669998283656341 -0.64613017206041845064 -0.69948672988172777565 -0.84163588921060217274 -0.33154674762541097577 -0.97783443279736459441 -0.1732300947824113313 0.60850527335771864568 -0.55155363998863193853 -0.36153315447576500619 0.35990987648076611105 0.098322376629818158955 0.81810640244626131601 0.091704470517129765827 0.4013098112808919371 0.59888643049876577606;0.50266568754658413898 0.18623834409012915425 -0.64113363229762421192 0.3461678140596924913 0.74026149237492444577 0.28097660096677951058 0.03271319428533919077 -0.76309486707509166514 1.887890201142169877 -0.31893510643048944564 0.80288050367690244613 0.54390082703615461046 -0.70515925675552804108 1.2038496434574681437 0.64466542262956028075 0.42127781477745906979 -1.3429749314563173002 0.6305480814293296099 -0.26966011687643071104 0.64638714315418832612;-0.83743429719226469832 -0.43221563329040280088 -0.00081269603261637131386 0.36379025140809501115 -0.22348257470651231027 0.075419865371471161986 -0.18346286008764164932 -0.16383258072561632246 -1.038652800857666092 -0.32868783393381623137 -0.88628428817223148251 0.38746853935690467319 0.95881288635488115535 1.5546611531089948866 1.8595069172118732226 0.2047251423945215254 1.4231853528434730283 1.5600746579821249682 -0.33767822185023615988 -1.7186861743966790339;-1.8905256952683113791 0.50940918505932208937 0.68023548885995077651 0.031805672989697587882 1.8350697801478215165 -1.0805297455461784217 0.30226576806262822616 1.0657761543303836405 -0.15322586677939939448 0.12095763537677300947 -0.50299877288767691486 0.17168779406922243802 -0.66135322889414316361 -0.12356264065290833987 0.29117305425352191239 0.3720740647510429322 -0.61363703976291383846 0.42508403878469680492 0.63135899389257776892 -0.7606584806849140401;-0.1101838735517745721 0.15160541611598368772 -0.99061549220225941781 0.60025352026385092596 1.8008443287198609983 0.48430683134478003105 -1.0210686732621356843 0.23860911747696786356 2.1855260136817222794 0.22623596474414167656 0.81461046198311470867 0.9079665109605499218 -0.7268269301341067079 1.3539126140923327668 0.421815133205899917 0.076858666855751003877 -1.6918115008579859282 1.6527806002284239906 -0.061408220793485797373 0.15260871750740725994];

% Layer 3
b3 = 0.64864736512535769997;
LW3_2 = [0.043701950892154846351 0.10542097228223973326 1.5666155299503974341 -0.13985280345208872532 0.053908410388372872413 -0.01611540571017915785 -0.49300102104795873181 0.030794535970367239303 0.075114032262233995652 0.068178707173274788467 -0.020275206652959669451 -0.29938609803755261707 -0.25225278453514088373 0.043220141124836984614 -0.76493020436768266457 0.017545425025883361336 -0.35751715399314903943 -0.60587596510935504135 0.031015093777444390638 0.33760047869159481859];

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