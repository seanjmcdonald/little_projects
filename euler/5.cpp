#include <iostream>
#include <vector>
#include <cmath>

using std::cout;
using std::cin;
using std::vector;

int main() {
    int num;
    vector<int>div;
    cout<<"enter a number\n";
    cin>>num;
    for(int j=1;j<num;j++){
        int value=j;
        if(!div.empty()){
            for(int i=div.size()-1;i+1;i--){
               if (value%div[i]==0){
                    value=value/div[i];
                }
            }
        }
            div.push_back(value);
    } 
    int product=1;
    for(int i=0;i<div.size();i++){
        cout<<div[i]<<' ';
        product *=div[i];   
    } 
    
    cout<<'\n'<<"the total product of "<<num<<" is "<< product<<'\n'; 


}
