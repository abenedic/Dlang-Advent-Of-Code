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

const goal base_goal= goal(0,1);

immutable int[] input=[1,
2,
3,
7,
11,
13,
17,
19,
23,
31,
37,
41,
43,
47,
53,
59,
61,
67,
71,
73,
79,
83,
89,
97,
101,
103,
107,
109,
113];

int one_third(){
	int count=0;
	foreach(p;input){
		count+=p;
	}
	assert(count%4==0);
	return(count/4);

}

struct goal{
	int count;
	ulong QM;
};

int current_best=int.max;

goal doIt(int try1, const int[] arr,const goal cur){
	if(try1<0 || cur.count >6 || cur.count > current_best){
		return goal(int.max,int.max);
	}

	if(try1==0){
		if(cur.count<current_best){
			current_best = cur.count;
			writeln("Solution found: ", cur.count," " ,cur.QM);
		}
		//
		return cur;
	}

	goal[] temp;
int[] temp1 = arr.dup;
	for(ulong i=0; i<arr.length;i++){

		goal cur_goal= cur;
		int weight= temp1[0];
		temp1.remove(0);
		if(temp1.sum<try1){
			break;
		}
		cur_goal.count++;
		cur_goal.QM *=weight;
		auto temp2 = doIt(try1-weight,temp1,cur_goal);
		if(temp2.count != int.max){
			temp~= temp2;
		}
	}
	int min_count=int.max;
	for(ulong i=0; i< temp.length; i++){
		if(temp[i].count < min_count){
			min_count = temp[i].count;
		}
	}
	temp = remove!(a => a.count != min_count)(temp);
	goal out1;
	out1.count= min_count;
	ulong min_QM=ulong.max;
	foreach(e;temp){
		if(e.QM<min_QM){
			min_QM = e.QM;
		}
	}
	out1.QM =min_QM;

	return out1;

}





int main(){
	int s = one_third();
	auto t = input.dup;
	t.reverse;
	goal out1 = doIt(s,t,base_goal);
	writeln(out1.count,": ", out1.QM);

	return 0;
}


