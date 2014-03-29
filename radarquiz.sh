#!/bin/sh 

#rm -rf index*

TARGET=`curl -s http://www.footballradar.com/quiz/ | grep -E -o [-]?[0-9][0-9].[+-].[0-9][0-9].[+-].[0-9][0-9] | bc`

wget http://www.footballradar.com/quiz/answer/${TARGET}

echo ${TARGET}

