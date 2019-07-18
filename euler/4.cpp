#include<iostream>
#include<string>
using std::cout;
using std::string;
using std::to_string;

//does empty count as palindrome?
bool isPalindrome(string sample,int len){
    for(int i=0;i<len/2;i++){
        if(sample[i]==sample[len-i-1]){
            continue;
        } else {
            return false;
        }
    }
        return true;

}


int main() {
    char why[10000];
    for(int j=999;j>0;j--){
        for(int i=999;i>=j;i--){
            string temp=to_string(i*j);
            if(isPalindrome(temp,temp.length())){
                cout<<i<<" "<<j<<'\n';
            }
        } 
    }
}



//cat tempy | awk '{print $1 * $2}' | sort -n
