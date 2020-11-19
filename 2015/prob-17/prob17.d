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

shared long[] counts;

long fits_exactly(long amount, int[] containers, long count)
{
    if (count > 4)
    {
        return 0;
    }
    if (amount == 0)
    {
        counts ~= count;
        return 1;
    }
    if (amount < 0)
    {
        return 0;
    }
    if (containers.empty)
    {
        return 0;
    }
    auto s = containers[0];
    containers.popFront;
    return fits_exactly(amount - s, containers, count + 1) + fits_exactly(amount, containers, count);
}

long count_ways(string input, long amount)
{
    int[] containers;
    auto c = input.splitLines.map!(to!int);
    foreach (container; c)
    {
        containers ~= container;
    }
    containers.sort!"a>b";
    writeln(containers);
    long count = fits_exactly(amount, containers, 0);
    writeln(counts.minElement);
    return count;
}

void main()
{
    auto o = count_ways(input, 150);
    writeln(o);
    if (o >= 3224)
    {
        writeln("Wrong! Too high!");
    }
}

unittest
{
    string input = `20
15
10
5
5`;
    auto o = count_ways(input, 25);
    writeln(o);
    assert(o == 4);
}

string input = `33
14
18
20
45
35
16
35
1
13
18
13
50
44
48
6
24
41
30
42`;
