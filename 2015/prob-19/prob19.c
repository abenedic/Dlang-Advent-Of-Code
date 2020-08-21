#include <stdio.h>


enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    Rn = 258,                      /* Rn  */
    Ar = 259,                      /* Ar  */
    Y = 260,                       /* Y  */
    C = 261,                       /* C  */
    Th = 262,                      /* Th  */
    F = 263,                       /* F  */
    Ti = 264,                      /* Ti  */
    Al = 265,                      /* Al  */
    B = 266,                       /* B  */
    Ca = 267,                      /* Ca  */
    P = 268,                       /* P  */
    Si = 269,                      /* Si  */
    Mg = 270,                      /* Mg  */
    H = 271,                       /* H  */
    O = 272,                       /* O  */
    N = 273,                       /* N  */
    EOI = 274                      /* EOI  */
  };

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


int main(){
int cur =0;
int count_Rn=0;
int count_Ar=0;
int count_Y=0;
int count =0;
while(cur != EOI){
 cur = yylex();
 count++;
 if(cur == Rn){
	count_Rn++;
 }else if(cur == Ar){
	count_Ar++;
 }else if(cur == Y){
	count_Y++;
 }
}
printf("Total: %i Rn: %i Ar: %i Y: %i\n",count, count_Rn, count_Ar, count_Y);
//196 too high.

return 0;
}
