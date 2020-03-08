import std.conv;

import std.stdio;

string look_and_say(string input)
{
    long run_length = 0;
    char view = '\0';
    string output = "";
    foreach (char a; input)
    {
        if (a == view)
        {
            run_length++;
        }
        else
        {
            if (view != '\0')
            {
                output ~= to!string(run_length + 1) ~ to!string(view);
                run_length = 0;
            }
        }
        view = a;
    }
    output ~= to!string(run_length + 1) ~ to!string(view);
    return output;

}

unittest
{
    writeln(look_and_say("111221"));
    assert(look_and_say("111221") == "312211");
    assert(look_and_say("1") == "11");
    assert(look_and_say("11") == "21");
    assert(look_and_say("21") == "1211");
    assert(look_and_say("1211") == "111221");

}

void main()
{
    string a = input;
    for (int i = 0; i < 50; i++)
    {
        a = look_and_say(a);
    }
    writeln(a.length);
}

string input = `1113122113`;
