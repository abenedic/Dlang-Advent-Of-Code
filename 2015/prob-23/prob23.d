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

int main()
{

	auto p = input.splitLines();
	int pic = 0;
	int a = 1;
	int b = 0;
	bool done = false;
	int temp;
	while (!done)
	{
		auto line = p[pic].split;
		switch (line[0])
		{
		case "END":
			done = true;
			break;
			/*hlf r sets register r to half its current value, then continues with the next instruction.
tpl r sets register r to triple its current value, then continues with the next instruction.
inc r increments register r, adding 1 to it, then continues with the next instruction.
jmp offset is a jump; it continues with the instruction offset away relative to itself.
jie r, offset is like jmp, but only jumps if register r is even ("jump if even").
jio r, offset is like jmp, but only jumps if register r is 1 ("jump if one", not odd).
* */
		case "inc":
			if (line[1] == "a")
			{
				a++;
			}
			else
			{
				b++;
			}
			pic++;
			break;
		case "hlf":
			if (line[1] == "a")
			{
				a /= 2;
			}
			else
			{
				b /= 2;
			}
			pic++;
			break;
		case "tpl":
			if (line[1] == "a")
			{
				a *= 3;
			}
			else
			{
				b *= 3;
			}
			pic++;
			break;
		case "jmp":
			pic += to!int(line[1]);
			break;
		case "jie":
			if (line[1].strip(',') == "a")
			{
				temp = a;
			}
			else
			{
				temp = b;
			}
			if (temp % 2 == 0)
			{
				pic += to!int(line[2]);
			}
			else
			{
				pic++;
			}
			break;
		case "jio":
			if (line[1].strip(',') == "a")
			{
				temp = a;
			}
			else
			{
				temp = b;
			}
			if (temp == 1)
			{
				pic += to!int(line[2]);
			}
			else
			{
				pic++;
			}
			break;
		default:
			writeln("Saw:", line);
			assert(0);
		}

	}

	writeln(b);

	return 0;
}

string input = `jio a, +19
inc a
tpl a
inc a
tpl a
inc a
tpl a
tpl a
inc a
inc a
tpl a
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
jmp +23
tpl a
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
inc a
tpl a
inc a
tpl a
inc a
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
tpl a
inc a
jio a, +8
inc b
jie a, +4
tpl a
inc a
jmp +2
hlf a
jmp -7
END
END
END
END`;
