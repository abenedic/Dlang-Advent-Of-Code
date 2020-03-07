import std.stdio;
import std.algorithm.sorting;
import std.array;
import std.string;
import std.conv;

ushort[][] get_distance_map(const long[string] map, string input)
{
    ushort[][] dmap = new ushort[][](map.length, map.length);
    foreach (string s; input.splitLines)
    {
        auto t = s.split;
        dmap[map[t[0]]][map[t[2]]] = to!ushort(t[4]);
        dmap[map[t[2]]][map[t[0]]] = to!ushort(t[4]);
    }
    return dmap;
}

long[string] get_map(string input)
{
    long[string] map;
    int i = 0;
    foreach (string s; input.splitLines)
    {
        auto t = s.split;
        if ((t[0] in map) is null)
        {
            map[t[0]] = i++;
        }
        if ((t[2] in map) is null)
        {
            map[t[2]] = i++;
        }
    }
    return map;
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

long evaluate_distance(ushort[][] distance_map, ushort[] path)
{
    long distance = 0;
    for (int i = 0; i < path.length - 1; i++)
    {
        distance += distance_map[path[i]][path[i + 1]];
    }
    return distance;
}

long minimum_distance(string input)
{
    auto map = get_map(input);
    writeln(map);
    auto distance_map = get_distance_map(map, input);
    ushort num = to!ushort(map.length);
    long distance = long.max;
    auto path = get_initial_path(num);
    do
    {
        long cur = evaluate_distance(distance_map, path);
        if (cur < distance)
        {
            distance = cur;
        }
    }
    while (nextPermutation(path));
    return distance;
}

long maximum_distance(string input)
{
    auto map = get_map(input);
    writeln(map);
    auto distance_map = get_distance_map(map, input);
    ushort num = to!ushort(map.length);
    long distance = 0;
    auto path = get_initial_path(num);
    do
    {
        long cur = evaluate_distance(distance_map, path);
        if (cur > distance)
        {
            distance = cur;
        }
    }
    while (nextPermutation(path));
    return distance;
}

unittest
{
    string input = `London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141`;
    writeln(minimum_distance(input));
    assert(minimum_distance(input) == 605);
    assert(maximum_distance(input) == 982);

}

void main()
{
    writeln(minimum_distance(input));
    writeln(maximum_distance(input));

}

string input = `Faerun to Tristram = 65
Faerun to Tambi = 129
Faerun to Norrath = 144
Faerun to Snowdin = 71
Faerun to Straylight = 137
Faerun to AlphaCentauri = 3
Faerun to Arbre = 149
Tristram to Tambi = 63
Tristram to Norrath = 4
Tristram to Snowdin = 105
Tristram to Straylight = 125
Tristram to AlphaCentauri = 55
Tristram to Arbre = 14
Tambi to Norrath = 68
Tambi to Snowdin = 52
Tambi to Straylight = 65
Tambi to AlphaCentauri = 22
Tambi to Arbre = 143
Norrath to Snowdin = 8
Norrath to Straylight = 23
Norrath to AlphaCentauri = 136
Norrath to Arbre = 115
Snowdin to Straylight = 101
Snowdin to AlphaCentauri = 84
Snowdin to Arbre = 96
Straylight to AlphaCentauri = 107
Straylight to Arbre = 14
AlphaCentauri to Arbre = 46`;
