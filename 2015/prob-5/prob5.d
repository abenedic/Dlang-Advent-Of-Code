 module main;
 import std.stdio;
import std.string;


bool has_3_vowels(string input){
    static __gshared vowels = "aeiou";
    int vowel_count=0;
    foreach(const char a; input){
        if(indexOf(vowels,a)!=-1){
            vowel_count++;
        }
        if(vowel_count >=3){
            return true;
        }
    }
    return false;
}

bool has_double_letter(string input){
    char old_value ='\0';
    foreach(const char a; input){
        if(a == old_value){
            return true;
        }
        old_value=a;
    }
    return false;
}

bool has_naughty_string(string input){
    string[] naughty_strings = ["ab", "cd", "pq", "xy"];
    foreach(const string n;naughty_strings){
        if(indexOf(input,n)!=-1){
            return true;
        }
    }
    return false;
}

bool is_nice(string input){
    return has_3_vowels(input) && has_double_letter(input) && !has_naughty_string(input);

}


bool has_repeated_letter_with_one_inbetween(string input){
    char old_value ='\0';
    char two_ago = '\0';
    foreach(const char a; input){
        if(a == two_ago){
            return true;
        }
        two_ago=old_value;
        old_value=a;
    }
    return false;
}

bool two_leters_repeated_twice(string input){
    for(int i=0; i<input.length-1;i++){
        string temp = input[i..i+2];
        if(indexOf(input,temp,i+2)!= -1){
            return true;
        }
    }
    return false;
}

bool is_nice_2(string input){
    return two_leters_repeated_twice(input) && has_repeated_letter_with_one_inbetween(input);
}

unittest{
    assert(is_nice_2("qjhvhtzxzqqjkmpb"));
    assert(is_nice_2("xxyxx"));
    assert(!is_nice_2("uurcxstgmygtbstg"));
    assert(!is_nice_2("ieodomkazucvgmuy"));
}

unittest{
    assert(is_nice("ugknbfddgicrmopn"));
    assert(is_nice("aaa"));
    assert(!is_nice("jchzalrnumimnmhp"));
    assert(!is_nice("haegwjzuvuyypxyu"));
    assert(!is_nice("dvszwmarrgswjxmb"));
}

void main(){
    long count =0;
    foreach(string s;input.splitLines()){
        if(is_nice(s)){
            count++;
        }
    }
    writeln(count);
    count =0;
    foreach(string s;input.splitLines()){
        if(is_nice_2(s)){
            count++;
        }
    }
    writeln(count);
}



string input = `sszojmmrrkwuftyv
isaljhemltsdzlum
fujcyucsrxgatisb
qiqqlmcgnhzparyg
oijbmduquhfactbc
jqzuvtggpdqcekgk
zwqadogmpjmmxijf
uilzxjythsqhwndh
gtssqejjknzkkpvw
wrggegukhhatygfi
vhtcgqzerxonhsye
tedlwzdjfppbmtdx
iuvrelxiapllaxbg
feybgiimfthtplui
qxmmcnirvkzfrjwd
vfarmltinsriqxpu
oanqfyqirkraesfq
xilodxfuxphuiiii
yukhnchvjkfwcbiq
bdaibcbzeuxqplop
ivegnnpbiyxqsion
ybahkbzpditgwdgt
dmebdomwabxgtctu
ibtvimgfaeonknoh
jsqraroxudetmfyw
dqdbcwtpintfcvuz
tiyphjunlxddenpj
fgqwjgntxagidhah
nwenhxmakxqkeehg
zdoheaxqpcnlhnen
tfetfqojqcdzlpbm
qpnxkuldeiituggg
xwttlbdwxohahwar
hjkwzadmtrkegzye
koksqrqcfwcaxeof
wulwmrptktliyxeq
gyufbedqhhyqgqzj
txpunzodohikzlmj
jloqfuejfkemcrvu
amnflshcheuddqtc
pdvcsduggcogbiia
yrioavgfmeafjpcz
uyhbtmbutozzqfvq
mwhgfwsgyuwcdzik
auqylgxhmullxpaa
lgelzivplaeoivzh
uyvcepielfcmswoa
qhirixgwkkccuzlp
zoonniyosmkeejfg
iayfetpixkedyana
ictqeyzyqswdskiy
ejsgqteafvmorwxe
lhaiqrlqqwfbrqdx
ydjyboqwhfpqfydc
dwhttezyanrnbybv
edgzkqeqkyojowvr
rmjfdwsqamjqehdq
ozminkgnkwqctrxz
bztjhxpjthchhfcd
vrtioawyxkivrpiq
dpbcsznkpkaaclyy
vpoypksymdwttpvz
hhdlruwclartkyap
bqkrcbrksbzcggbo
jerbbbnxlwfvlaiw
dwkasufidwjrjfbf
kkfxtjhbnmqbmfwf
vmnfziwqxmioukmj
rqxvcultipkecdtu
fhmfdibhtjzkiqsd
hdpjbuzzbyafqrpd
emszboysjuvwwvts
msyigmwcuybfiooq
druyksfnbluvnwoh
fvgstvynnfbvxhsx
bmzalvducnqtuune
lzwkzfzttsvpllei
olmplpvjamynfyfd
padcwfkhystsvyfb
wjhbvxkwtbfqdilb
hruaqjwphonnterf
bufjobjtvxtzjpmj
oiedrjvmlbtwyyuy
sgiemafwfztwsyju
nsoqqfudrtwszyqf
vonbxquiiwxnazyl
yvnmjxtptujwqudn
rrnybqhvrcgwvrkq
taktoxzgotzxntfu
quffzywzpxyaepxa
rfvjebfiddcfgmwv
iaeozntougqwnzoh
scdqyrhoqmljhoil
bfmqticltmfhxwld
brbuktbyqlyfpsdl
oidnyhjkeqenjlhd
kujsaiqojopvrygg
vebzobmdbzvjnjtk
uunoygzqjopwgmbg
piljqxgicjzgifso
ikgptwcjzywswqnw
pujqsixoisvhdvwi
trtuxbgigogfsbbk
mplstsqclhhdyaqk
gzcwflvmstogdpvo
tfjywbkmimyyqcjd
gijutvhruqcsiznq
ibxkhjvzzxgavkha
btnxeqvznkxjsgmq
tjgofgauxaelmjoq
sokshvyhlkxerjrv
ltogbivktqmtezta
uduwytzvqvfluyuf
msuckpthtgzhdxan
fqmcglidvhvpirzr
gwztkqpcwnutvfga
bsjfgsrntdhlpqbx
xloczbqybxmiopwt
orvevzyjliomkkgu
mzjbhmfjjvaziget
tlsdxuhwdmghdyjb
atoecyjhwmznaewi
pyxpyvvipbqibiox
ajbfmpqqobfsmesj
siknbzefjblnohgd
eqfhgewbblwdfkmc
opylbscrotckkrbk
lbwxbofgjkzdxkle
ceixfjstaptdomvm
hnkrqxifjmmjktie
aqykzeuzvvetoygd
fouahjimfcisxima
prkzhutbqsyrhjzx
qqwliakathnsbzne
sayhgqtlcqqidqhj
ygduolbysehdudra
zricvxhdzznuxuce
ucvzakslykpgsixd
udirhgcttmyspgsb
yuwzppjzfsjhhdzi
gtqergjiuwookwre
xvxexbjyjkxovvwf
mlpaqhnnkqxrmwmm
ezuqbrjozwuqafhb
mcarusdthcbsonoq
weeguqeheeiigrue
pngtfugozxofaqxv
copphvbjcmfspenv
jiyahihykjjkdaya
gdqnmesvptuyrfwp
vbdscfywqmfxbohh
crtrfuxyjypzubrg
seihvevtxywxhflp
fvvpmgttnapklwou
qmqaqsajmqwhetpk
zetxvrgjmblxvakr
kpvwblrizaabmnhz
mwpvvzaaicntrkcp
clqyjiegtdsswqfm
ymrcnqgcpldgfwtm
nzyqpdenetncgnwq
cmkzevgacnmdkqro
kzfdsnamjqbeirhi
kpxrvgvvxapqlued
rzskbnfobevzrtqu
vjoahbfwtydugzap
ykbbldkoijlvicbl
mfdmroiztsgjlasb
quoigfyxwtwprmdr
ekxjqafwudgwfqjm
obtvyjkiycxfcdpb
lhoihfnbuqelthof
eydwzitgxryktddt
rxsihfybacnpoyny
bsncccxlplqgygtw
rvmlaudsifnzhcqh
huxwsyjyebckcsnn
gtuqzyihwhqvjtes
zreeyomtngvztveq
nwddzjingsarhkxb
nuqxqtctpoldrlsh
wkvnrwqgjooovhpf
kwgueyiyffudtbyg
tpkzapnjxefqnmew
ludwccvkihagvxal
lfdtzhfadvabghna
njqmlsnrkcfhtvbb
cajzbqleghhnlgap
vmitdcozzvqvzatp
eelzefwqwjiywbcz
uyztcuptfqvymjpi
aorhnrpkjqqtgnfo
lfrxfdrduoeqmwwp
vszpjvbctblplinh
zexhadgpqfifcqrz
ueirfnshekpemqua
qfremlntihbwabtb
nwznunammfexltjc
zkyieokaaogjehwt
vlrxgkpclzeslqkq
xrqrwfsuacywczhs
olghlnfjdiwgdbqc
difnlxnedpqcsrdf
dgpuhiisybjpidsj
vlwmwrikmitmoxbt
sazpcmcnviynoktm
pratafauetiknhln
ilgteekhzwlsfwcn
ywvwhrwhkaubvkbl
qlaxivzwxyhvrxcf
hbtlwjdriizqvjfb
nrmsononytuwslsa
mpxqgdthpoipyhjc
mcdiwmiqeidwcglk
vfbaeavmjjemfrmo
qzcbzmisnynzibrc
shzmpgxhehhcejhb
wirtjadsqzydtyxd
qjlrnjfokkqvnpue
dxawdvjntlbxtuqc
wttfmnrievfestog
eamjfvsjhvzzaobg
pbvfcwzjgxahlrag
omvmjkqqnobvnzkn
lcwmeibxhhlxnkzv
uiaeroqfbvlazegs
twniyldyuonfyzqw
wgjkmsbwgfotdabi
hnomamxoxvrzvtew
ycrcfavikkrxxfgw
isieyodknagzhaxy
mgzdqwikzullzyco
mumezgtxjrrejtrs
nwmwjcgrqiwgfqel
wjgxmebfmyjnxyyp
durpspyljdykvzxf
zuslbrpooyetgafh
kuzrhcjwbdouhyme
wyxuvbciodscbvfm
kbnpvuqwmxwfqtqe
zddzercqogdpxmft
sigrdchxtgavzzjh
lznjolnorbuddgcs
ycnqabxlcajagwbt
bnaudeaexahdgxsj
rlnykxvoctfwanms
jngyetkoplrstfzt
tdpxknwacksotdub
yutqgssfoptvizgr
lzmqnxeqjfnsxmsa
iqpgfsfmukovsdgu
qywreehbidowtjyz
iozamtgusdctvnkw
ielmujhtmynlwcfd
hzxnhtbnmmejlkyf
ftbslbzmiqkzebtd
bcwdqgiiizmohack
dqhfkzeddjzbdlxu
mxopokqffisxosci
vciatxhtuechbylk
khtkhcvelidjdena
blatarwzfqcapkdt
elamngegnczctcck
xeicefdbwrxhuxuf
sawvdhjoeahlgcdr
kmdcimzsfkdfpnir
axjayzqlosrduajb
mfhzreuzzumvoggr
iqlbkbhrkptquldb
xcvztvlshiefuhgb
pkvwyqmyoazocrio
ajsxkdnerbmhyxaj
tudibgsbnpnizvsi
cxuiydkgdccrqvkh
cyztpjesdzmbcpot
nnazphxpanegwitx
uphymczbmjalmsct
yyxiwnlrogyzwqmg
gmqwnahjvvdyhnfa
utolskxpuoheugyl
mseszdhyzoyavepd
ycqknvbuvcjfgmlc
sknrxhxbfpvpeorn
zqxqjetooqcodwml
sesylkpvbndrdhsy
fryuxvjnsvnjrxlw
mfxusewqurscujnu
mbitdjjtgzchvkfv
ozwlyxtaalxofovd
wdqcduaykxbunpie
rlnhykxiraileysk
wgoqfrygttlamobg
kflxzgxvcblkpsbz
tmkisflhativzhde
owsdrfgkaamogjzd
gaupjkvkzavhfnes
wknkurddcknbdleg
lltviwincmbtduap
qwzvspgbcksyzzmb
ydzzkumecryfjgnk
jzvmwgjutxoysaam
icrwpyhxllbardkr
jdopyntshmvltrve
afgkigxcuvmdbqou
mfzzudntmvuyhjzt
duxhgtwafcgrpihc
tsnhrkvponudumeb
sqtvnbeiigdzbjgv
eczmkqwvnsrracuo
mhehsgqwiczaiaxv
kaudmfvifovrimpd
lupikgivechdbwfr
mwaaysrndiutuiqx
aacuiiwgaannunmm
tjqjbftaqitukwzp
lrcqyskykbjpaekn
lirrvofbcqpjzxmr
jurorvzpplyelfml
qonbllojmloykjqe
sllkzqujfnbauuqp
auexjwsvphvikali
usuelbssqmbrkxyc
wyuokkfjexikptvv
wmfedauwjgbrgytl
sfwvtlzzebxzmuvw
rdhqxuechjsjcvaf
kpavhqkukugocsxu
ovnjtumxowbxduts
zgerpjufauptxgat
pevvnzjfwhjxdoxq
pmmfwxajgfziszcs
difmeqvaghuitjhs
icpwjbzcmlcterwm
ngqpvhajttxuegyh
mosjlqswdngwqsmi
frlvgpxrjolgodlu
eazwgrpcxjgoszeg
bbtsthgkjrpkiiyk
tjonoglufuvsvabe
xhkbcrofytmbzrtk
kqftfzdmpbxjynps
kmeqpocbnikdtfyv
qjjymgqxhnjwxxhp
dmgicrhgbngdtmjt
zdxrhdhbdutlawnc
afvoekuhdboxghvx
hiipezngkqcnihty
bbmqgheidenweeov
suprgwxgxwfsgjnx
adeagikyamgqphrj
zzifqinoeqaorjxg
adhgppljizpaxzld
lvxyieypvvuqjiyc
nljoakatwwwoovzn
fcrkfxclcacshhmx
ownnxqtdhqbgthch
lmfylrcdmdkgpwnj
hlwjfbvlswbzpbjr
mkofhdtljdetcyvp
synyxhifbetzarpo
agnggugngadrcxoc
uhttadmdmhidpyjw
ohfwjfhunalbubpr
pzkkkkwrlvxiuysn
kmidbxmyzkjrwjhu
egtitdydwjxmajnw
civoeoiuwtwgbqqs
dfptsguzfinqoslk
tdfvkreormspprer
zvnvbrmthatzztwi
ffkyddccrrfikjde
hrrmraevdnztiwff
qaeygykcpbtjwjbr
purwhitkmrtybslh
qzziznlswjaussel
dfcxkvdpqccdqqxj
tuotforulrrytgyn
gmtgfofgucjywkev
wkyoxudvdkbgpwhd
qbvktvfvipftztnn
otckgmojziezmojb
inxhvzbtgkjxflay
qvxapbiatuudseno
krpvqosbesnjntut
oqeukkgjsfuqkjbb
prcjnyymnqwqksiz
vuortvjxgckresko
orqlyobvkuwgathr
qnpyxlnazyfuijox
zwlblfkoklqmqzkw
hmwurwtpwnrcsanl
jzvxohuakopuzgpf
sfcpnxrviphhvxmx
qtwdeadudtqhbely
dbmkmloasqphnlgj
olylnjtkxgrubmtk
nxsdbqjuvwrrdbpq
wbabpirnpcsmpipw
hjnkyiuxpqrlvims
enzpntcjnxdpuqch
vvvqhlstzcizyimn
triozhqndbttglhv
fukvgteitwaagpzx
uhcvukfbmrvskpen
tizcyupztftzxdmt
vtkpnbpdzsaluczz
wodfoyhoekidxttm
otqocljrmwfqbxzu
linfbsnfvixlwykn
vxsluutrwskslnye
zbshygtwugixjvsi
zdcqwxvwytmzhvoo
wrseozkkcyctrmei
fblgtvogvkpqzxiy
opueqnuyngegbtnf
qxbovietpacqqxok
zacrdrrkohfygddn
gbnnvjqmkdupwzpq
qgrgmsxeotozvcak
hnppukzvzfmlokid
dzbheurndscrrtcl
wbgdkadtszebbrcw
fdmzppzphhpzyuiz
bukomunhrjrypohj
ohodhelegxootqbj
rsplgzarlrknqjyh
punjjwpsxnhpzgvu
djdfahypfjvpvibm
mlgrqsmhaozatsvy
xwktrgyuhqiquxgn
wvfaoolwtkbrisvf
plttjdmguxjwmeqr
zlvvbwvlhauyjykw
cigwkbyjhmepikej
masmylenrusgtyxs
hviqzufwyetyznze
nzqfuhrooswxxhus
pdbdetaqcrqzzwxf
oehmvziiqwkzhzib
icgpyrukiokmytoy
ooixfvwtiafnwkce
rvnmgqggpjopkihs
wywualssrmaqigqk
pdbvflnwfswsrirl
jeaezptokkccpbuj
mbdwjntysntsaaby
ldlgcawkzcwuxzpz
lwktbgrzswbsweht
ecspepmzarzmgpjm
qmfyvulkmkxjncai
izftypvwngiukrns
zgmnyjfeqffbooww
nyrkhggnprhedows
yykzzrjmlevgffah
mavaemfxhlfejfki
cmegmfjbkvpncqwf
zxidlodrezztcrij
fseasudpgvgnysjv
fupcimjupywzpqzp
iqhgokavirrcvyys
wjmkcareucnmfhui
nftflsqnkgjaexhq
mgklahzlcbapntgw
kfbmeavfxtppnrxn
nuhyvhknlufdynvn
nviogjxbluwrcoec
tyozixxxaqiuvoys
kgwlvmvgtsvxojpr
moeektyhyonfdhrb
kahvevmmfsmiiqex
xcywnqzcdqtvhiwd
fnievhiyltbvtvem
jlmndqufirwgtdxd
muypbfttoeelsnbs
rypxzbnujitfwkou
ubmmjbznskildeoj
ofnmizdeicrmkjxp
rekvectjbmdnfcib
yohrojuvdexbctdh
gwfnfdeibynzjmhz
jfznhfcqdwlpjull
scrinzycfhwkmmso
mskutzossrwoqqsi
rygoebkzgyzushhr
jpjqiycflqkexemx
arbufysjqmgaapnl
dbjerflevtgweeoj
snybnnjlmwjvhois
fszuzplntraprmbj
mkvaatolvuggikvg
zpuzuqygoxesnuyc
wnpxvmxvllxalulm
eivuuafkvudeouwy
rvzckdyixetfuehr
qgmnicdoqhveahyx
miawwngyymshjmpj
pvckyoncpqeqkbmx
llninfenrfjqxurv
kzbjnlgsqjfuzqtp
rveqcmxomvpjcwte
bzotkawzbopkosnx
ktqvpiribpypaymu
wvlzkivbukhnvram
uohntlcoguvjqqdo
ajlsiksjrcnzepkt
xsqatbldqcykwusd
ihbivgzrwpmowkop
vfayesfojmibkjpb
uaqbnijtrhvqxjtb
hhovshsfmvkvymba
jerwmyxrfeyvxcgg
hncafjwrlvdcupma
qyvigggxfylbbrzt
hiiixcyohmvnkpgk
mmitpwopgxuftdfu
iaxderqpceboixoa
zodfmjhuzhnsqfcb
sthtcbadrclrazsi
bkkkkcwegvypbrio
wmpcofuvzemunlhj
gqwebiifvqoeynro
juupusqdsvxcpsgv
rbhdfhthxelolyse
kjimpwnjfrqlqhhz
rcuigrjzarzpjgfq
htxcejfyzhydinks
sxucpdxhvqjxxjwf
omsznfcimbcwaxal
gufmtdlhgrsvcosb
bssshaqujtmluerz
uukotwjkstgwijtr
kbqkneobbrdogrxk
ljqopjcjmelgrakz
rwtfnvnzryujwkfb
dedjjbrndqnilbeh
nzinsxnpptzagwlb
lwqanydfirhnhkxy
hrjuzfumbvfccxno
okismsadkbseumnp
sfkmiaiwlktxqvwa
hauwpjjwowbunbjj
nowkofejwvutcnui
bqzzppwoslaeixro
urpfgufwbtzenkpj
xgeszvuqwxeykhef
yxoldvkyuikwqyeq
onbbhxrnmohzskgg
qcikuxakrqeugpoa
lnudcqbtyzhlpers
nxduvwfrgzaailgl
xniuwvxufzxjjrwz
ljwithcqmgvntjdj
awkftfagrfzywkhs
uedtpzxyubeveuek
bhcqdwidbjkqqhzl
iyneqjdmlhowwzxx
kvshzltcrrururty
zgfpiwajegwezupo
tkrvyanujjwmyyri
ercsefuihcmoaiep
ienjrxpmetinvbos
jnwfutjbgenlipzq
bgohjmrptfuamzbz
rtsyamajrhxbcncw
tfjdssnmztvbnscs
bgaychdlmchngqlp
kfjljiobynhwfkjo
owtdxzcpqleftbvn
ltjtimxwstvzwzjj
wbrvjjjajuombokf
zblpbpuaqbkvsxye
gwgdtbpnlhyqspdi
abipqjihjqfofmkx
nlqymnuvjpvvgova
avngotmhodpoufzn
qmdyivtzitnrjuae
xfwjmqtqdljuerxi
csuellnlcyqaaamq
slqyrcurcyuoxquo
dcjmxyzbzpohzprl
uqfnmjwniyqgsowb
rbmxpqoblyxdocqc
ebjclrdbqjhladem
ainnfhxnsgwqnmyo
eyytjjwhvodtzquf
iabjgmbbhilrcyyp
pqfnehkivuelyccc
xgjbyhfgmtseiimt
jwxyqhdbjiqqqeyy
gxsbrncqkmvaryln
vhjisxjkinaejytk
seexagcdmaedpcvh
lvudfgrcpjxzdpvd
fxtegyrqjzhmqean
dnoiseraqcoossmc
nwrhmwwbykvwmgep
udmzskejvizmtlce
hbzvqhvudfdlegaa
cghmlfqejbxewskv
bntcmjqfwomtbwsb
qezhowyopjdyhzng
todzsocdkgfxanbz
zgjkssrjlwxuhwbk
eibzljqsieriyrzr
wamxvzqyycrxotjp
epzvfkispwqynadu
dwlpfhtrafrxlyie
qhgzujhgdruowoug
girstvkahaemmxvh
baitcrqmxhazyhbl
xyanqcchbhkajdmc
gfvjmmcgfhvgnfdq
tdfdbslwncbnkzyz
jojuselkpmnnbcbb
hatdslkgxtqpmavj
dvelfeddvgjcyxkj
gnsofhkfepgwltse
mdngnobasfpewlno
qssnbcyjgmkyuoga
glvcmmjytmprqwvn
gwrixumjbcdffsdl
lozravlzvfqtsuiq
sicaflbqdxbmdlch
inwfjkyyqbwpmqlq
cuvszfotxywuzhzi
igfxyoaacoarlvay
ucjfhgdmnjvgvuni
rvvkzjsytqgiposh
jduinhjjntrmqroz
yparkxbgsfnueyll
lyeqqeisxzfsqzuj
woncskbibjnumydm
lltucklragtjmxtl
ubiyvmyhlesfxotj
uecjseeicldqrqww
xxlxkbcthufnjbnm
lhqijovvhlffpxga
fzdgqpzijitlogjz
efzzjqvwphomxdpd
jvgzvuyzobeazssc
hejfycgxywfjgbfw
yhjjmvkqfbnbliks
sffvfyywtlntsdsz
dwmxqudvxqdenrur
asnukgppdemxrzaz
nwqfnumblwvdpphx
kqsmkkspqvxzuket
cpnraovljzqiquaz
qrzgrdlyyzbyykhg
opoahcbiydyhsmqe
hjknnfdauidjeydr
hczdjjlygoezadow
rtflowzqycimllfv
sfsrgrerzlnychhq
bpahuvlblcolpjmj
albgnjkgmcrlaicl
pijyqdhfxpaxzdex
eeymiddvcwkpbpux
rqwkqoabywgggnln
vckbollyhgbgmgwh
ylzlgvnuvpynybkm
hpmbxtpfosbsjixt
ocebeihnhvkhjfqz
tvctyxoujdgwayze
efvhwxtuhapqxjen
rusksgefyidldmpo
nkmtjvddfmhirmzz
whvtsuadwofzmvrt
iiwjqvsdxudhdzzk
gucirgxaxgcassyo
rmhfasfzexeykwmr
hynlxcvsbgosjbis
huregszrcaocueen
pifezpoolrnbdqtv
unatnixzvdbqeyox
xtawlpduxgacchfe
bdvdbflqfphndduf
xtdsnjnmzccfptyt
nkhsdkhqtzqbphhg
aqcubmfkczlaxiyb
moziflxpsfubucmv
srdgnnjtfehiimqx
pwfalehdfyykrohf
sysxssmvewyfjrve
brsemdzosgqvvlxe
bimbjoshuvflkiat
hkgjasmljkpkwwku
sbnmwjvodygobpqc
bbbqycejueruihhd
corawswvlvneipyc
gcyhknmwsczcxedh
kppakbffdhntmcqp
ynulzwkfaemkcefp
pyroowjekeurlbii
iwksighrswdcnmxf
glokrdmugreygnsg
xkmvvumnfzckryop
aesviofpufygschi
csloawlirnegsssq
fkqdqqmlzuxbkzbc
uzlhzcfenxdfjdzp
poaaidrktteusvyf
zrlyfzmjzfvivcfr
qwjulskbniitgqtx
gjeszjksbfsuejki
vczdejdbfixbduaq
knjdrjthitjxluth
jweydeginrnicirl
bottrfgccqhyycsl
eiquffofoadmbuhk
lbqfutmzoksscswf
xfmdvnvfcnzjprba
uvugkjbkhlaoxmyx
wadlgtpczgvcaqqv
inzrszbtossflsxk
dbzbtashaartczrj
qbjiqpccefcfkvod
hluujmokjywotvzy
thwlliksfztcmwzh
arahybspdaqdexrq
nuojrmsgyipdvwyx
hnajdwjwmzattvst
sulcgaxezkprjbgu
rjowuugwdpkjtypw
oeugzwuhnrgiaqga
wvxnyymwftfoswij
pqxklzkjpcqscvde
tuymjzknntekglqj
odteewktugcwlhln
exsptotlfecmgehc
eeswfcijtvzgrqel
vjhrkiwmunuiwqau
zhlixepkeijoemne
pavfsmwesuvebzdd
jzovbklnngfdmyws
nbajyohtzfeoiixz
ciozmhrsjzrwxvhz
gwucrxieqbaqfjuv
uayrxrltnohexawc
flmrbhwsfbcquffm
gjyabmngkitawlxc
rwwtggvaygfbovhg
xquiegaisynictjq
oudzwuhexrwwdbyy
lengxmguyrwhrebb
uklxpglldbgqsjls
dbmvlfeyguydfsxq
zspdwdqcrmtmdtsc
mqfnzwbfqlauvrgc
amcrkzptgacywvhv
ndxmskrwrqysrndf
mwjyhsufeqhwisju
srlrukoaenyevykt
tnpjtpwawrxbikct
geczalxmgxejulcv
tvkcbqdhmuwcxqci
tiovluvwezwwgaox
zrjhtbgajkjqzmfo
vcrywduwsklepirs
lofequdigsszuioy
wxsdzomkjqymlzat
iabaczqtrfbmypuy
ibdlmudbajikcncr
rqcvkzsbwmavdwnv
ypxoyjelhllhbeog
fdnszbkezyjbttbg
uxnhrldastpdjkdz
xfrjbehtxnlyzcka
omjyfhbibqwgcpbv
eguucnoxaoprszmp
xfpypldgcmcllyzz
aypnmgqjxjqceelv
mgzharymejlafvgf
tzowgwsubbaigdok
ilsehjqpcjwmylxc
pfmouwntfhfnmrwk
csgokybgdqwnduwp
eaxwvxvvwbrovypz
nmluqvobbbmdiwwb
lnkminvfjjzqbmio
mjiiqzycqdhfietz
towlrzriicyraevq
obiloewdvbrsfwjo
lmeooaajlthsfltw
ichygipzpykkesrw
gfysloxmqdsfskvt
saqzntehjldvwtsx
pqddoemaufpfcaew
mjrxvbvwcreaybwe
ngfbrwfqnxqosoai
nesyewxreiqvhald
kqhqdlquywotcyfy
liliptyoqujensfi
nsahsaxvaepzneqq
zaickulfjajhctye
gxjzahtgbgbabtht
koxbuopaqhlsyhrp
jhzejdjidqqtjnwe
dekrkdvprfqpcqki
linwlombdqtdeyop
dvckqqbnigdcmwmx
yaxygbjpzkvnnebv
rlzkdkgaagmcpxah
cfzuyxivtknirqvt
obivkajhsjnrxxhn
lmjhayymgpseuynn
bbjyewkwadaipyju
lmzyhwomfypoftuu
gtzhqlgltvatxack
jfflcfaqqkrrltgq
txoummmnzfrlrmcg
ohemsbfuqqpucups
imsfvowcbieotlok
tcnsnccdszxfcyde
qkcdtkwuaquajazz
arcfnhmdjezdbqku
srnocgyqrlcvlhkb
mppbzvfmcdirbyfw
xiuarktilpldwgwd
ypufwmhrvzqmexpc
itpdnsfkwgrdujmj
cmpxnodtsswkyxkr
wayyxtjklfrmvbfp
mfaxphcnjczhbbwy
sjxhgwdnqcofbdra
pnxmujuylqccjvjm
ivamtjbvairwjqwl
deijtmzgpfxrclss
bzkqcaqagsynlaer
tycefobvxcvwaulz
ctbhnywezxkdsswf
urrxxebxrthtjvib
fpfelcigwqwdjucv
ngfcyyqpqulwcphb
rltkzsiipkpzlgpw
qfdsymzwhqqdkykc
balrhhxipoqzmihj
rnwalxgigswxomga
ghqnxeogckshphgr
lyyaentdizaumnla
exriodwfzosbeoib
speswfggibijfejk
yxmxgfhvmshqszrq
hcqhngvahzgawjga
qmhlsrfpesmeksur
eviafjejygakodla
kvcfeiqhynqadbzv
fusvyhowslfzqttg
girqmvwmcvntrwau
yuavizroykfkdekz
jmcwohvmzvowrhxf
kzimlcpavapynfue
wjudcdtrewfabppq
yqpteuxqgbmqfgxh
xdgiszbuhdognniu
jsguxfwhpftlcjoh
whakkvspssgjzxre
ggvnvjurlyhhijgm
krvbhjybnpemeptr
pqedgfojyjybfbzr
jzhcrsgmnkwwtpdo
yyscxoxwofslncmp
gzjhnxytmyntzths
iteigbnqbtpvqumi
zjevfzusnjukqpfw
xippcyhkfuounxqk
mcnhrcfonfdgpkyh
pinkcyuhjkexbmzj
lotxrswlxbxlxufs
fmqajrtoabpckbnu
wfkwsgmcffdgaqxg
qfrsiwnohoyfbidr
czfqbsbmiuyusaqs
ieknnjeecucghpoo
cevdgqnugupvmsge
gjkajcyjnxdrtuvr
udzhrargnujxiclq
zqqrhhmjwermjssg
ggdivtmgoqajydzz
wnpfsgtxowkjiivl
afbhqawjbotxnqpd
xjpkifkhfjeqifdn
oyfggzsstfhvticp
kercaetahymeawxy
khphblhcgmbupmzt
iggoqtqpvaebtiol
ofknifysuasshoya
qxuewroccsbogrbv
apsbnbkiopopytgu
zyahfroovfjlythh
bxhjwfgeuxlviydq
uvbhdtvaypasaswa
qamcjzrmesqgqdiz
hjnjyzrxntiycyel
wkcrwqwniczwdxgq
hibxlvkqakusswkx
mzjyuenepwdgrkty
tvywsoqslfsulses
jqwcwuuisrclircv
xanwaoebfrzhurct
ykriratovsvxxasf
qyebvtqqxbjuuwuo
telrvlwvriylnder
acksrrptgnhkeiaa
yemwfjhiqlzsvdxf
banrornfkcymmkcc
ytbhxvaeiigjpcgm
crepyazgxquposkn
xlqwdrytzwnxzwzv
xtrbfbwopxscftps
kwbytzukgseeyjla
qtfdvavvjogybxjg
ytbmvmrcxwfkgvzw
nbscbdskdeocnfzr
sqquwjbdxsxhcseg
ewqxhigqcgszfsuw
cvkyfcyfmubzwsee
dcoawetekigxgygd
ohgqnqhfimyuqhvi
otisopzzpvnhctte
bauieohjejamzien
ewnnopzkujbvhwce
aeyqlskpaehagdiv
pncudvivwnnqspxy
ytugesilgveokxcg
zoidxeelqdjesxpr
ducjccsuaygfchzj
smhgllqqqcjfubfc
nlbyyywergronmir
prdawpbjhrzsbsvj
nmgzhnjhlpcplmui
eflaogtjghdjmxxz
qolvpngucbkprrdc
ixywxcienveltgho
mwnpqtocagenkxut
iskrfbwxonkguywx
ouhtbvcaczqzmpua
srewprgddfgmdbao
dyufrltacelchlvu
czmzcbrkecixuwzz
dtbeojcztzauofuk
prrgoehpqhngfgmw
baolzvfrrevxsyke
zqadgxshwiarkzwh
vsackherluvurqqj
surbpxdulvcvgjbd
wqxytarcxzgxhvtx
vbcubqvejcfsgrac
zqnjfeapshjowzja
hekvbhtainkvbynx
knnugxoktxpvoxnh
knoaalcefpgtvlwm
qoakaunowmsuvkus
ypkvlzcduzlezqcb
ujhcagawtyepyogh
wsilcrxncnffaxjf
gbbycjuscquaycrk
aduojapeaqwivnly
ceafyxrakviagcjy
nntajnghicgnrlst
vdodpeherjmmvbje
wyyhrnegblwvdobn
xlfurpghkpbzhhif
xyppnjiljvirmqjo
kglzqahipnddanpi
omjateouxikwxowr
ocifnoopfglmndcx
emudcukfbadyijev
ooktviixetfddfmh
wtvrhloyjewdeycg
cgjncqykgutfjhvb
nkwvpswppeffmwad
hqbcmfhzkxmnrivg
mdskbvzguxvieilr
anjcvqpavhdloaqh
erksespdevjylenq
fadxwbmisazyegup
iyuiffjmcaahowhj
ygkdezmynmltodbv
fytneukxqkjattvh
woerxfadbfrvdcnz
iwsljvkyfastccoa
movylhjranlorofe
drdmicdaiwukemep
knfgtsmuhfcvvshg
ibstpbevqmdlhajn
tstwsswswrxlzrqs
estyydmzothggudf
jezogwvymvikszwa
izmqcwdyggibliet
nzpxbegurwnwrnca
kzkojelnvkwfublh
xqcssgozuxfqtiwi
tcdoigumjrgvczfv
ikcjyubjmylkwlwq
kqfivwystpqzvhan
bzukgvyoqewniivj
iduapzclhhyfladn
fbpyzxdfmkrtfaeg
yzsmlbnftftgwadz`;