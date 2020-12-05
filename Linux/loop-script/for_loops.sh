#!/bin/bash

nums=$(seq 0 9)
states=('new york' 'california' 'florida' 'hawaii' 'alabama')
ls_out=$(ls)

for num in ${nums[@]}
do
    if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 }
    then
      echo $num
    fi
done

for state in ${states[@]} 
do
    if [ $state == 'hawai' ]
    then
      echo "hawaii is da bomb"
    else
      echo "yuck hawaii"
    fi
done

for x in ${ls_out[@]}
do
  echo $x
done


