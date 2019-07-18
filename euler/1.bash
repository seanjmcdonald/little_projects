for i in {1..999} ; 
    do if [ $((i%3)) == 0 -o $((i%5)) == 0  ]
        then
            sum=$(( sum + i ))
        fi ; done 
echo $sum
