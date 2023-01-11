function [Y,Xf,Af] = ESPER_TA_1_Other_3(X,~,~)
%ESPER_TA_1_OTHER_3 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Feb-2021 18:30:00.
% 
% [Y] = ESPER_TA_1_Other_3(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 9xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.999999984769129;-0.999540494077341;-75.751;0;29.715;-2.05132667284751;-0.9;-133.803853032615;-0.1386];
x1_step1.gain = [1.00000001035699;1.00022983623563;0.0140762793578401;0.000302617642608564;0.251952632905014;0.0584431850247228;0.0422119037568594;0.00432440760873659;0.00826143816767911];
x1_step1.ymin = -1;

% Layer 1
b1 = [0.90547034869161058257;-1.6322498692699796141;6.9058190643270940257;-1.5780281884099605083;0.62858778826092076564;-0.35238645151457997917;-6.5433918065872802572;6.1958712153178847615;-0.69830599644207147492;0.45232983249807057202;0.67064695485456160551;7.3407327332265293052;1.3626002330284874287;-1.4293698705625170753;-0.035815516513681130983;0.69054255930425667565;0.65061696999821083676;-0.66625929761270974439;0.37697993489394848732;-1.9657921446794852649;-1.9313749905239678828;2.1402910098976972719;0.73482196537175292761;-0.2691051908290109651;1.4973926773162737902];
IW1_1 = [-0.11454283212556194693 -0.016384261200331255715 1.4827653643329807842 -0.31960390247056258417 0.56385754080491767848 1.6472930162234959983 0.74128718498743328968 -0.22302734966221079982 -0.61857828998826980271;-0.12327138878263059485 0.17446278441380397295 -0.43437033035823519045 0.067289831934384175538 -1.4110483991265463377 0.40945302568392771825 0.1278869709079152317 0.10110651406305158628 0.48043524675391335865;-0.053497816130135142365 -2.9009019910901976402 -0.1864057078925304145 -0.0081292164769348942283 1.1715540121854000066 3.8920382125705312859 2.2679245766973488152 -2.9720144639231538264 1.0550965227805608748;4.1985210462174791246 -1.3601869146706113689 0.86944529578273133108 0.33271143080611748077 -3.5764424070207150308 -2.4694175780510190243 -0.23152575344983045147 -3.5151223400502717986 2.2020801029162035967;-0.20873749451282111456 0.25056459177780981973 -0.50689441218779396348 0.36541888300896629982 1.3671707590701009938 -0.88668214285275603892 0.088829646906393083805 -0.04352331557513307303 0.28916512255752496729;0.057204756972472285692 -0.42646022020067408942 -0.1189524712290283559 0.70834839561950835307 -0.63859091578515170262 -0.2754664974653080467 -0.10257907111397397693 -1.3044437179054158005 -0.56302798670229226019;-0.13069425424851080497 0.91940732869678309935 1.8287905731230571504 0.3942479323017161752 7.6986403284566957694 -4.6974571127981343821 0.019454834531911185946 -0.44115100504217086286 -1.4300289187883874487;-2.9921318118648141393 -4.0015428133219606011 -3.184259890189957698 -0.9052428613395361312 2.3040195287281450831 0.18201846314266212357 -0.2707382424203301774 -0.43078500171228595317 1.388710152168984191;-0.061281159010134235443 -0.21010169530106875824 0.14561306271183202532 0.39714770514668223944 -0.10087858531102726622 -0.65354089683696747759 -0.61993341258921985659 0.14702460166871517133 0.68829310874372395812;-0.014473543648320093963 0.26508660028394065433 0.095607399201879550432 -0.26114246057600054574 1.0529281219048451934 0.58756636686757757193 0.43869019532245323578 -0.076955445773979322399 -0.40207927508719337739;0.18142919860670461696 -0.073642521863876403421 -0.58980869681161329776 -0.19172750893596840482 -2.6626833895341111003 2.3345736665660012932 2.0294890866323891387 1.2721076149351677742 -0.85967534508275900151;-0.55329856861592185968 0.33896969148298472518 -1.1161332494748583688 4.0145558692730363148 -3.5215934507113049179 -0.92475981631975234798 -3.0294849177115139582 1.3046320434156410961 2.1739425738559541301;-0.11198754776937316913 0.6857024503748551103 0.18041536284319739658 -0.43510579099780827272 -0.81882278910722083864 0.72850998406079170433 0.24030286245604040585 1.1930762579528162437 0.63020579808629073604;0.34971580719958694772 0.64603507664663395449 -1.8790033119942546325 -0.77377703433451827664 -3.3572164926511733896 -2.7233276827653605245 -0.96066809722361812263 0.80201954668823904893 1.8593302089061463089;0.0052873591531987932171 -0.20934730527568565228 0.59442367331345102865 0.10473423577508027271 -1.5469631445078984022 0.67733673291721741005 -0.18247531897298707726 0.50643410886661521797 -0.39960416445377966443;0.023325676259206670066 0.28199352029870700109 0.39335892138000805307 -0.11204587019706313544 1.5084681524046246182 0.42810458745339008413 0.2676961320191039162 0.13967194403932237101 -0.33013376875328487303;-0.018534354090114540242 -0.038686267940998331216 1.0542801274099669051 0.14697203791097385173 -0.84667413853255002465 0.76655751180570508296 0.79494348129663017222 0.34643961145549101444 0.066404056864188931719;-0.24759567785025982101 -0.11566631448245369429 0.39256885586997447568 0.47074803423692845872 0.30512689783272745059 -0.011288551611568758276 -0.48922640995370036965 0.66727079949288514715 0.34041001289688849196;-0.73542734435860690478 -0.75888571037351404414 -1.7877699903611086185 -0.36575603223816327558 -0.94711649093263905463 1.3958352396090185632 0.67200767561513252701 -1.1652230219839094794 0.91919047929627484272;-0.094403411593770233945 0.58308472631097285621 -0.040647865857090306752 -0.28689006910076464418 0.79138812295882909886 -0.21963341737648367502 -0.60747764529792724897 0.17618616974257539365 0.23584593447452834036;-2.1463633274500573123 -1.0823508549286589009 -2.680695367431502163 -1.0503836291675068271 0.25423353084685590408 -0.75568497926966538003 -1.125670158580678093 -0.94573081897591981804 0.4492826753977698373;-0.36901092550371528134 -0.89524562010757546826 0.18446330949812056454 -0.39587309941855397533 -2.9515422893560856465 0.39201976849318681539 -0.7258206266644121607 -1.238056361050727805 0.88198138422711458428;0.14831795696092398007 -0.015905065483200375026 1.1858155188761350107 -0.058396455626054687149 1.6183021088065117077 -0.23479633735008134665 0.11582757016142930517 0.31075591041680050708 -0.67396176131782026264;-0.0798327991472276427 0.040098672725875646183 -1.5280186614121900046 0.016474609011203837639 0.81403326432089517795 -0.62992644266211261783 -1.0052345303206431382 -0.32470354497899761581 0.2348482468143926194;0.526402700822070857 0.78859327033451021016 -2.1074397509696369823 -0.40329374926136463131 -2.1361223879998827435 -2.0653787920249646604 -0.096544219632487451865 -0.80734862326242451402 0.7591519410068374718];

% Layer 2
b2 = [0.61146593378557012599;13.090163035250290235;-3.2739505949560312459;7.1333850710405810602;-3.9401081610486072826;-3.6197629838232403543;-5.1908516510953806034;0.568197707489664805;-1.5624155339623047034;-4.6376266435294173363;-12.681956072635120591;-3.7761844831921385079;-9.6477313265083708416;0.4689424953099015636;-2.4880928308393812642];
LW2_1 = [-0.21121219373777491701 -12.626848158221241292 -4.5910299971537087416 -0.63018337762960374704 -1.8008135323254188531 -1.170132878184902081 -3.0525562983511203008 0.18566807039797789125 6.774604841955085277 9.4134355128736650897 -0.33879776071543038496 -2.9952108746981851439 -0.06924598886669357245 -0.94058275471391172839 -2.3149767663929976536 -6.7011484881273624126 -4.6550675718075140708 4.5954112005768399385 2.3078391275410705674 2.7691631737185327111 -0.41422631826372935393 -0.61639252060106319853 3.0777431048616814557 -4.3499260774691377307 1.3015558938727918026;1.0568805917861143762 11.275508486852642065 0.96931505341802048914 -0.23199992102600044963 -0.80435805853470776494 -1.1659422594390986827 0.66381268476212595964 -1.7247842793503964653 0.39246893798556553579 -2.4321453467914215807 -0.087856937182237332395 0.048140248506803214046 -0.84901524476304812694 0.19166153630431609356 -0.59974849280767050796 -1.0405002024645952918 1.1986639657474669196 -0.3772876484779217332 0.7622740675572414748 0.75406049707913380686 -0.37574966752921185043 -0.0034548597695749213785 2.1243937563675525659 1.32715165626263909 -0.11420330099703310256;-4.540994202188512574 -0.70208144881166745233 -11.61285143873824488 -11.72011366070127103 4.3366684457565458644 12.466875510559127349 11.643076222076549797 -8.335350514957250212 -7.9506913773310099458 3.9163929338771965583 -3.5893534727402767182 -6.095719592028315148 20.303052100107834121 0.44582548572732300096 -7.7851396210827852329 -10.290466241899499877 6.9305607011611236601 -2.3019371130899011213 -3.7808101294448208662 -4.6221140347978852958 8.8205535454307941734 8.9621350020393357738 7.3130550912782874562 -5.1505223941878481853 -3.8683557750393986474;-3.0758363816814950908 13.140006600507875945 -5.8069322916182795069 -7.2572340707362092971 -8.9513714405713820099 -8.7833655444639227028 0.48229183113799645177 -3.1600225839117404014 2.7818080319771731901 8.7786588113981309789 0.35377751459819090085 1.9490538649587969555 1.6234004598938311936 0.95753119493128391326 1.9849827863304587705 -4.071696616657932033 -4.095723342923309751 -4.3337680267892491059 -2.9532158010055664654 4.0599971399916867654 4.4477549513746090781 -0.58931844949647271825 2.8235091967886312148 -9.9155151079986882934 3.4032397494315849151;0.70702386301889597053 -5.5801900214068211881 -0.42578595868404706115 1.5650478534347405102 3.2424622740061721515 1.184595991626769429 0.90087060763525872442 -1.438842085732154219 5.5939060142216057159 9.6738444991774041881 0.95964360682624005872 3.6710914570681314473 -1.3215363412880962724 -0.29704231005226178208 -0.76305829825710880243 -4.1531611494218889646 12.288050206105335604 -2.4589411500544717804 -2.1685695556384567695 1.0312077137873485455 0.19867049535045430697 1.6672335096089954121 -4.6459691539848657627 10.411156762572998602 -1.2836106817056631701;3.7095687685018465807 -6.3706149453269933502 0.40801451468587501825 4.4034835168928578852 3.6634242212832837104 6.0221144204113947751 -0.85708133808405462251 -10.048586656225106495 -2.4613366863622876402 -0.8005935252108595801 -2.4818891485177032585 -4.982890884458903713 9.0338124374261905558 -2.0069314857514100048 -6.2939546475559877692 3.2966847324930865781 15.093896721012535878 -9.9393051146291533371 14.74340827015564237 -2.3748633695442107339 -6.8888620656106276385 -2.0440481724034049726 7.7080822888765743173 10.708200997109278418 -11.291944631718346059;11.08776205182612884 5.5976013554835750696 9.6792097064091215941 -4.6117807045918386422 2.1621657569595376103 -5.4180690180554647029 3.2098860962854369738 -2.8787034203069175042 6.0460181101169743201 -14.764788873821521165 1.2048176121105569347 -2.7413137440000991951 -3.7837081064198803126 5.471222978614027177 -4.9743568489933682741 4.9749598318250969342 -12.144971258075075937 -9.270726798207430619 6.9729091642516234373 -17.636290277366434509 -5.4465496912879318714 -3.3060803856494804798 -7.2481736004795829231 -13.670781047334466862 0.19468503133779746506;-6.1780058929629984021 3.7768552250621114652 -0.11435981517464355317 -1.5696230802593051923 5.8438242894694161222 4.8265195072594631043 1.6699422930963467859 -6.9557941375585059518 -6.8957309980484771117 8.4678568705805226102 -0.29297771747772138884 -4.4890798303227974486 10.434165339589810628 -2.1722284120387955753 3.1311207158225138336 -11.498157349540921501 4.9931865563112314277 1.439460829741682435 0.56270470388522586536 7.9429826196996549115 -0.30895071097622323064 2.0572211766226566887 17.883548008885739478 7.4369150559259313837 1.7506110166579667009;0.10801537231621678725 -1.2411509999011520744 -1.6017568592856936682 0.53868261490826629956 -1.3728786566131006008 -1.2054536216955062944 -0.75894401352545559636 -1.4277067305157853383 4.3621430220555703627 2.0355236678322028432 0.30085403192619708523 0.97206070033771541095 -2.4963715291362835735 -0.70261693601181829383 -2.6311464566860012226 2.2809879074751853167 -4.1892273775209902809 -0.43367535708038285058 0.068987762673807379032 -3.4792502247764667267 -0.31607909295358788127 0.9002657243212316418 -0.51562927020753435148 -2.9443030206080771372 -0.31563134396952446936;0.25374896587563999795 -4.3779979888590814241 0.36515580100128391949 -0.07219874897838160499 -0.5303292275535680389 -0.44404050162979175065 0.039921169399990859283 -0.17058718167690412049 -1.2569683550967527541 -2.3148413860079646298 -0.069831146482197639647 0.008125654987265478954 -0.3884954433451114908 0.10091948991026657156 -0.66238762960456198936 1.4725233859457782515 0.71443108063844407152 0.50954500160676141629 0.16650111727278515961 0.37884342879421267769 -0.035739032519736410598 -0.11738213546183391689 -0.4956836801091742406 0.47290897769311296406 -0.011079762483026887529;-13.450777675996477001 16.521869016294939314 -21.835528401137185739 9.6937187000857285568 -2.4357739980658914547 -11.303274758579455295 -3.3739210580016942842 8.3221853222258914684 -5.1366193875163119742 -4.9429164539744894213 12.008944626157136426 -10.773642739308151306 9.3826668208274170979 -7.0994158160474007957 -23.443833985681024501 -6.9905010229886110906 -6.8918685660278766747 -12.023924419839655542 -0.80532570181499052442 -2.2105404995320792061 -7.5525860395919224288 1.8525268217770984869 12.974804434844601886 13.850188598281874874 10.334968800997058835;-2.7764421962930443399 -1.9946481290549529231 -0.33068903331372451193 0.45058173822364505634 2.0249516511874898761 2.5287632982312331364 0.50162419403926516992 -1.2198435323604184255 6.7143897062756900951 8.7405245456553579686 0.38609022457005992557 5.0530352469177586272 1.3072229336782041909 0.26136206255935118259 3.3718579140436850672 -3.4237779497138620677 -0.13782521303092268306 -3.6936234984281424154 -0.76838202107571673682 4.4569002682794645054 0.21231507643233665794 0.15620536406636764681 2.2731437313937918887 -0.84400126572694145199 0.62065250674074534665;1.1027609172972014928 -1.7323826252570040385 7.5540477857413508289 -2.3461049913600193761 -1.1840742884756618736 -1.6804420951100258463 -2.9853854442425342697 5.3446953710069582399 2.8507213315101043172 -15.818541800645954609 -1.5718674371833210035 -1.1302840148363031414 -7.0494261551011723199 1.0286895879964608191 0.087318147690099268132 9.9790814554914586409 -4.1568441335793009372 -5.9345728885882689241 -8.7008804264833976561 5.1102312542338133028 2.7531150860812338976 0.62544601406702671209 2.9224831808770206365 -9.0099891586967277846 -1.5344565229986695254;-9.6533430020889205991 5.7247651888777344453 7.0859094808290716827 -2.2831405164270299757 -1.0454647829005572213 -5.8199935840563261635 -4.7482476260364956389 5.7701495089236738423 1.7202595041869275239 3.9522104949213594516 0.35963063308877352142 7.6237342544796717902 -17.793410963903586008 -1.6058644351300872533 -8.3934207167600209942 -1.0532524786420858209 3.3752064220416757578 10.373992019021109456 7.8066704188314890445 -1.6904338199557908951 3.047669184510299889 1.4667618519013509992 12.424363370044911647 -0.59711197433519658251 -1.996750338973097838;1.440346886926105574 0.10240721679062868288 -9.4176538299029122214 4.6823785262455608347 -9.4559644723814475498 -5.7725411999596136781 -0.50489847535732956807 17.481830619506379065 -2.4062217736708939597 -7.5001210323130216295 -2.8106199469106587507 2.5356799999132433321 -5.8530494840490714381 -1.0161396662993151807 -4.6980765701612092755 7.0819640348620556125 -2.7467071813339369868 3.256869841629115303 -3.5156809286829808769 1.9098681218276305493 -0.89735516066530063295 1.3720498598027754955 -0.87940881388176350697 -6.6353922448001707579 -0.5920350047948720329];

% Layer 3
b3 = 1.954672182924236612;
LW3_2 = [0.11541816608939084454 -0.23402233256769749969 0.0045874396951001905273 -0.0065235735140360658416 0.049753100391565475979 0.011575950346222487961 0.0055276928559662734039 0.013480682592506853384 0.073979175393631066426 2.7304931579729303515 0.0041695935459491097891 0.1526883061353609683 0.010772083122398272079 0.010982004074419073406 0.011562257183267204627];

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