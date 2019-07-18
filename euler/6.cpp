#include <iostream>
#include <vector>
#include <cmath>

using std::cout;
using std::vector;
using std::pow;

//4613732
int main() {
    int sum_of_squares=0;
    int sum_pow=0;
    for( int i=0;i<=100;i++){
        sum_of_squares+=pow(i,2);
        sum_pow+=i;
    }
    cout<<"sum of squares is "<< sum_of_squares<<"\nsquare of the sums is "<< pow(sum_pow,2)<<'\n';
    cout<<"the difference is " << pow(sum_pow,2)- sum_of_squares<<'\n';
}
