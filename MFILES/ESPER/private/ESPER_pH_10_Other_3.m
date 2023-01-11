function [Y,Xf,Af] = ESPER_pH_10_Other_3(X,~,~)
%ESPER_PH_10_OTHER_3 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Feb-2021 18:30:23.
% 
% [Y] = ESPER_pH_10_Other_3(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.999999984769129;-0.999540494077341;-75.751;0;29.715;-0.9;-0.1386];
x1_step1.gain = [1.0000770825255;1.00022983623563;0.0140762793578401;0.000302617642608564;0.251952632905014;0.0422119037568594;0.00826143816767911];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.8018940775465090987;-3.6752306780152110832;-1.7049991739780903099;-0.6756936202664395319;8.5813198616497032845;-0.53695231129532106085;1.3684106704797887044;-1.2644624513971749469;-0.19089803948415975943;-1.8913742172220038285;-0.56473213950235678915;-0.51828328883527496895;-0.36426715234410977917;-0.15628202908748381472;-1.6632416553960467365;-1.2679744581662424352;-0.96745160366796167928;0.38071368869532423718;1.5512038163868879792;0.68702088708501563019;-0.076840418753370068328;-2.1184334395463255696;-1.3221838938997221291;1.0169240877965397551;-3.4363273632968667215];
IW1_1 = [-0.45149801190172744736 -0.17384479684755291262 1.8145251289323149901 -1.3046664055161241169 -0.011015872915406748137 0.25468193714539116845 0.63527131473174069942;0.6875763141979017723 0.089417155733228614878 -1.0380917048914897194 -2.3159267089670301232 -0.75239459926228724473 -1.6169141050324817854 -0.6067427468570778526;0.00026334504850539230958 -0.43545464405791400875 -0.45456924725587272151 0.069733799013150382651 -0.32104275621783412431 0.50743756003973927715 -1.4058374481068480755;-0.43378892580882599805 0.76638514435101690037 0.12543738639526325063 0.21366536423660181798 -2.0058718109890620873 -0.54238037363787772183 0.44582742638458061624;-0.36954279110074816916 -0.24910263595958678784 1.8248231450547238719 7.0341921896984356266 1.5009894237057932465 0.16764028573326222871 1.3280143293819386408;0.10706394909478240962 0.51869940206163001051 1.1632775210522852127 -0.097689663099698148541 -0.099052441804663424185 -0.73691189089807029866 1.5242529385545000586;-0.12134950029802064886 -0.74551155121105316947 0.20009199623227463816 1.2022281301477875104 2.2836796203787543824 0.56588990106915848521 0.055631331413311238543;0.58298526964364139058 -0.15312969268160883662 1.0031034998125323288 -0.21862704282569395131 1.2972027794427634095 -0.90344996177602032716 0.39349256678471183912;-0.69917734012871934901 0.3467808226574757291 1.8758856814834352633 0.15898764688461586303 0.12925124803958712438 0.17416698251110296347 -1.8549699965524628631;0.63677886199944744305 -0.40389937414792209669 1.9285945510283564186 -1.6289385729253602619 0.74087216546840228837 -0.55346482724547418908 0.39365530456238934098;0.35407735984574872923 -0.21248952221046554789 2.3309610652055945401 -0.095577834904599812127 -0.32966354376666623383 -0.5292742616606276318 1.4542678740857384323;0.23377565637672947929 0.038223528374112858419 1.2849237208071346839 -1.055683192964866457 1.4290812375843711113 -0.066370183147337308283 -0.33611144416099686394;1.9456958537347424087 -0.37441273318173229345 1.8290595573660404227 0.032665743957322329605 0.29066382270343377181 1.8738419056376258709 -0.88587851894696223454;0.15010608420052634626 0.12157893896715432636 -1.4420451942691252523 1.399449783746143261 -0.71231299415343884984 -0.26862892983785541245 0.037430603076919949368;0.20810020944218116101 -0.36709423242669531051 -0.73137908011484953352 -0.58008361636336847056 0.11516664740096919928 -1.330549487175504586 0.47142126597954969736;-0.028599631198318667402 -0.35979573788724616978 0.16844631438109639032 0.51873091925747027986 0.97630805892053884598 -1.1141076287795930178 0.18560407594904862472;-1.0255661084756901857 0.27315357736327161575 -0.074921186616944995817 -0.091882467919873922479 1.0839173269976143388 1.2076246103578784918 -0.054961477774230341198;0.49152020213755132083 0.25420962770824578891 -0.098873199126204042164 -0.1179031552212457673 2.0608417707198496416 -1.0146880858224658351 0.23391684048199906654;2.2215972424545862296 -0.17313295485545618368 0.88504920017340282801 -0.15799109696705121442 2.4504084587877237311 0.8881758566233776131 1.1547495732566281923;0.15869062692782232027 -0.41932313308791629991 -0.080410201382274434923 -0.51556657610575917783 -0.69949279353472382237 -1.1304944982493203565 -0.47168791885776972794;-0.27051663313733242955 -0.084658253589077608892 -1.3921841711029505628 1.1453086292314131889 -0.043827112978384381858 0.29924847399930543101 0.59351395683059171571;0.38119104180238710944 0.69997215680756696976 3.0456624026341998501 0.11789104579876021062 -0.25577474422756135697 1.2655630090661698084 -0.93933087785219415711;-0.54025541536820731459 -0.11513593410235155312 -1.7091870732391714061 1.5251121939619260992 3.5945103023236337769 1.4313091735577307961 -0.45197231971346407686;0.059532926760674620414 0.14134053183001155096 -0.8416162756620934049 0.73615299503370379419 1.1881412391799270889 -0.68847939389973222823 -0.18046942989992167949;-2.5621034596653133875 0.23412130437684761097 0.0098949673527561898823 -0.40504178972026649852 -2.1999521513230653191 1.7248653376114599922 -0.080344841728839308526];

% Layer 2
b2 = [5.4484461957062233495;-0.52417028416041711036;1.8888911413279976248;-0.45774877780147527062;1.4178453036434306433;-1.9019107520142775059;2.7120367649911001351;1.8872816562521141925;0.68289794153424832057;2.0872776323432193912;2.1453873472754176888;2.0572106996231394049;-5.0147000050234629143;-0.46106387302825341257;-2.8715098209465828027];
LW2_1 = [-2.6092554966411989348 1.2888427935248571998 -1.0370821827687903838 1.4131856322261462378 0.41405936019895134281 -1.7671321902766941037 0.97419074913172865049 0.04435095489225118065 0.6294131904390817267 0.055535486519424706597 3.6575483072077363822 -2.5133113432915554775 0.26927412614267137725 3.3461509042179886642 -0.81822763657010810778 0.37464493595310782714 -0.56268655749962626089 0.81811290202506681268 -0.18422756660935799 -0.61798956821668815653 -1.2147848515488617327 0.043375001865723808447 0.29494022686018395163 -0.93047553825525497473 0.58159157274692652173;-4.2935562145735453043 -2.0027544819496676531 -2.6619006848657456032 -0.50888851833744785935 -0.10075924131356650548 -1.7526934626850476651 1.1421126281156259719 0.7511882204458233403 1.6706668896360703513 -4.0794995902391315568 3.3898229422937231625 -0.21253583321610261536 -0.20003691919881105843 -1.8733115542699092515 2.0258677957295496697 -2.4275187739435484247 -1.290800607997075522 -0.69942063444803936889 1.4098453621927422574 -2.387638259659765616 1.3555416666623671951 1.9113754910211115945 -2.9736303374762749208 0.6778178781236772199 3.3584498581757191715;3.6703059396581134699 1.5356586456923266848 0.12461331891074985123 0.15235172596334842221 0.15494122349875177891 -0.71247195487368364386 -0.00027672853893328120539 -2.6843492465278822046 0.10843522127794001653 0.57902538141640880198 -0.14220628750664693341 0.51193829023283066171 -0.14900503701798437084 -0.58554761750601347359 -1.6724497966980840236 3.0077019694489899315 -0.040703033566469898341 -2.3331772895916165211 0.25124143897262890546 -0.57974582114720019099 -0.52316808822102933707 0.64004815733753916973 -0.010247585997362539806 3.2044330829986908959 -1.1033159429548100583;2.0130468274634454318 0.47479086382896290575 0.27701647529139517001 -0.79258843758614827557 0.38854104595080740658 -0.076013697881013239654 0.3595381928116452297 0.40838321785015074816 0.66611387690900158987 -2.7930158778856140067 0.3678439893213579226 -1.4069954287330477261 -0.068568509928320017788 0.14286715314853226655 1.3460976431582913904 -1.4129476795464994687 0.19973228358096661861 2.0711389699150237753 0.51597997549002305728 0.37318872358352261909 0.21550041764834004798 0.38747427671488415823 -1.3589016930934489924 -1.8666858643364090398 0.035719917468035093655;0.79112782794027114441 1.8954094370079299647 0.75674165149833361177 -0.38567669863469344893 0.64376982163007911986 -1.5464792356799512696 0.10727791791237047125 5.3250609325558464491 0.79421541250003802048 0.18319751622533797519 -0.88126197142997508838 -2.7918901822142054847 0.52136197745754941923 -0.60564784264802995484 -2.9858508372149010768 -1.4936126624282692887 0.36984340335108867315 4.5629002489252510344 0.011454408496036454224 -0.10064579920602620411 1.1028589808485838031 -1.1395398042185649334 -2.0434605356325556968 -5.1272425373325116738 -0.35803764443215430058;0.19206353465805470204 1.5482537819354076358 -2.634396705266079497 -0.51706875518880401899 0.21347394658592527827 0.91848268191165061136 -0.38663047180200754704 -3.3267025853756044818 0.077070098902718126022 3.0185948875153103543 -0.41223215949533653646 -1.6831409564894384001 0.10662714916937236775 -0.47366077087997415784 -2.7859782828178745184 4.2600434467920607062 0.29046226758847598637 -1.5887891410906889167 0.038984300882292044488 0.38685179008380704557 -1.4601797998978753856 -0.68837865454499957973 -0.16700233770149375268 2.3763060304396388389 -0.40834797897921304433;0.054659329453408803112 -3.4479812821808826229 1.1992364807802735616 -0.3198554854702214123 -1.4918481892043324866 1.7768455326179251053 -0.2879507061395186196 2.6732411825173980624 -0.20516526861030662254 -1.9733856078907625609 -1.163910388640518212 3.7452695042153805183 1.5564166067905778057 -0.63644116447800358483 1.6677962424370378347 -3.2710840023076919181 -1.2159645670864445144 -2.8273346910549257416 0.40464481035834010125 2.2913851917810066361 3.186189452688869217 -1.5859098139557652463 0.8034762917151470063 1.3183044887597559214 1.1641673457775767453;1.5089688064055393202 -1.4209413097263761117 0.48407093669692768945 2.1554274142697162908 0.29503766711544426871 0.3466861419059643068 0.91131808656094392962 2.3297514462490185316 1.1381171518995238934 -0.55690378892609182504 0.32067466293043767056 -0.82494548522136779134 -1.1031092259938080069 1.7977471486702141235 -0.83120711720326756478 -2.845798501161435734 -1.0865831110430235196 1.5043313428445597157 0.36905785288965886615 -0.36087762877948825757 -0.81385133406500598241 -1.6015662706901434564 0.32981664648848924015 -1.065170973583293712 -0.13345403356273374817;-0.032600981131738010488 -0.22430856207752128406 0.029246146179701171253 -0.26763409169537255572 0.46418617227763681043 -2.0560017358637874274 -0.38734443903060672421 0.82275262862726672441 0.69247223449177808252 -0.58133897544273205327 0.3285960277050883338 -0.93268015380857283159 -0.10032551318233531856 -0.89258924482087265151 -0.036742328364863019452 -0.97080648093347698957 -1.2127421730776553055 0.5923277531907720217 -0.19626624404648945754 -2.3801297088352524334 0.79591234484808348615 1.1962226470370829201 -0.23115076116718422106 0.10616906175671322887 0.14285600752895957766;1.2149198585709346521 -0.48941118495297875057 1.1436593055403794228 -1.1375219375379495013 0.17138199568043502308 0.27619566666083494866 -1.2681503855564850713 0.045159833084594938613 0.17549563188983238748 -0.30121717580459683727 -1.0887306482262626428 1.7608809967374237093 0.14048092452459270962 -0.19537776817984442435 -0.31036248806347299656 2.1219345982421464747 -0.5339046355612753203 -0.27898845598765376064 -0.73968085175285414046 -0.19643441215874474226 3.0815071321282410111 0.49692315631228034523 -0.86170676967377524136 -0.58421451478231523069 -0.8054754665210258624;-0.36830739316239829995 1.7351814537217971068 1.4889601898288986614 1.9551844132678215527 0.5882595173043584369 -1.3801083049705842321 2.5447575759136222828 1.4453492781767052211 0.20280155684954753736 -0.20709677866610110009 0.71111048933538212324 -5.1305725803105710625 -0.061140051648092066938 -1.2300228140132873911 -2.6304810293295313173 1.9601089719088351515 -0.5047688044494833548 1.8175828922088219652 -0.71533240952743903929 -0.97255439213305572288 -0.79922922436821142167 0.3916479107456056763 -1.394424731622343927 -3.9107682880874827802 0.27443088105061397286;1.2625919350498542304 -0.45160706926316185328 0.89803025890831422728 -1.2553772082271166255 0.19643048329595402812 0.53470405236203100152 -1.3049024687962231805 -0.34821065293723674205 0.18794389656829982305 -0.20503543300116069958 -1.1402272832715381057 1.6296273904573808089 0.17594545353531670928 -0.25031556845092411967 -0.31955401273064520939 2.4891986605815938915 -0.54330166009628255708 -0.41601154521072003512 -0.74305274335431525934 -0.10715310682761060301 3.091385646286206601 0.62239564596572372057 -0.90280365800735296045 -0.14834050680011143242 -0.64362703143525501481;-1.6850871166879450858 -1.3549123894951013991 -1.4822604795011053991 0.84191841208731188484 0.77641966611155888156 1.7445609728198256949 0.79585663493563307824 -2.0872076760644837634 0.54277263179598111975 2.8368776015817402936 -0.92246557890877012298 2.0419200264717045634 0.05069469537579944507 0.73921492225253193631 3.6670290435800656503 -2.3811981519218878844 0.48094314716113684138 -2.581282036884244846 0.63412902977950380556 0.39651898400352625362 2.6703023808030161845 -0.65289148182267287002 -1.8860515030848505891 2.0138183025801241754 0.0095718384242788230598;-0.3841241948747841084 0.81952946797619274921 1.456785552311429921 1.8235480873931257939 0.71303649851999639786 -0.18503948201202968793 1.2140958405603168302 0.43544807175023980683 0.58222998662157310346 -0.39749298523774889702 -0.0087019474552793556893 -2.002680287657077951 0.70089241848001970769 -0.47703553055778258329 2.4973520764947680917 -2.7828547806680772325 1.3208426886536646094 0.34765778340386349621 -0.15859505630163472922 1.0786582385706009468 0.95473833580946010358 0.5453602159101408331 -1.5749949420170963332 -0.59714646352236777638 0.46503736014799290643;-0.21539247621648019426 -1.1277857634979431278 1.1330872555224229536 -0.59879848267967561437 0.26732537578524512289 1.8741688850753186468 -0.68566181593953978712 -1.56408360494868659 0.77675285414033734543 0.9032483941627034163 -1.0488064514121095971 5.6666313293449981359 -0.35785246840083129172 0.65810255985934940082 1.990103833020194557 -1.3572210304274736625 1.0393752975771197722 -1.1008910175564514677 0.53325099538612219519 0.220821954100032386 5.3375333522570951317 -0.092913209600503268715 -1.0792120280193011617 2.5035423039744206797 0.13100557101980783714];

% Layer 3
b3 = -1.3313624206770025005;
LW3_2 = [2.1924452711774486957 1.256663038523773368 -0.3193995926607783864 0.24989740828358231184 -0.13908607522255761468 0.35928012475688303473 -0.34515368769926735304 0.31009345210037364549 -1.050871289836469602 4.1341618866556055778 -0.39261907055424510871 -3.7553687589682787085 -1.1334151972635793104 0.63309415827253079367 1.5606915239185887856];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 1.90239167587468;
y1_step1.xoffset = 7.36300175998845;

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