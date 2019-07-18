#include <iostream>
#include <vector>

using std::cout;
using std::vector;

//4613732
int main() {
    int fib_sum=0;
    int even_num=0;
    vector<int> fib;
    fib.push_back(1);
    fib.push_back(1);
    while(fib_sum<=4000000){
        fib.push_back(fib[fib.size()-1]+ fib[fib.size()-2]);
        if(fib.back()%2==0){
            fib_sum+=fib.back();
        }
    }
 cout<<'\n'<<"hopefully " <<fib_sum;
}
