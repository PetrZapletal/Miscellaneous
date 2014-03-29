#!/bin/sh 

TARGET=`curl -c radarcookie.txt -s http://www.footballradar.com/quiz/ | grep -E -o [\-]?[0-9][0-9].[\*\+\-].[0-9][0-9].[\*\+\-].[0-9][0-9] | bc`

wget -x --load-cookies radarcookie.txt http://www.footballradar.com/quiz/answer/${TARGET}

echo ${TARGET}
