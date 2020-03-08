import std.stdio;
import std.string;





long to_base_26(const char[8] input){
    long output=0;
    for(int i=0;i<input.length;i++){
        output+=input[i]-'a';
        output*=26;
    }
    return output/26;
}

char[8] from_base_26(long input){
    char[8] output;
    for(int i=7; i>=0;i--){
        output[i] = 'a'+(input %26);
        input /=26;
    }
    return output;
}

char[8] increment_string(const char[8] input){
    return from_base_26(to_base_26(input)+1);
}
/*
    Passwords must include one increasing straight of at least three letters, like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd doesn't count.
    Passwords may not contain the letters i, o, or l, as these letters can be mistaken for other characters and are therefore confusing.
    Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
*/
bool has_disallowed_chars(char[8] input){
    foreach(char a;input){
        if(a == 'i'|| a== 'l' || a=='o'){
            return true;
        }
    }
    return false;
}

bool has_increasing_straight(char[8] input){
    int count=0;
    for(int i=1; i<input.length;i++){
        if(input[i]-'a'==input[i-1]-'a'+1){
            count++;
            writeln(count);
        }else{
            count =0;
        }
        if(count >=2){
            return true;
        }
    }
    return false;
}

bool has_two_pairs(char[8] input){
    int count=0;
    int run=1;
    for(int i=1; i<input.length;i++){
        if(input[i]==input[i-1]){
            run++;
            writeln(input, " ", input[i], " ",run, " ",count);
        }else{
            count += run/2 ;
            run=1;
        }
    }
     count += run/2 ;
    writeln(count);
    return count>=2;
}

bool is_valid_password(char[8] input){
    return !has_disallowed_chars(input) && has_increasing_straight(input) && has_two_pairs(input);
}
char[8] next_password(const char[8] input){
    auto password = increment_string(input);
    while(!is_valid_password(password)){
        password = increment_string(password);
    }
    return password;
}


unittest{
    assert(to_base_26(from_base_26(435431))== 435431);
    assert(has_increasing_straight("ghjaabcc"));
    assert(!is_valid_password("hijklmmn"));
    assert(has_disallowed_chars("hijklmmn"));
    assert(!has_two_pairs("hijklmmn"));
    assert(has_two_pairs("abcdffaa"));
    assert(!has_increasing_straight("abbceffg"));
    assert(!is_valid_password("abbceffg"));
    assert(!is_valid_password("abbcegjk"));
    assert(is_valid_password("abcdffaa"));
    
    assert(is_valid_password("ghjaabcc"));

    assert(next_password("ghijklmn")=="ghjaabcc");
    assert(next_password("abcdefgh")=="abcdffaa");
}

void main(){
    writeln(next_password(input));
}

char[8] input = `vzbxxyzz`;