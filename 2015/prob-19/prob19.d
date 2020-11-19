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

struct key_value
{
	string key;
	string value;
}

int count_elements(string a)
{
	ulong cursor = 0;
	int count = 0;
	while (cursor < a.length)
	{
		switch (a[cursor++])
		{
		case '\0':
			count++;
			break;
		case 'O':
			count++;
			break;
		case 'Y':
			count++;
			break;
		case 'F':
			count++;
			break;
		case 'B':
			count++;
			break;
		case 'P':
			count++;
			break;
		case 'H':
			count++;
			break;
		case 'N':
			count++;
			break;
		case 'S':
			cursor++;
			count++;
			break;
		case 'R':
			cursor++;
			count++;
			break;
		case 'M':
			cursor++;
			count++;
			break;
		case 'C':
			if (a[cursor] == 'a')
			{
				cursor++;
				count++;
				break;
			}
			else
			{
				count++;
				break;
			}
		case 'A':
			if (a[cursor] == 'r')
			{
				cursor++;
				count++;
				break;
			}
			else
			{
				cursor++;
				count++;
				break;
			}
		case 'T':
			if (a[cursor] == 'h')
			{
				cursor++;
				count++;
				break;
			}
			else
			{
				cursor++;
				count++;
				break;
			}
		default:
			break;
		}
	}

	return count;
}

key_value[] parse_replacements(string in1)
{
	key_value[] map;
	foreach (string s; in1.splitLines())
	{
		auto temp = s.split("=>");
		auto left = temp[0].strip();
		auto right = temp[1].strip();
		map ~= key_value(right, left);
	}
	return map;

}

int heuristic(string target)
{
	return count_elements(target);

}

string[] clean(string[] arr)
{
	arr.length -= arr.uniq().copy(arr).length;
	return arr;
}

string[] mutations(key_value[] map, string[] in1)
{
	string[] out1;
	foreach (in2; in1)
	{
		foreach (value; map)
		{
			string temp = in2;
			foreach (m; matchAll(temp, regex(value.key)))
			{
				string new_string = m.pre ~ value.value ~ m.post;
				out1 ~= new_string;
			}
		}
	}
	return clean(out1);
}

int[] get_costs(string[] fringe, string goal, int count)
{
	int[] out1;
	out1.length = fringe.length;
	ulong i = 0;
	foreach (s; fringe)
	{
		out1[i++] = heuristic(s) + count;
	}
	return out1;
}

int search(string current, string goal, key_value[] map, int count)
{

	static int[string] cost;
	if (current in cost)
	{
		//writeln("Returning saved!");
		return cost[current];
	}

	if (count >= 196)
	{
		return -1;
	}
	writeln("count: ", count, " current = ", current);
	auto fringe = mutations(map, [current]);
	if (!fringe.find(goal).empty)
	{
		writeln("Found It!");
		writeln(count);
		assert(0);
		return count;
	}

	auto costs = get_costs(fringe, goal, count);
	zip(costs, fringe).sort!((t1, t2) => t1[0] < t2[0]);
	for (ulong i = 0; i < fringe.length; i++)
	{
		if (costs[i] >= 471)
		{
			cost[current] = -1;
			return -1;
		}
		auto out1 = search(fringe[i], goal, map, count + 1);
		cost[fringe[i]] = out1;
		if (out1 > 0)
		{
			return out1;
		}
	}
	cost[current] = -1;
	return -1;
}

int fewest_steps(string in1, string in2)
{
	auto map = parse_replacements(in1);
	return search(in2, "e", map, 1);
}

//unittest{
//string input1 = `e => H
//e => O
//H => HO
//H => OH
//O => HH`;
//string input2 = `HOH`;

////assert(count_distinct(input1,input2)==4);
//assert(fewest_steps(input1,input2) == 3);
//}

int main()
{
	//writeln(count_distinct(input1,input2));
	writeln(fewest_steps(input1, input2));
	return 0;
}

string input1 = `Al => ThF
Al => ThRnFAr
B => BCa
B => TiB
B => TiRnFAr
Ca => CaCa
Ca => PB
Ca => PRnFAr
Ca => SiRnFYFAr
Ca => SiRnMgAr
Ca => SiTh
F => CaF
F => PMg
F => SiAl
H => CRnAlAr
H => CRnFYFYFAr
H => CRnFYMgAr
H => CRnMgYFAr
H => HCa
H => NRnFYFAr
H => NRnMgAr
H => NTh
H => OB
H => ORnFAr
Mg => BF
Mg => TiMg
N => CRnFAr
N => HSi
O => CRnFYFAr
O => CRnMgAr
O => HP
O => NRnFAr
O => OTi
P => CaP
P => PTi
P => SiRnFAr
Si => CaSi
Th => ThCa
Ti => BP
Ti => TiTi
e => HF
e => NAl
e => OMg`;

string input2 = `CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr`;
