import std.string;
import std.stdio;
import std.conv;
import std.algorithm.sorting;
import std.math;
import std.ascii;
import std.algorithm.iteration;
import std.algorithm.mutation;
import std.range;
import std.algorithm;
import std.regex;


string input=`To continue, please consult the code grid in the manual.
Enter the code at row 2978, column 3083.`;

int translate_to_linear(int row, int col){
	//(n,1) = 1+n(n+1)/2
	//(r,c) = (r+c-1,1)+c-1
	int n = row-1+col-1;
	return 1+n*(n+1)/2+col-1;
}

ulong advance(ulong cur){
	return (cur *252533)%33554393;
}


unittest{
	writeln(translate_to_linear(1,3));
	assert(translate_to_linear(3,5)==26);
	assert(translate_to_linear(2,4)==14);
	assert(translate_to_linear(1,3)==6);
}

int main(){
	ulong cur = 20151125;
	for(int i=1; i<translate_to_linear(2978,3083);i++){
		cur = advance(cur);
	}
	writeln(cur);

	return 0;
}


