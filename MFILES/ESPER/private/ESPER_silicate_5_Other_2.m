function [Y,Xf,Af] = ESPER_silicate_5_Other_2(X,~,~)
%ESPER_SILICATE_5_OTHER_2 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Feb-2021 18:30:39.
% 
% [Y] = ESPER_silicate_5_Other_2(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.999999984769129;-0.999998793562952;-77.961;0;29.715;-2.18999082656054;-0.04979;-138.904784718693];
x1_step1.gain = [1.00003298043486;1.00000060321889;0.0138606862425759;0.000266418009857466;0.193068829037552;0.0582073296585987;0.568038194888224;0.0042772329208737];
x1_step1.ymin = -1;

% Layer 1
b1 = [0.079552480360249686053;-5.801744303541387815;6.5807543830442529753;0.12367704129290879589;-1.2712318612765984849;1.7182051465150323111;-0.47156498425528275975;-0.43325474694212612325;-0.50309182176702482714;-0.098702060894928417278;-0.481665368203889388;0.53601471325963589987;0.62342427828387514399;-0.11770786855956792694;-2.3027859029597985696;1.3732619616631185355;-1.3712139757573957866;1.1295761506283710229;3.6746042399214884355;-5.6997151391422766764];
IW1_1 = [-0.094293074318765102149 0.018082311951683787549 -0.8955951441345697539 -0.64456728866970158798 0.67506708568772855195 -0.055807271239915155758 -0.53674602741547905449 -0.50462042165388443227;-0.045639919396395188522 -0.040309691917643247772 -0.062321805239057039005 0.26589982035798731541 6.1402605830444745294 -6.2280585670749264438 -0.69787141689668463762 1.9104446072070937479;-0.38144745340892310947 -0.1108698147489037833 2.7904654661604304522 2.9347321919106046373 2.0221493352071826521 0.11895766066981837417 -0.18725040368321640982 1.2271868907162084561;-0.41150679206123208509 0.2550282685401892846 -0.66569282765448156702 -0.080023715648647297805 -0.16742590926445841126 0.66561226830302733237 -0.085709771155830685729 0.69835970621832832439;0.24342159424120685118 -0.77794634120160144342 0.06912194113613419344 0.40426707096458885937 -0.72510415208739398274 -0.62196260809042458462 0.34775610694569764059 -0.1590880248233147165;-0.22067583719176689372 0.048758611324567990852 -0.1527783707372601385 0.4055676611657811903 -2.1054058537656321626 3.0842549949225070982 1.0853536236388654501 -0.5872020619223765614;1.0566342990750414721 0.61767815945796111787 -1.7482951400816397758 0.42813469629510481074 0.26352783002184593242 0.86382854771463646326 -0.70959115755861423835 2.6069130536030473699;0.45808403857587209895 -0.06021786766485289627 -0.64178820909788925064 -1.1537907841774812656 -0.19473143312682447692 -0.52182854884692886355 0.3005242839013748668 -1.14676675523923155;0.1070733868958804319 -0.17558018830680649502 0.11992444490345320618 0.40129835863877050262 0.35251776961493047624 -0.11748577275171748213 0.34367318664553608842 -0.12618869091531279003;-0.29556416282888070546 0.25190778319823869946 0.31171958273261729522 -0.13363559265831462253 -0.55523582980485797211 -0.076032681034357479932 -0.31816885977772224603 0.78333189352010668127;0.14262980242105821604 0.082604234473991108856 0.24657912103325146935 0.42199434874890634495 -0.28724754076253455892 -1.0641230855203087646 -0.36455398307092340415 -1.1081400327501473857;-0.40264719116512270869 -0.23402794180913555344 -0.68406411068993044911 -0.049617568358282938823 1.8780466617327093992 -1.3106871565219120335 0.19218197155027824663 -0.53116354213249628025;0.025906217623195951921 -0.20701422707966557479 -0.28176116542889234617 0.39815877327470283742 0.43488344823393421112 0.86717078409554226859 0.4994194156278908836 -0.020899317807590335472;0.62806343783679452475 0.032874747936160957085 0.45623654843269628723 0.093147302718062180427 -0.47300873664864190316 0.79589954676500851427 -0.0377018137283356633 0.11628729359359776807;-1.6096806917712827012 -1.2019872567373832695 0.87945031030031062258 -0.79483743728130362705 1.5631641836442731197 -2.0164815483467406487 -0.13751981624605791321 1.3408750339667971918;3.081879908997839479 2.128373625849253159 0.55234688006971033314 0.10744966961380869597 2.9451961228379071045 -0.61246226890754684735 -2.0729272892696193331 1.3149169905219528776;0.19719233122584572948 0.64050795372223845447 -2.2655724341612857309 -0.24209714184748071242 0.50826344083389585204 -2.1893020713716930814 -0.74103041556464877004 0.22760537375158307327;-0.1162031051293695022 -0.019817780354539522858 0.21723303776533051113 0.54957170792906595569 -2.9492662749709781522 1.9062155293321942917 0.87643718156401695385 -1.858620276977199115;0.31664750042693123877 0.16513153280854014904 -0.6204491553392977865 1.7499323159343806999 1.2386968686047665766 1.8568155317205159438 0.73894483791384846239 0.031195760454321055932;-1.8564293014935069337 -0.19054129894696139602 0.18122971304992804842 0.24098271558235220824 0.96128417442333213838 -3.0317437431739522324 -1.6781036958589807817 1.4864356009454169349];

% Layer 2
b2 = [-0.7190263987525304934;1.9534729473989187465;-4.0772831293845301914;2.6218295869194196968;-14.028688772680887098;-1.0399372399076447504;7.2497261254097447036;-3.6366247184341178311;3.8413521884822912078;-3.4842493914240439956;6.4178268813289269801;-2.6090136750976475888;-6.3921299318585731442;-7.0763302760577113659;0.82666515102854332131;16.946717360369905947;-9.0631352981044361883;-7.5849907944735006637;-4.8194281374744596391;0.25942358295165546256];
LW2_1 = [0.26737450562037723412 1.9337508132145408979 2.0171047405520905471 -0.31998753700241339137 1.4754275165646384416 1.2238402735809115196 0.10888013788568481899 0.51797115750875799556 -4.5931240987154193789 0.60652905224838626896 1.2488182180388629483 1.1108676883705301819 -0.40620555981070854967 0.7832833588884958731 0.17855945287494176532 0.10486072203166757477 -0.71796875456187225772 0.07337357963801408034 -0.073481930027297262531 0.72093306091764008947;-2.0397285047091218146 -10.022952931149823996 -3.7787704381656808117 1.2151435253942253212 4.0209111141561928449 -1.1769933780309576044 0.63916323789230089503 -1.9109334028210600565 -7.8579270436134649458 1.8436308007542203669 1.398822998660499195 1.0022076651374862699 3.3505046777015530246 0.85359602551835589423 0.25719854512851392236 -0.30947152224465701575 0.12031590434912414755 -1.5021946576511440163 -3.2595809931956467587 3.6860833033780924239;-0.15325207483358616045 -1.6915250113769229046 1.4465059477446349234 -3.4736271604527555468 -2.42704197279311229 -4.9774742088417651686 2.1401282346893601982 1.1784668055793616759 4.7169705984343375249 -17.178038039073388887 1.0288716746585655493 -5.00293555578642124 -4.4069426940676761362 -11.907996302585221571 4.1940560766381684843 9.0394896022063750962 2.513288877707914093 -8.738365711842384087 -6.5631490605399882554 -0.50131214112407795902;-4.6343724989754324639 6.8372549537142477405 9.3576145655470632789 3.8769472337580888066 -2.6687394982142476074 -7.0361008777811147041 11.513700036813174776 -2.6680688202417877086 -5.7370739817055422805 5.2140528538420989335 3.876438341378249941 -10.359073162642484789 9.0129481406634095464 -12.435896552106633806 1.3413560314751813429 1.5424222059746612867 3.4155488982133133113 10.7131762442466556 0.12853376977114780444 -0.15075392805374332461;-6.3725798130743012138 2.8437442745438095137 11.510947453050052403 8.1080086877662651546 6.5069832929732243088 7.0176524962589645895 -2.0637147623782849948 -0.62084490025083505227 0.30496877125885940574 0.09819395150915675996 3.0082771703087414217 11.390382326760773779 -1.5958730628773571958 6.8636400594209234782 -0.044412709064067204534 1.5717914826900936109 0.95289512911628238001 -0.41411576436825403569 -3.5844873019937075753 -9.3991306223540895814;1.5911188820442037084 11.099486664871974995 -5.8935161554436845677 -5.0958046137523762553 2.7249657165047600493 -9.2310367256893854915 5.2956540138074563728 -9.0687161883795841533 -6.1621944355434123963 0.1000893640730247669 -12.081390234559055585 -2.4127089368807941305 -13.281636286907007261 0.30208657817087603004 -4.0591883013330232188 -3.1658273336698061762 -9.092704036745844931 7.2002402263652633962 -5.5993610848376373923 -12.567867279909759048;-0.33122274796244816075 -1.8102884465300992378 -2.4393825343212478529 2.070763763367475363 0.82369853917515356567 -0.94007029526593421931 -0.53940581878112514591 -0.59459923772390077534 -1.6970540580940656206 -1.5549850352174761081 0.73571800783461038797 1.5428043004376332803 -0.17273963379999973666 2.5561336042523010725 -0.29416094918166396655 -0.14599240124008835973 -0.51040138247593580534 0.025309621401740981655 -0.72272876273987496365 4.6196440220320544867;-1.8952427956650907959 5.281575621962804945 2.8547446069724582429 0.57449545308456229087 3.0242741730701312441 -1.3132806343217127143 0.376858352731964108 -3.9447977019631150775 -5.8765395573534133788 -0.93009850176175568048 -0.10599199142157125775 1.822775948561998316 -2.4393108723489844714 2.2890983571760723514 -1.0597265295872142499 -1.2993700398833492038 0.41964771346306095623 -0.10532828077500694386 -4.3837738409765769632 -9.9916320850711723978;2.5516444405486176095 -3.0348504009318042485 1.2169594504028380388 -1.3307698855272431793 4.7362040105712708282 -2.4539871393746226502 3.6111826697718840684 -2.8725612190191083251 -5.1160210485555737137 3.9954362645210808047 -0.12490763211011590705 1.2552393878124050719 1.5668130561840578618 2.1162918537930495155 1.9856641913580737047 0.40590789365013946188 1.1906161909191732562 -0.76336635791622531322 0.71617816014403068436 7.9019015434715740298;0.14429454173746103507 -1.4337520158949144111 -1.5126944221427256476 3.1808856842548145494 0.90503449330542284912 2.8640373205697620129 -0.025631358335240373575 -1.8421576405746198368 -0.7684114102426797821 -8.7864089342762472512 1.3287521201567400464 -2.1726968431421513905 -4.5433039206674834531 -1.1161078815144924725 -0.031167498365111286768 -0.067754185360216309664 0.62940481389415292579 -1.9942177107209237974 -5.2335359753523373882 -11.353889882550721069;2.6847238200099026173 5.6853352801896264168 -4.5910141671379127715 1.1519862764824400081 -4.0210757818255569163 1.7001311517092811965 -0.78427403590861766158 1.4190326247743152432 10.366756459320319195 -5.0964206178612680986 -2.0527256560550246611 -4.2572818179937641503 -4.8202039934589828718 -3.3549135240995746621 -0.43180423584015542593 -0.21579777572262678897 -2.0955063558293169912 -1.329577182675431235 -0.30117323082019431535 -5.3456998747564519192;-0.19014085550144058101 2.6882245545905578687 2.848968833281368962 4.3154202264607945949 0.79946512853340667704 -0.0010402634352997207866 -1.0515590991877592497 1.6540683960068924829 1.627284127969871097 -3.4725564046318107003 1.0270611801541402741 -0.95755060906916644736 -1.5319385015881177292 1.1590731242380027943 0.028672609993100232201 -0.48320749129522050369 -1.2908935447258644835 0.72339138705916461447 -0.18424636387246415281 -6.8946829551542760939;-10.094372284628301273 5.4966070456746969342 1.2994409248112372968 -8.3497911656490995114 2.145160035406266541 18.027438838833244716 0.75764345439930591564 12.08648517211805995 -2.1334465088837797353 7.4072904220854836055 -0.66466801549373155655 5.4778161435292833659 -12.78118265543488441 0.27441159771438206061 10.221413265155838701 1.9176366231779944371 3.7684778160276883874 -0.76188911054710306558 7.142291219008279235 -0.89994747965725629957;0.15430887544984026039 -5.2710391772452060977 5.9774827470052418477 1.7500682952202226694 -1.825647757840571872 -0.45953218949638968693 -0.31767041583056648824 0.7941573345143113638 12.311484974608038812 -0.5027472300619351131 0.36391956495256244652 -1.2012937459002663854 -1.4790681562149736727 -2.0562346000811539959 0.26825197281231077939 0.10781886247854345628 0.35836150303118796678 1.4562052193046011173 -2.3867789209992524846 -4.7140429598810031919;-0.83184941481280982867 5.0153205794405675277 9.3820385941610737746 6.2979854077420540648 -0.68875217344463912639 -1.617808374462620602 -0.87849867046430374362 3.5513613323285793122 5.3182571176932089685 0.88464991321103914057 0.27274558736193377229 2.2340999955920071152 0.81384525371336824406 2.8812779320507049263 -0.71318920172832078741 0.87246595725678022237 -2.2923597750124127259 5.0948151786288695675 -3.5684109777127934748 -1.1657430904795438309;1.6407073324737775355 37.25084787591744373 0.80632151802662410667 -3.4032374267368661336 -8.8636176436052807048 2.9313418401115280965 -2.065393641991979834 -20.185466124451231451 17.082735456480435232 -0.20843262442028603898 6.1288730155448671866 15.306336970302385936 0.67422267366572863345 -2.0471635278758348875 -16.02656305147293736 -0.20005112176408765268 0.45373287438254572557 -2.7163721208735198687 8.0316055140023152603 -9.6795107213265492163;1.9628117688661048668 -21.059387343790433533 -0.65632564462941145322 10.81629014625710461 9.7225609515941222583 6.2993473732528997289 6.142869243844390148 -0.7163795478344943124 3.7056467884969115367 -0.52609575157847043858 4.7331395731480592204 -0.78849012772850601838 -0.94263251035468342831 -6.0075509948041112551 -1.4873281824155679676 -3.3307637110862713392 1.3106644300358858413 -7.56834339881782725 7.0567173842555410701 8.5584979749000229532;-4.7995644773045951226 5.5297640862483081747 11.649823093444375388 -0.54492109333406324456 7.2886634696809746714 5.6063569656803569075 -3.9954637189533559471 4.5862830121497655256 2.7963404236163111882 -14.150314907416715826 -1.5296178365048305192 6.7940025878880554444 -5.3130487644274806414 -2.9287749726034673081 -4.8746347231058457794 -1.7633981091821475662 -2.3444025102505059444 -6.1323369782236900605 0.27157141593252331901 -2.5078721258565361829;1.2505197896277784331 -14.996272914154044287 -6.5822313823875733263 -1.5037555629805661184 3.8226456387987455265 1.9175099728866686899 -11.712932545888964597 -5.3833603291461802343 -1.6591429776326716006 -6.7856154307899938516 2.9063699092857588901 1.0819459932048036688 12.89315828944252651 -2.7259591271916452371 4.2232842540279547094 10.330288064042074225 0.78488106883530961433 -5.9413235569128985958 1.7120269477816039139 5.6190022029306883056;-0.8084669663313117649 -0.52434319256417527555 2.0978214737653519961 0.51909324708908499701 0.22046981726052516937 -0.36563722455696862079 -0.41810926468233128306 -0.16022795611055898335 1.603330186241929578 -1.8498360929213928383 -0.73398578021786942127 1.1091637239776359625 -3.7284177851206097287 0.21936699204194703983 -0.082287900959517157329 -0.036121519531606249842 -0.34034759331289404782 -0.044385558853552095626 0.21873432391598962576 3.3208578946644218277];

% Layer 3
b3 = 0.18199389723492068183;
LW3_2 = [-0.48025167772897675578 -0.051052751525428249901 -0.0094864621609450118511 0.0082593822297157906687 0.014554962569381517043 -0.0057442452371654108279 -0.47763333986264083775 0.057055425885627814031 0.032665288112448058466 -0.068641468343743239355 0.066570083854699285686 0.1274996720073367229 0.013593545596053141153 -0.097881210006617230812 0.054568424005918117481 0.0023038567413072559911 0.0093770818680433947606 0.01089088813479785478 -0.0086608693213536692285 0.43006840830071652038];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.00819772922900357;
y1_step1.xoffset = -2.02;

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