import std.string;
import std.stdio;
import std.conv;
import std.algorithm.sorting;

struct deer
{
    int speed;
    int go_time;
    int cooldown;

    int race_clock;
    int cooldown_clock;
    long distance = 0;
    bool stopped = false;
    int points;
    void advance()
    {
        if (stopped)
        {
            if (cooldown_clock != 0)
            {
                cooldown_clock--;
                return;
            }
            else
            {
                if (cooldown_clock == 0)
                {
                    stopped = false;
                    race_clock = go_time;
                }
            }
        }
        else
        {
            if (race_clock == 0)
            {
                stopped = true;
                cooldown_clock = cooldown;
                cooldown_clock--;
                return;
            }
        }
        distance += speed;
        race_clock--;
    }

    this(int speed, int go_time, int cooldown)
    {
        this.speed = speed;
        this.go_time = go_time;
        this.cooldown = cooldown;
        this.race_clock = go_time;
        this.cooldown_clock = 0;
        this.distance = 0;
        this.points = 0;
    }
}

deer[] get_deer(string input)
{
    deer[] deers;
    int i = 0;
    foreach (s; input.splitLines)
    {
        writeln(s);
        auto t = s.split;
        writeln(t);
        deer d = deer(to!int(t[3]), to!int(t[6]), to!int(t[13]));
        deers.length = ++i;
        deers[i - 1] = d;
    }
    return deers;
}

long race_deer(string input, int seconds)
{
    long max_distance = 0;

    auto deers = get_deer(input);
    for (int j = 0; j < seconds; j++)
    {
        foreach (ref d; deers)
        {
            d.advance;
        }
    }
    foreach (d; deers)
    {
        writeln(d);
        if (d.distance > max_distance)
        {
            max_distance = d.distance;
        }
    }

    return max_distance;
}

long race_deer_with_points(string input, int seconds)
{
    long max_distance = 0;

    auto deers = get_deer(input);
    for (int j = 0; j < seconds; j++)
    {
        foreach (ref d; deers)
        {
            d.advance;
        }
        award_points(deers);
    }
    foreach (d; deers)
    {
        writeln(d);
        if (d.points > max_distance)
        {
            max_distance = d.points;
        }
    }
    return max_distance;
}

void award_points(ref deer[] deers)
{
    long max_distance = 0;
    foreach (d; deers)
    {
        writeln(d);
        if (d.distance > max_distance)
        {
            max_distance = d.distance;
        }
    }
    foreach (ref d; deers)
    {
        if (d.distance == max_distance)
        {
            d.points++;
        }
    }
}

unittest
{
    string input = `Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
    Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
`;
    auto seconds = 1000;
    auto distance = race_deer(input, seconds);
    writeln(distance);
    assert(distance == 1120);
    assert(race_deer_with_points(input, seconds) == 689);
}

void main()
{
    auto seconds = 2503;
    auto distance = race_deer(input, seconds);
    writeln(distance);
    writeln(race_deer_with_points(input, seconds));
}

string input = `Dancer can fly 27 km/s for 5 seconds, but then must rest for 132 seconds.
Cupid can fly 22 km/s for 2 seconds, but then must rest for 41 seconds.
Rudolph can fly 11 km/s for 5 seconds, but then must rest for 48 seconds.
Donner can fly 28 km/s for 5 seconds, but then must rest for 134 seconds.
Dasher can fly 4 km/s for 16 seconds, but then must rest for 55 seconds.
Blitzen can fly 14 km/s for 3 seconds, but then must rest for 38 seconds.
Prancer can fly 3 km/s for 21 seconds, but then must rest for 40 seconds.
Comet can fly 18 km/s for 6 seconds, but then must rest for 103 seconds.
Vixen can fly 18 km/s for 5 seconds, but then must rest for 84 seconds.
`;
