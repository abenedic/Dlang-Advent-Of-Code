import std.string;
import std.stdio;
import std.conv;

import std.algorithm.sorting;






int[][] build_graph(string input){
    int[string] map;
    int i=0;
    foreach(string s; input.splitLines){
        auto t = s.split[0];
        if(t !in map){
            map[t] = i++;
        }
    }
    int[][] graph= new int[][](map.length+1,map.length+1);
    foreach(string s; input.splitLines){
        auto t = s.split;
        auto first = map[t[0]];
        auto second = t[10];
        auto gain_or_lose = t[2];
        auto amount = t[3];
        auto value = (gain_or_lose =="gain") ? to!int(amount) : -to!int(amount);
        second = second[0..second.length-1];
        graph[first][map[second]] = value;
    }
    for(int j=0; j<graph[0].length;j++){
        graph[j][map.length] =0;
        graph[map.length][j] =0;
    }

    return graph;
}

ushort[] get_initial_path(ushort num)
{
    ushort[] output;
    output.length = num;
    for (ushort i = 0; i < num; i++)
    {
        output[i] = i;
    }
    return output;
}


long evaluate_happiness(int[][] graph, ushort[] path){
    long h=0;
    for(int i=0; i<path.length; i++){
        h += graph[path[i]][path[(i+1)%path.length]] + graph[path[(i+1)%path.length]][path[i]];
    }
    writeln(h);
    return h;
}    

long optimal_happiness(string input){
    auto graph =build_graph(input);
    writeln(graph);
    immutable ushort num = to!ushort(graph[0].length);
    long happiness = long.min;
    auto path = get_initial_path(num);
    do
    {
        immutable auto cur = evaluate_happiness(graph, path);
        if (cur > happiness)
        {
            happiness = cur;
        }
    }
    while (nextPermutation(path));
    return happiness;
}



unittest{
    string input=`Alice would gain 54 happiness units by sitting next to Bob.
Alice would lose 79 happiness units by sitting next to Carol.
Alice would lose 2 happiness units by sitting next to David.
Bob would gain 83 happiness units by sitting next to Alice.
Bob would lose 7 happiness units by sitting next to Carol.
Bob would lose 63 happiness units by sitting next to David.
Carol would lose 62 happiness units by sitting next to Alice.
Carol would gain 60 happiness units by sitting next to Bob.
Carol would gain 55 happiness units by sitting next to David.
David would gain 46 happiness units by sitting next to Alice.
David would lose 7 happiness units by sitting next to Bob.
David would gain 41 happiness units by sitting next to Carol.
`;
long h =optimal_happiness(input);
writeln(h);
assert(h ==330 );
}

void main(){
    writeln(optimal_happiness(input));
}

string input =`Alice would gain 54 happiness units by sitting next to Bob.
Alice would lose 81 happiness units by sitting next to Carol.
Alice would lose 42 happiness units by sitting next to David.
Alice would gain 89 happiness units by sitting next to Eric.
Alice would lose 89 happiness units by sitting next to Frank.
Alice would gain 97 happiness units by sitting next to George.
Alice would lose 94 happiness units by sitting next to Mallory.
Bob would gain 3 happiness units by sitting next to Alice.
Bob would lose 70 happiness units by sitting next to Carol.
Bob would lose 31 happiness units by sitting next to David.
Bob would gain 72 happiness units by sitting next to Eric.
Bob would lose 25 happiness units by sitting next to Frank.
Bob would lose 95 happiness units by sitting next to George.
Bob would gain 11 happiness units by sitting next to Mallory.
Carol would lose 83 happiness units by sitting next to Alice.
Carol would gain 8 happiness units by sitting next to Bob.
Carol would gain 35 happiness units by sitting next to David.
Carol would gain 10 happiness units by sitting next to Eric.
Carol would gain 61 happiness units by sitting next to Frank.
Carol would gain 10 happiness units by sitting next to George.
Carol would gain 29 happiness units by sitting next to Mallory.
David would gain 67 happiness units by sitting next to Alice.
David would gain 25 happiness units by sitting next to Bob.
David would gain 48 happiness units by sitting next to Carol.
David would lose 65 happiness units by sitting next to Eric.
David would gain 8 happiness units by sitting next to Frank.
David would gain 84 happiness units by sitting next to George.
David would gain 9 happiness units by sitting next to Mallory.
Eric would lose 51 happiness units by sitting next to Alice.
Eric would lose 39 happiness units by sitting next to Bob.
Eric would gain 84 happiness units by sitting next to Carol.
Eric would lose 98 happiness units by sitting next to David.
Eric would lose 20 happiness units by sitting next to Frank.
Eric would lose 6 happiness units by sitting next to George.
Eric would gain 60 happiness units by sitting next to Mallory.
Frank would gain 51 happiness units by sitting next to Alice.
Frank would gain 79 happiness units by sitting next to Bob.
Frank would gain 88 happiness units by sitting next to Carol.
Frank would gain 33 happiness units by sitting next to David.
Frank would gain 43 happiness units by sitting next to Eric.
Frank would gain 77 happiness units by sitting next to George.
Frank would lose 3 happiness units by sitting next to Mallory.
George would lose 14 happiness units by sitting next to Alice.
George would lose 12 happiness units by sitting next to Bob.
George would lose 52 happiness units by sitting next to Carol.
George would gain 14 happiness units by sitting next to David.
George would lose 62 happiness units by sitting next to Eric.
George would lose 18 happiness units by sitting next to Frank.
George would lose 17 happiness units by sitting next to Mallory.
Mallory would lose 36 happiness units by sitting next to Alice.
Mallory would gain 76 happiness units by sitting next to Bob.
Mallory would lose 34 happiness units by sitting next to Carol.
Mallory would gain 37 happiness units by sitting next to David.
Mallory would gain 40 happiness units by sitting next to Eric.
Mallory would gain 18 happiness units by sitting next to Frank.
Mallory would gain 7 happiness units by sitting next to George.
`;