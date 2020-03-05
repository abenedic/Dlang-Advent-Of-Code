module main;
import std.stdio;
import std.algorithm;
import std.digest.md;
import std.conv;

string get_hex_md5_hash(string input)
{
    ubyte[16] hash = md5Of(input);
    return toHexString(hash).idup;
}

bool check_5_zeros(string input)
{
    return input.startsWith("00000");
}

bool check_6_zeros(string input){
    return input.startsWith("000000");
}

bool satisfies_requirement(string input){
    return check_5_zeros(get_hex_md5_hash(input));
}

long find_number(string input){
    long number =0;
    while(!satisfies_requirement(input ~ to!string(number))){
        number++;
    }
    return number;
}

unittest{
    assert(satisfies_requirement("abcdef609043"));
    assert(find_number("abcdef") == 609043);
}

long part2(string input){
long number =0;
    while(!check_6_zeros(get_hex_md5_hash((input ~ to!string(number))))){
        number++;
    }
    return number;
}

void main()
{
    writeln(find_number(input));
    writeln(part2(input));
}

string input = `yzbqklnj`;
