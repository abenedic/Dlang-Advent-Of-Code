import std.string;
import std.stdio;
import std.conv;
import std.algorithm.sorting;




int get_int_with_comma(string input){
    return to!int(input[0..input.length-1]);
}


int[5][] get_vectors(string input){
    int[5][] scores;
    auto temp = input.splitLines;
    auto num = temp.length;
    scores.length = num;
    int i=0;
    foreach(s;temp){
        auto t = s.split;
        scores[][i++] = [get_int_with_comma(t[2]),get_int_with_comma(t[4]),get_int_with_comma(t[6]),get_int_with_comma(t[8]),to!int(t[10])];
        writeln(scores[][i-1]);
    }
    return scores;
}

long evaluate(int[5][] vectors, int[] weights){
    long value=0;
    for(int j=0; j<4; j++){
        auto temp =0;
        for(int i=0; i<vectors.length, i++){
            temp += weights[i]*vectors[j][i];
        }
        if(temp <=0){
            return 0;
        }
        value +=temp;
    }
    return value;
}

long optmial_score(string input){
    long best =0;
    auto scores = get_vectors(input);
    auto num = scores.length;
    int[] weights;
    weights.length = num;
    

    

    return best;
}

unittest{
    string input =`Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3`;

    assert(optmial_score(input) == 62842880);
}


void main(){
    writeln(optmial_score(input));
}

string input=`Sprinkles: capacity 5, durability -1, flavor 0, texture 0, calories 5
PeanutButter: capacity -1, durability 3, flavor 0, texture 0, calories 1
Frosting: capacity 0, durability -1, flavor 4, texture 0, calories 6
Sugar: capacity -1, durability 0, flavor 0, texture 2, calories 8`;










