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

const int player_hit_points = 50;
const int player_mana_points = 500;
const int boss_hit_points = 71;
const int boss_damage = 10;


struct state{
	int player_health;
	int player_mana;
	int boss_health;
	int player_armor_timer;
	int poison_timer;
	int recharge_timer;
	int cost_so_far;
}

void print_state(state s){
	writeln("Health: ", s.player_health, " Boss Health: ", s.boss_health, " Mana: ", s.player_mana);
}

enum choice{
	Missle,
	Drain,
	Shield,
	Poison,
	Recharge
}

int[5] cost = [53,73,113,173,229];

state do_round(state in1, choice player_choice){
	state out1 = in1;
	//Player_turn.
	out1.player_health-=1;
	if(out1.player_health<=0){
		return out1;
	}
	if(out1.poison_timer>0){
		out1.boss_health -=3;
		out1.poison_timer--;
	}
	if(out1.recharge_timer>0){
		out1.player_mana+=101;
		out1.recharge_timer--;
	}
	if(out1.player_armor_timer>0){
		out1.player_armor_timer--;
	}

	switch(player_choice){
		case choice.Missle: out1.boss_health -= 4;
		break;
		case choice.Drain: out1.boss_health-=2; out1.player_health+=2;
		break;
		case choice.Shield: out1.player_armor_timer=6;
		break;
		case choice.Poison: out1.poison_timer = 6;
		break;
		case choice.Recharge: out1.recharge_timer =5;
		break;
		default: assert(0);
	}
	out1.player_mana-=cost[player_choice];
	out1.cost_so_far+=cost[player_choice];

	if(out1.poison_timer>0){
		out1.boss_health -=3;
		out1.poison_timer--;
	}
	if(out1.recharge_timer>0){
		out1.player_mana+=101;
		out1.recharge_timer--;
	}

	if(out1.boss_health<=0){
		return out1;
	}

	if(out1.player_armor_timer>0){
		out1.player_health-=boss_damage-7;
		out1.player_armor_timer--;
	}else{
		out1.player_health-=boss_damage;
	}

	return out1;
}

bool done(state cur){
	return cur.player_health<=0 || cur.boss_health <=0 || cur.player_mana<53;
}
bool win(state cur){
	return cur.boss_health<=0 && cur.player_health>0;
}

int split(state in1){

	if(done(in1)&& win(in1)){
		return in1.cost_so_far;
	}
	if(done(in1)){
		return 5000000;
	}

	int[] arr;

	if(in1.player_armor_timer<=1 && in1.player_mana>=113){
		arr ~= split(do_round(in1,choice.Shield));
	}
	if(in1.recharge_timer<=1 && in1.player_mana>=229){
		arr ~= split(do_round(in1,choice.Recharge));
	}
	if(in1.poison_timer<=1 && in1.player_mana>=173){
		arr ~= split(do_round(in1,choice.Poison));
	}
	arr ~= split(do_round(in1,choice.Missle));
	if(in1.player_mana>=73){
	arr ~= split(do_round(in1,choice.Drain));
}
return minElement(arr);

}

int mana_cost_fight(){
	state initial = state(player_hit_points, player_mana_points, boss_hit_points,
	0,0,0,0);
	return split(initial);

}

int main(){
	writeln(mana_cost_fight());
	return 0;
}

/*
 * Magic Missile costs 53 mana.
 * It instantly does 4 damage.
Drain costs 73 mana.
* It instantly does 2 damage and heals you for 2 hit points.
Shield costs 113 mana.
* It starts an effect that lasts for 6 turns. While it is active, your armor is increased by 7.
Poison costs 173 mana.
* It starts an effect that lasts for 6 turns. At the start of each turn while it is active, it deals the boss 3 damage.
Recharge costs 229 mana.
* It starts an effect that lasts for 5 turns. At the start of each turn while it is active, it gives you 101 new mana.
 *
 * */

string input=`
Player:
50 hit points and 500 mana points.

Boss:
Hit Points: 71
Damage: 10`;
