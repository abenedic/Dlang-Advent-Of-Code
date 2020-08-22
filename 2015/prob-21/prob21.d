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



int boss_damage =8;
int boss_armor=2;
int boss_hitpoints=109;


int player_hitpoints=100;
const int max_damage = 14;
const int max_armor = 14;
bool[max_damage][max_armor] results;
int[max_damage][max_armor]  costs;

bool fight(int player_hitpoints, int player_armor, int player_damage,int boss_hitpoints, int boss_armor, int boss_damage){
int player_to_boss = player_damage - boss_armor;
player_to_boss = player_to_boss<1?1:player_to_boss;
int boss_to_player = boss_damage - player_armor;
boss_to_player= boss_to_player<1?1:boss_to_player;

int i=0;
while(player_hitpoints >0 && boss_hitpoints>0){
	if(i++%2==0){
		boss_hitpoints -= player_to_boss;
	}else{
		player_hitpoints -= boss_to_player;
	}
}
if(player_hitpoints>0){
	return true;
}
return false;
}


unittest{

assert(fight(8,5,5,12,2,7));

}


bool curried_fight(int player_armor, int player_damage){
	return fight(100,player_armor, player_damage,boss_hitpoints,boss_armor,boss_damage);
}
//Min damage=4; max armor 8; boundary is +damage -armor.
//  Damage Armor
//  4      8
//  5      7
//  6      6
//  7      5 40+93 less than this.
//	8	   4 65+73

void print_results(){
	for(int i=0;i <max_damage; i++){

		for(int j=0; j<max_armor; j++){
			if(results[i][j]){
				printf("t");
			}else{
				printf("f");
			}
		}
		writeln();
	}
}


int[5] weapon_cost = [8,10,25,40,74];
int[5] weapon_value =[4,5,6,7,8];
int[6] armor_cost = [0,13,31,53,75,102];
int[6] armor_value = [0,1,2,3,4,5];
int[8] ring_armor_value = [0,0,0,0,0,1,2,3];
int[8] ring_weapon_value = [0,0,1,2,3,0,0,0];
int[8] ring_cost=[0,0,25,50,100,20,40,80];


int main(){

	for(int i=0;i <max_damage; i++){
		for(int j=0; j<max_armor; j++){
			results[i][j] = curried_fight(j,i);
			costs[i][j]=-1;
		}
	}
	for(int weapon=0; weapon<5; weapon++){
		for(int armor=0; armor<6; armor++){
		for(int ring1 =0; ring1<7;ring1++){
			for(int ring2=ring1+1;ring2<8;ring2++){
				int cost = weapon_cost[weapon]+armor_cost[armor]+ring_cost[ring1]+ring_cost[ring2];
				int damage = weapon_value[weapon]+ring_weapon_value[ring1]+ring_weapon_value[ring2];
				int armor_ = armor_value[armor]+ring_armor_value[ring1]+ring_armor_value[ring2];
				costs[damage][armor_] = cost>costs[damage][armor_]?cost:costs[damage][armor_];
			}
		}


		}
	}
for(int i=0;i <max_damage; i++){

		for(int j=0; j<max_armor; j++){
				printf("%i, ",costs[i][j]);
		}
		writeln();
	}

	print_results();
	int min =0;
	for(int i=0;i <max_damage; i++){

		for(int j=0; j<max_armor; j++){
				if(!results[i][j]){
					if(costs[i][j]>min){
						min=costs[i][j];
					}
				}
		}
	}

writeln(min);

	return 0;
}
/*
 * You must buy exactly one weapon; no dual-wielding.
 * Armor is optional, but you can't use more than one.
 * You can buy 0-2 rings (at most one for each hand).
 * You must use any items you buy.
 * The shop only has one of each item, so you can't buy,
 * for example, two rings of Damage +3.
 * */

string store_input= `Weapons:    Cost  Damage  Armor
Dagger        8     4       0
Shortsword   10     5       0
Warhammer    25     6       0
Longsword    40     7       0
Greataxe     74     8       0

Armor:      Cost  Damage  Armor
Leather      13     0       1
Chainmail    31     0       2
Splintmail   53     0       3
Bandedmail   75     0       4
Platemail   102     0       5

Rings:      Cost  Damage  Armor
Damage +1    25     1       0
Damage +2    50     2       0
Damage +3   100     3       0
Defense +1   20     0       1
Defense +2   40     0       2
Defense +3   80     0       3`; //6 rings so 30 permutations of rings.

string player_input =`Hit Points: 100`;
string boss_input= `Hit Points: 109
Damage: 8
Armor: 2`;

