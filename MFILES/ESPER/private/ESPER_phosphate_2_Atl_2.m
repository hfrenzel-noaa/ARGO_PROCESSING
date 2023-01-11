function [Y,Xf,Af] = ESPER_phosphate_2_Atl_2(X,~,~)
%ESPER_PHOSPHATE_2_ATL_2 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Feb-2021 18:30:26.
% 
% [Y] = ESPER_phosphate_2_Atl_2(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.999999996490807;-0.999999994516886;-40;0;9.1619;-1.99149636107278;-0.28;-0.52];
x1_step1.gain = [1.0000000017546;1.00003626070655;0.0153846153846154;0.000309885342423303;0.0656325902039552;0.0604107502911417;0.0470499670650231;0.0145232735458572];
x1_step1.ymin = -1;

% Layer 1
b1 = [1.5276303561532056374;1.4353980852798151613;-1.5286948169070309067;-2.8960324493227163067;-1.8432392298648858642;-0.42321783138972202121;3.0648373321773836331;-1.3507332862359111569;1.2038595225985260218;0.53529552773910293872;-0.41149132653341152777;-0.42238743154009877889;-0.36615130195607298313;-1.9781388332650537976;-2.1119465933868402097;-2.0521786200878109341;2.2632799775318024338;2.015946890066775854;1.8352572739547294844;4.4102746127409089283];
IW1_1 = [-0.44516362230844058745 0.27438214309405889457 1.0208416053483171382 -0.7278837497205631335 1.2926961836185091315 0.44392445319320250618 0.10488759297100173906 0.025130284432941053796;-0.73064361923878240468 0.12328420093730176055 0.89777658100524915241 0.17835448300121625742 1.2692683576904528753 -0.73282720199047901577 1.6111363037760371153 -1.103316262686365512;0.67862795059343483661 -1.3536492405539990447 -0.83086554970261883302 0.27160253357381147765 0.30924844428715808631 0.7369934963294171304 -0.30132758564156980619 1.4024736793911354304;-0.053960829044909210117 -0.068153571665201445606 0.67866968051914244864 -2.3026974524656522725 0.41801305002620081641 -0.14993829123864019226 -1.2521484166573917385 1.9051590423378399475;-0.15414360005556634881 0.80332210154153549375 1.0988335599955605382 0.69203313965229507065 -0.57350211904828574117 -1.9486708625845323706 0.85304019628393146224 -1.1607111955543794046;-0.17985994801889859662 0.90693208625570920223 -0.24728163520695919941 0.77187631711357163056 -0.80890026883560484094 -0.1047629470360863374 -0.24857435335153618694 -0.1885081142459248682;-0.20803394202011368797 -1.2565430191817734684 0.53524495345520972656 0.97394966597187804247 0.80333336041251590665 0.080634149757197320918 0.39188261316715694571 2.905532385412936236;0.21793247053274947267 -1.7488833503428595773 1.5515353013928128156 0.46436490188186924088 1.233235885128872944 -1.076259294280967449 0.78271406686829669841 1.060439778668088584;-0.35937584601335098577 0.58640142362072888993 0.15819335495929390256 0.35375419149822284748 -2.6441407750234833252 0.46337994359187328897 0.82324822037039457889 -0.80135554368927497393;0.36667015601007801884 -0.22326792629320232897 1.7124190898566584718 0.37112392148945910764 0.39221488080109168095 0.23321239917034677913 0.018115175892790123802 0.14321553954070925796;-0.70821169546086581992 1.6085869564312831326 1.9251475613278787868 -1.3633534882346913797 0.54835995028026118803 -1.5216190141113590251 -0.69898959535387183983 -0.56605441898766684083;-1.485217408034145592 -0.92094733577481879827 -0.872107277419373772 0.072459188135193058899 -0.099965530789331194517 -0.30046562240943025524 0.40812810449605757546 0.29347153053740349105;-0.73041919688075440664 -1.5878272147063003938 0.40270927158306463189 0.34479552814614494727 -2.2988249315747486534 0.35231746783929551725 -0.070449992316883799925 -1.7391872944699355852;-1.2173260041839011336 -1.7295903117057962461 0.51818846782592775657 0.087890139475551354309 -1.8000392543105574461 -0.62700643524938293183 0.00288972154325706004 -0.55132566595281007338;-1.931297350713442329 0.1126076771967669532 -0.94541811003980880113 0.023482902909729742869 -1.8244966264779223231 0.33980044456783509155 -0.75997179656672753101 -1.0877549265741572881;-0.27661482625637623389 -0.48029220574196301863 0.058909659820598259117 -0.036267486640903165429 2.417541865186203065 0.29475562421891954301 0.25967272613720054908 -0.37063058636245893585;0.12395011640691488974 -0.32780262722094266614 -1.316357286481737443 0.49030192123359861434 0.10565760813501812176 -1.0104189303770525488 -0.75784024973840313777 2.3231225172489695652;0.19806479006429245082 0.43824203282379076141 1.0971163478355276943 0.64635345170643865309 1.1839523846375770155 2.1883913093997571231 0.3398655423432587197 1.0858547635336937009;-0.57025614303502303315 -0.044746003677542653398 0.40987381591642502165 -0.544553813748052562 -2.6725154388214651391 0.098696819080713441008 1.1990798444870105488 -0.39963370264414876942;0.40135069972073639244 -0.34910163146202671802 -3.0082693149990396009 -0.17878529666097503492 0.89928718182938183201 0.88091278835259589908 1.9825368629957456079 -1.4652542132326247248];

% Layer 2
b2 = [-1.1180991958561523614;-1.5803108526650617716;1.8245966385381442443;-2.0155522822152320828;0.26784543929248710858;1.2289350378969849942;-1.0198245407329089574;1.2255996180581030242;1.4370953181871553017;-0.22707286719222588567;-0.04930541371924655053;-0.5110509559448396244;-0.80523694786178723337;0.55657847570509066948;-1.2718747891997350674;-1.592011167320685372;1.0441613901061843617;1.3530423702665888008;1.8160785828025658439;-2.3174824003751264279];
LW2_1 = [0.76768687024581849787 1.2671699320755960283 -0.66298190914888888159 1.7165517403110930328 0.030313402040835352169 -0.58830040828423879606 -0.052357534980989738072 0.58582156191978940196 0.35528353359357744967 0.98021239930128556406 -0.10357001489465528232 0.39373958323678659443 0.21434150387930944737 -0.8308233488069695083 1.7802973093369842683 0.34290286026882510484 -0.89599755795903957001 -0.47585393387353169814 -0.97600307234028382819 -1.7764466904753564158;-0.50867472919929634934 0.060592950371286674605 0.4235586953910477348 -0.33120658771440958379 -1.9117313881565747291 0.38759464580816771484 -0.059916591591775009151 -0.048378202870905689936 -1.4577828239504944108 0.30016249251681131893 -0.13606387548335066584 -0.27246090812612139276 0.2543416523878937463 0.20310224843432542197 0.16506570716447860336 -0.33568114580848856798 0.077594940829273567617 -0.60059782283005758163 0.069444500188630603477 -1.217905733030028026;0.20566368263869655442 0.70505567074525843374 -1.1362208943018634599 -1.1721332136228455045 -0.081174002854155338782 0.11951687611085534679 -0.18415268852474755978 -0.033045701475869021513 0.43593984268319435627 0.183538086423559621 -1.1439930570247822672 -0.67657669895863425946 0.17430294604448207108 1.0239929022477898268 0.46466846610461259859 -0.91800318741807895861 0.28924441127992706058 -0.090302274541881361047 -0.34700522953143320137 -0.18392617315568060565;-0.056257213323206427258 0.37244603968936990102 -0.66660604144244650637 0.82924632796762320908 -0.94421111108963684533 0.15022643868642840403 -0.040793868873665324604 0.061305081956102944196 1.0681003087328262424 -0.60000403038139971112 0.16545074577478494082 0.82000569819691304652 0.75688576272522056776 -0.26274737177810481015 1.8303830832694276687 -3.1272793839010799566 0.68373709430726925529 0.30529626576131402294 0.37236926605635722876 2.7832729600592092112;0.22747992990550580661 -0.88850400188035583149 0.20458966315659707358 -0.43331769735056852033 -0.18296724009167367186 1.367269486062228534 0.16309581801937664269 -0.48986216312227748304 -1.8078671449827321549 0.28909418514093032648 -0.079271428455838399696 -0.25476534028230984896 0.0018694183158287909323 0.33417585750913492149 0.97910071372903517695 -1.2897943781934826379 -0.77873786751019091756 -0.36873490683688131542 0.25837882609214912755 0.96390775158422703495;-0.32249885848315051895 0.46190557061493897617 -0.16022614302001261799 -0.5640310897697820014 1.07343429567143267 -0.66015164250003699475 1.09829620306845821 -0.093156342839037356574 -0.21027807438928045047 -0.90145583694050757106 -0.26190455712160087831 -0.2872240934598616624 -0.78588631082355075996 0.1343246086703421549 0.55487671219668766032 0.32319145385954700656 -0.53544115506345657529 0.19429152486152684309 -0.11138692337669431343 -0.44006875944617135366;-0.13684680842473115336 0.63325546693958123523 1.8290543075274887652 0.33046781801374697229 -1.7663105318504537244 0.064901459638694619647 -1.3914702546120554238 0.07599726015776342436 0.92499640042351449765 0.55338248035984727302 0.84355738995793883017 -0.30480654182309874223 0.73575830287446397637 -0.67497264636798048887 -1.0589731845136189925 -0.60515215084674001123 0.25738125926276778088 -0.54715584370183556473 0.400379013720597976 -1.0718237090477249485;0.52497329165972383969 -0.20411956762504565588 -0.11882665827196148278 -0.88301665992160038865 0.94638415327798286469 -0.1862727131496414168 -0.40651244998588142998 -0.14566838193519074385 1.4017976860396055283 0.47020765654934776334 -0.32062678155088930598 -0.092712527142020897952 0.35291844259193311251 -0.58483989036979366904 0.39026925551764785061 -0.69014659644515352621 0.08183733007328558573 -0.30177703858203508425 0.52014758964641338856 0.1008714646143847038;0.12569278533213104621 0.31561271846188099222 0.013977223642815943261 0.21232379518495703152 -0.21455745098426159956 0.70485230064234793979 -0.40402141107768102524 0.38241791779849892974 0.66910043649310912972 -0.007308992255273269803 -0.19552819377762689634 -0.34236367549407242805 -0.81200225737824738292 0.61593381178062256431 -1.2632291453783173196 1.1692848501273025441 -0.35619644350134416211 -0.026940642296004978229 0.56852361802918516265 -0.37052862196190350375;1.0234748830847448797 0.93014382183753518962 0.18723730844687061503 0.68615492816859813274 -0.066963986572047023982 1.1292724583338078492 -1.2713576898345975152 -0.10869678249191072616 0.30946692112769530469 -0.10242015340158049097 -0.35279077541014669528 0.97458040978107263186 0.28721685942836699956 -2.3536851366926292428 0.076620911801394436802 0.76339851601584496343 1.5202925835606531102 0.04149388124750239687 -0.21793440740521166643 -1.0700894870480881504;-0.20820667632464506802 0.52051708322603995605 -0.65391870260626128175 0.55020324003193421536 -0.037700385887409794405 -0.0077979109031903462088 0.030461979784642025104 0.17847776211999963336 0.84642864819613328198 1.1337691430113412405 0.0075366522312312880447 -0.25460185175041799566 -0.18746485041238156177 -0.11718711626920001734 1.1161374636366840907 1.7199106157698766939 0.1193292695999962072 0.35802349721950249561 0.94514210473044979466 -1.8190449198762241867;-1.0965213654206993343 -0.65259738391844024363 0.068030715246203854463 1.083564854469812877 -0.65638159068362833537 -0.52196286118701573642 0.92459530538085543672 -0.47134537516026986381 -0.26828059454617114721 -0.40424500902085425125 0.33587039530931356301 0.23612872134485360376 -0.38754583688083926729 0.72937483803419567163 -0.77413670427780711947 0.08611893916236647295 0.87549271426890895587 0.30437918380216349989 -0.85083048144066564245 0.080094505429914128469;-1.0969817848835479168 -0.14889599516580581673 0.2807089020379635036 0.20707047952254437062 -0.23804556796836856547 0.53360956387015612279 -0.62590006249538887584 -1.6408656652184421265 -1.4622826198085518978 0.1994927053185823751 -0.50751030774250338595 -0.36661685644243569016 0.90061130013792634053 1.52763007643648141 0.74994359409312494336 0.44661032804287964515 0.55746566929939012081 -0.16823926699230237758 0.49724205840327789785 0.83673857426749709276;0.11555093116807557685 0.51660072188528316506 -0.58833704044412682421 -1.8511499228158438957 0.536410046372099103 -1.3235115436700959357 0.36637092987554481516 1.3787612924997814101 0.33950862820289878785 -0.2697328795762742315 -0.085713214721093999859 -0.4611629630989212969 -0.83147129443319767184 1.4809962378541334793 -0.17071287501607007586 0.0082050208881392899113 1.0288843433693701801 1.448858184109992786 -0.0062458958941635240453 0.56770813533938357942;-0.68283526601123811783 -0.11111097406119738173 -0.68774197753567334335 0.41487509750187884228 -1.5866625214262268795 0.47054752081840534039 0.52345569719171669565 -0.061272104161746707152 -0.4075197345200300969 -1.3904673349862270992 0.35147990876824286577 0.49953833433249739127 -1.0016266030633413919 -1.1174468424896633056 -0.34257121193700823536 1.2230125236376472309 -0.78380694720314569857 0.53378047167539033335 0.49947372722270200196 -0.58975572725714087152;-0.22540000976661123122 -0.41055887892976383746 -0.41144939615817049949 -0.30496580377658422112 0.20042317484482954915 -0.84232199650561301318 0.44920336068782185102 -0.20205945069633698963 -0.16770116682307167899 -0.35592341445239028541 0.26917350557302466285 0.29578605717943717845 0.6337520902111343224 -0.50075748137946352045 0.39765383970550688408 -0.78680591406342770266 0.27030781574118956101 -0.0026939202012799374174 -0.61547568087584447749 0.079096247444554262929;0.16692055806380751148 1.4866588407460246124 1.3017318274116100874 -0.35106985904389514941 1.1476124945375372199 0.60086027697567212513 0.40990754447804833571 0.60566616420313579283 -1.3076373684367039729 -1.6623470347528475077 0.06027204451879612096 0.37271517502249384979 -0.57540614362002384663 -0.3657502757919348646 -0.69716115644845644272 -0.39111134161908411855 -1.004899533817887658 0.256448516161864426 -0.35898592508056009764 -0.12163861668330103183;0.99581941114226746325 1.3151936762317444352 0.63061301028853555817 -0.7327235616150657993 0.24675346549913365624 -0.8716799415088248848 0.53472272563499256837 -0.34421783798897959139 1.0452998313330224001 -1.0045139336002166797 -0.4666148473373428196 -1.1151251239122978998 -0.67757074503131964338 0.98785586498816768675 1.5009869735259862011 1.1288858155641654513 0.13772358287726654824 0.31030006397902243354 0.064738951938055941393 0.26880406001128387405;0.48469325595845452748 -0.43459275065734925825 -0.079656103940092148896 0.24518105229792042099 0.0061493317928596382543 -0.59855107172593990938 -0.021705899025242093858 0.19084218001299430023 0.68364910641835174854 0.14724815626714954364 -0.43803683486993799656 0.68376269656338084513 -0.40667729163809757109 1.6031220955732781164 -0.90302778824645435485 0.92639632494997337098 -0.25965883489537217033 0.31950804504119362237 -0.2130649563780380451 1.57220410819373968;-1.2502769302000180662 -0.35840969723539900516 -0.6592138539643538353 1.1718808122061743493 -0.26758566690462420867 0.50708283997086245343 0.12074289701155996313 1.457889156756469351 1.5205387278945041718 1.2596041513695275249 -0.48512970945651950894 -0.32171010923895321243 0.337402053713903749 -0.77227020401992085841 0.017796281494997151507 0.21175531582435669353 0.060703800979366041857 0.19219488612395171923 2.1807917261562601574 1.3763686889676531866];

% Layer 3
b3 = 0.4520506349905877852;
LW3_2 = [1.1909684554840274107 0.94603926713745600807 -1.5522691976177291906 0.30287898189045031616 -0.59988323020263289997 -1.3022966306140431048 -0.79319935461068125093 0.97573620323544729693 -1.5893092890573958798 -0.31069496812535607466 -1.0242103081622486727 0.39026943825699844659 -0.58195093070269876545 1.7235679671650621092 0.29841233202193057084 -2.1141271473004934478 0.92675171568355263485 1.248674963252517367 -2.348580091275499715 0.22642490496693193358];

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