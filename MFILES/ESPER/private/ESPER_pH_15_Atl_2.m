function [Y,Xf,Af] = ESPER_pH_15_Atl_2(X,~,~)
%ESPER_PH_15_ATL_2 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Feb-2021 18:30:25.
% 
% [Y] = ESPER_pH_15_Atl_2(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.999999025224415;-0.999999994516886;-40;0;11.29;-101.945317545701];
x1_step1.gain = [1.00000048738803;1.0003169936794;0.0153846153846154;0.000310077519379845;0.0705602618858232;0.0054210015363163];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.079861622022281864;-1.0510946157912091081;1.6219571664910064079;0.96003306559953793808;-0.34526262773441468434;1.6306912073308250655;-0.98896538553999691068;-0.061207523168851238338;-0.10297935950687134299;1.8481314461456301856;1.2153910715687190613;-0.28372056427241226784;0.3376245076440149151;-1.1958268485928436053;-0.017918130194193675891;-2.3353017625864351814;3.3682803643171470576;-1.2863138891731000779;-0.90651791457634156579;2.7176962124786059327];
IW1_1 = [0.28654048232756657022 0.40965057828058859535 -0.69337653029980406139 0.52168806863963823606 3.1129601316380348663 0.30333379664953036281;1.5172343532788765685 0.70416942469715781971 -1.0408040647691225722 -0.1425513618008911465 -0.57296715654239238624 0.66832069916071423776;-0.35321981169554544921 -0.55520679359391755803 1.067886416556444118 -0.13383676328450025417 0.2351775648325474255 2.1590659851050939544;-1.1256378433449700793 0.61846548583307092706 0.48412299271182235305 -0.50068781073444723617 0.29154331194972649133 -0.98412050891874502945;-0.093331707049337464532 -0.26974586748198725594 -2.62408859490020685 0.54480458406808840444 3.8488439898765647307 0.41176764539378635233;0.5207948436014628868 -2.4045645886937148106 -2.3635964161032614328 -1.3151978692151280459 0.36537459283713275005 -0.53206254781898920658;0.51082475985945474672 0.76985951446382683283 0.34074307328564396036 -0.30003988884766535916 0.10381313118836311971 -1.4661431060576592955;2.3833182642117258787 -0.9734273220363417467 0.83042832135009980732 -0.2018155957929281541 -1.2895191847945726149 0.45004088141371451082;-0.31912913663556047306 -0.90149541290056978138 -2.6204269887928326455 0.027563680691345127105 -0.23848921233202766135 0.35682961604510321507;-0.34385625596685320815 0.33551780336227426949 0.14897592804916767739 2.5351238181633632962 1.9330098342334847139 0.6064690003783484995;0.56462416458827446863 -0.71863897447437719013 -0.22169265639052745942 1.2968223690717055607 -1.1035476400697559196 -0.83899905016417919423;0.2001651280638002961 -2.0247603864968488629 0.36507090187603874476 -0.31017569990054816298 2.5464784064306327238 0.70124402615306913322;-0.27515544527878060821 0.30210812384718727097 2.1254030701114876578 -0.23020269175652094407 -3.2552593537715881489 0.93648192376230432465;-0.99612727461358929748 1.5170296371763625221 0.99339409681445900446 0.17012343186529124694 0.90061283768624333934 -0.063208341802861389702;1.1931131447122078626 0.72427896397008073581 -0.96988223703323506175 -0.24482578093694032373 2.5200318368834269123 1.7485274582077721117;-0.47583318283230496837 -0.24537536279039537379 1.9984200972781736017 0.092442575260706844054 1.0890384145512679304 -1.7565076010362630221;1.1305032507580070611 1.0837080547577440104 -2.8325943052508555375 -0.50646621824882009921 0.11516061915262736093 1.8661549089648907795;-1.5286675367100988066 0.76559648398169222183 -0.24192861665991158282 0.64150215611873162569 0.86011228466250611024 2.0182820917811699069;-1.7451346987147271506 -0.56434959992291999775 -0.23576481370910490343 0.36342819139145166041 -0.69040275583212584731 -0.051135417142343847496;0.11677965161451754617 -0.8933470663960476621 0.82920373425289151115 -0.028064056909239784576 -2.6444894345777383293 0.98195917992221959381];

% Layer 2
b2 = [-1.4828838799259318471;-1.4582332405576441392;-2.133153193335546316;1.2379797216278807248;1.1000708566705890146;-1.0073136302834388989;-0.69897752050695627357;0.33049851563989302017;-0.048752598590920979971;-0.64721233772981134891;0.81575445005348357075;-0.26907880113335663763;-0.56753869444538851408;0.11556842110703999249;-0.64083930286953616484;-0.66828515852263270514;-1.3746935218901403797;1.197855730121187845;1.5014485364262939449;-1.1825388775526357588];
LW2_1 = [0.45079512146165101605 0.84330730686398491791 -0.37874518249538979831 0.82250344615974391171 0.6942608012733257894 0.28381813031616792697 -1.2954704146431239575 -0.22278859046458238113 -1.0713138641200867784 1.3562483544868144669 -0.14763576266295508344 -0.9762253274283126947 -0.62942733982196708009 0.90589750693029669204 0.69369809090943812535 0.60662789421733587236 -0.41322657605451407203 0.29188557843995294183 -0.39646252726463410143 1.0399835174224860701;0.19981527122912132177 -0.32191590162041422429 0.24611775742710370607 -0.098169145176509042816 0.17548198497185152345 0.11584037596605251119 0.24331277262628495106 0.38221529294369888108 -0.18678281222416973084 -0.75869431704783529824 0.07347316763511729798 0.58033849263078718383 0.59336696484176187916 0.071058986358492601254 -0.49389508425381795087 -0.35749311987375714805 -0.13300747251968753071 0.26904939912039893546 -0.56509252821500288722 -0.098366669162116518454;0.71480712921961919726 -1.4299861475885768947 -0.19453872747746242533 -0.46076673304895648942 -1.0895127411589256017 0.11275237900530794832 -1.9023380783970027519 0.36631267561168812108 -0.34022230155021637721 1.263279541491349578 0.40117622969650973408 0.19959182723663726478 -1.738845576519657099 -0.60862091936477558107 -1.9574236782243554789 0.036296768485728478359 -0.60211411206183473865 0.12588193078171197592 -0.27227397951480486471 -0.80243786993924826056;0.022362642178764900736 0.49411009457000659717 -0.47228841218636841148 0.23623617968524232569 -1.0407188398920987904 0.8050112677762896185 -0.75724234916216581759 0.2637508392617816666 -0.12502447523417586916 1.3226117712221656664 0.89917271615753679992 -0.36402264169706555208 -0.074910235295733262895 0.63777832078049156994 0.25909901425194264979 0.5524427366326666311 -0.014980970811255087116 -0.50162407377693152277 0.32024930640087923006 0.73850235058037116964;-0.67718395002181153153 1.252604743334023274 -0.81234402536674577 -0.19409018589008095179 2.3614680918207522353 -1.2081831020176108105 -1.3826624529461659652 -0.60442515429709742225 -0.18066757835660995912 -0.83988648896745077277 -0.41995121523141815123 0.19874490860529731018 1.9987305873441378878 0.65844311042831638048 -0.27827100364979284741 0.99791142274863431361 0.82356129299917213427 -0.29710564318525767291 0.61543877188569628967 1.7047943126266915659;0.6449737191680896542 -0.16873411948567959562 -1.2129487481733138843 -0.2580639725432850029 -0.50657694440202361008 -0.61065458801956107315 -0.97080064773515084564 0.38343006477429275591 -0.74021162938413309629 1.0190099222321893357 0.22759210280834632489 -0.11062531748697551626 0.12123124041172128607 -0.9768654576597854966 0.47960649471790706144 0.19620639285141430741 0.5824214256237698617 0.19842855167315362475 0.44099817014962255923 1.1131209514680286965;-0.3281532703093560932 -0.25986676244110556988 -0.59814577237351440608 0.91291385696582294518 0.1403783991162852185 -0.060496437236986347341 -1.2066165481593114084 0.14207202780368458073 0.29125934188503871392 0.68677293629364399852 0.69884112597405201317 0.32021061902970981983 1.1357161953222822959 -0.46630560198520015769 -0.091958435264028137723 -1.2598885456845378972 0.10628582922386414777 0.084947619784965830436 -0.069222984823152117206 -1.255608176831287226;0.36300653037521796174 0.36447752924802062635 0.5717101394049941554 0.62853008272414034874 -0.2025765930363067624 -0.63810818500217436622 0.40062706714699852784 0.21609477068799126664 0.51368282989213731593 -0.495277496355380209 -1.1461756030282650443 0.285300429329617522 0.062948470564467506883 -0.96169242440183422271 0.46642524928731060596 -0.027056778852102517097 -0.43648940129709062896 0.6203149388145040577 -0.034400561784244207408 -0.16196025310933323538;-0.47521501795517678834 -0.22131245417511746787 -0.24152865035591775111 -0.77907200548102106819 1.2539980925806453183 -0.0042357595516337538319 -0.1900006720070848143 -0.46686806171155142975 -0.45750457737760696908 0.61590514611843849568 0.37906386740825248616 0.67874986430208750221 1.7844652738237474221 -0.45533099428722628721 1.2596084650842316321 1.3060869446502092472 -0.19031439602219143992 -0.53956777429725100159 0.18772018743972743171 -0.67487668606497452917;0.11908088438462470504 -0.25462524266560343511 0.042077027878592514198 -0.27450352366600461185 0.30826832291284905763 0.42978009242103681897 0.36605943435300886124 -0.47624262417052726226 -0.63975057455779715809 0.43338370405277065744 0.29343499526633359809 -0.036700852165260686166 -0.14117069266829945784 -0.43021255273775699246 -0.34324495647562691669 -0.66575227382020762956 -0.077782157717781671979 -0.39885491021706714898 0.15284703792584028448 -0.56769557692683536576;0.04428081196032480904 -0.83011264187499156364 -0.23700875848670549528 -0.38986675077690047253 1.5105252399974382627 0.33336125172106023662 1.2547329156499411607 -0.58516835292110069844 0.4786085599134898283 -0.6370368185977404174 -0.59772174390811461109 -0.12375674620160001527 0.37169232110904437683 0.68974911401919380971 -0.47824796625258469973 0.67537120857275001473 -0.42700739806820220412 -0.66348520178858994001 -0.25042631547706051265 0.794475773680582531;-0.17191433613174511574 -0.33458125683329315025 -0.92091286092643953598 -0.87106207474598429386 -0.83313284432840006843 0.70298464694063211855 -0.46995191008085668294 -0.073749729850340672854 -0.8075828527235062726 0.60862285829698026252 0.54480478573681345722 -1.4690249779221726811 -1.2815055196540516835 -0.058067390677036714863 -0.73753716705051419744 -0.72811408300296809326 0.25907755672298715677 -0.36435319264377108439 0.062381059243025074879 0.60758066845955016611;-0.28384797881538736952 -0.59315707927122940379 0.82271825282091282094 -0.024152435624635683331 0.55163194831542794461 0.39501172953511043406 0.36496462906537108228 0.92524995168345858243 -0.35351076453249685727 0.70058790471544840628 -0.72804950004878743464 -0.40628048881093781208 -0.58442327535934301963 0.50122593200207776754 0.79649344075860195602 0.87186593519872956914 -0.075460155628158595564 0.14084924111084468068 0.21882036045301128668 -0.64730663850255965031;-0.96129800263839182417 1.3566724596621941856 0.81256352969266842923 0.45500348682958913216 -0.36369162090053686054 -0.44947264657465108018 0.24405780473037888556 -0.066671907277915623546 0.11093526809495361796 0.61851091070780062076 0.50623510353722311894 -0.18878329468458668328 0.093617785857766588897 0.97476733861018993732 0.50648088679701575021 0.081047441954291907229 0.33222033159769043253 -0.5549502950111251387 -0.19037480150227453768 -0.7734082766233087991;0.90841520600376757244 0.166746974820685262 -0.0035367079493220654474 0.53084846487943326832 -0.054281392755740009992 -0.12888448928748375 -0.62238058998080236783 0.42669785980338476028 0.31049657367487837334 -0.13763103892712083565 -1.0278902438098407313 0.36230477589051252041 -0.37468931779258546344 -0.027013013514905634405 1.1284381764353172972 1.7280165965109339776 -0.14759019515302007619 0.2924465196760134833 -0.39342161853822821271 0.25934436617139594583;-0.60019767063585904854 -1.0749688799012919738 0.51106961649275473025 -1.4934295429760742202 0.083663401715337121223 0.23832723343116818393 1.772866893160988333 -0.74154365600477467613 -0.17447409987892001371 0.89649013551890466278 -0.68190153560539745747 0.080239209846140593929 -0.05160466086269653585 -0.0016898050900541754411 0.021626194611772110027 -0.84701977057737476429 -1.6342104708625919685 0.14114169610625548756 0.54172176692692386446 0.39674472966105317484;-1.271977806622021534 1.3825478311718966129 -0.56702068247668380163 -0.4945200689266808225 0.91744842388266945044 -0.16485470312239311474 -1.523784824015114614 -0.9648045510933229707 -0.90874442145350919908 -1.2081699151545337578 0.51367434684270563139 0.53695002312829043234 1.6926152105690956962 -0.27115498227976886358 0.16636388186539610712 0.15124050341628134109 1.4490119123895974784 -0.55072172388083351358 -1.0604613529631867763 0.56306960862161026249;-0.56665672089139373924 -0.47172759699512400999 -0.012177571025085121362 0.19853297214322640496 -0.96648467760330525334 -0.97097483957246599751 -0.12692068026859040786 0.37058394101058628189 1.11182283045771646 -0.36010483084056110759 0.45376540236476825552 -0.47115681210715937288 0.19492619144376849283 -0.65971095805174917448 1.1000813383902823261 0.28971477622872154889 -1.0509410393323759259 0.23669260509974218709 0.20032674863740229654 -0.33818543180618787503;0.21801741686019901478 -0.92346869978258627754 0.63054212747812921069 0.35189576967350982839 0.68932939958061822949 -0.35201744544789959068 1.5732139004640404156 -1.2175016819701902637 -0.16077676694714029826 -0.8384154282556137705 -0.52655811867166923967 0.72225718449353693007 -1.5346252260225674569 1.2129132771336494923 -0.338810778254294509 -0.71469346204105310694 0.72836112668286168148 -0.2756925079044109661 -0.78051583743719521458 0.38633930302560631764;0.16823889244047152136 -1.5527229812912710649 1.1567908410950646925 -0.20533118949367443196 0.35652098629066580893 -0.87389572262499315425 0.45487691326547952109 0.36059479477176864526 0.51151937826792659436 -0.19604251124598798262 0.43615635227024801557 0.11880738301918504496 2.1559983048524564708 -1.2748618426810034432 0.60564164802027220524 0.042717831390869313857 -0.90986695318791155351 0.47092398717686678733 0.06006507842192961022 -0.14687094120567742439];

% Layer 3
b3 = -0.23292175613090976283;
LW3_2 = [-0.73091312989691081814 2.6479658144019313504 0.2765140984090881382 1.1939842914936520391 0.51801447585925441963 1.5544057761373908377 0.37255158136073146524 -1.052469842881164297 -1.2857603948850213627 2.4662322852939144724 0.77197717138126331626 -1.4203614848255434744 0.45174557503650847323 0.8879245152248337325 1.1989640613543919301 0.99965685805948156784 0.59925144484254411203 1.0899602742339147277 1.87069650531852405 -1.0132326818231633947];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 2.03830178109291;
y1_step1.xoffset = 7.47181919175367;

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