%{
#include <stdio.h>
	int yylex(void);
	void yyerror(const char *);
	static int count =0;
	int yydebug = 1;
#define YYINITDEPTH  800000
#define YYMAXDEPTH  1600000
#define action printf("%i\n", count++);
%}

%token Rn
%token Ar
%token Y
%token C
%token Th
%token F
%token Ti
%token Al
%token B
%token Ca
%token P
%token Si
%token Mg
%token H
%token O
%token N
%token EOI

%glr-parser


%%

start: e EOI			{printf("%i\n", count);}

RnFAr: Rn F_ Ar
	;

RnFYFYFAr :Rn F_ Y F_ Y F_ Ar
		  ;

RnFYFAr: Rn F_ Y F_ Ar
             ;

RnMgAr:Rn Mg_ Ar
         ;

Al_ : Th_ F_			{action}
   | Th_ RnFAr		{action}
   | Al
   ;
B_ : B_ Ca_			{action}
  | Ti_ B_			{action}
  | Ti_ RnFAr		{action}
  | B
  ;
Ca_ : Ca_ Ca			{action}
   | P_ B_			{action}
   | P_ RnFAr		{action}
   | Si_ RnFYFAr  {action}
   | Si_ RnMgAr	{action}
   | Si_ Th_			{action}
   | Ca
   ;
F_ : Ca_ F_			{action}
  | P_ Mg_			{action}
  | Si_ Al_			{action}
  | F
  ;


H_ : C Rn Al_ Ar		{action}
  | C RnFYFYFAr 		{action}
  | C Rn F_ Y Mg_ Ar		{action}
  | C Rn Mg_ Y F_ Ar	{action}
  | H_ Ca_			{action}
  | N_ RnFYFAr	{action}
  | N_ RnMgAr		{action}
  | N_ Th_			{action}
  | O_ B_				{action}
  | O_ RnFAr		{action}
  | H
  ;
Mg_ : B_ F_			{action}
   | Ti_ Mg_			{action}
   | Mg
   ;
N_ : C RnFAr	{action}
  | H_ Si_			{action}
  | N
  ;
O_ : C RnFYFAr	{action}
  | C RnMgAr		{action}
  | H_ P_				{action}
  | N_ RnFAr	{action}
  | O_ Ti_			{action}
  | O
  ;

P_ : Ca_ P_			{action}
  | P_ Ti_			{action}
  | Si_ RnFAr		{action}
  | P
  ;
Si_ : Ca_ Si_			{action}
	| Si
    ;
Th_ : Th_ Ca_			{action}
	| Th
   ;
Ti_ : B_ P_			{action}
   | Ti_ Ti		{action}
   | Ti
   ;
e : H_ F_				{action}
  | N_ Al_			{action}
  | O_ Mg_			{action}
  ;

%%

int yylex(){
 static int cursor=0;
 static const char input[]="CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr";

 switch(input[cursor++]){
	case '\0': return EOI;
	case 'O': return O;
	case 'Y': return Y;
	case 'F': return F;
	case 'B': return B;
	case 'P': return P;
	case 'H': return H;
	case 'N': return N;
	case 'S': cursor++; return Si;
	case 'R': cursor++; return Rn;
	case 'M': cursor++; return Mg;
	case 'C': if(input[cursor] == 'a'){
		cursor++;
		return Ca;
	}else{
		return C;
	}
	case 'A': if(input[cursor] == 'r'){
		cursor++;
		return Ar;
	}else{
		cursor++;
		return Al;
	}
	case 'T':if(input[cursor] == 'h'){
		cursor++;
		return Th;
	}else{
		cursor++;
		return Ti;
	}
	default: return EOI;
 }

}

void
yyerror (char const *s)
{
  fprintf (stderr, "%s\n", s);
}

int main(){
	yyparse();
	return 0;
}












