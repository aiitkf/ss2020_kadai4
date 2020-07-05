#!/bin/bash

# 使い方
#  ./kf_tester_kadai4.sh 2>/dev/null
# エラーメッセージが出るのは仕様
# /dev/nullに出せば結果のみ表示できる
# Place arg1, arg2 and correct answer as testnum array.
testnum=(
88 33 11
144 276 12
200 500 100
6101 18743 1
204476 154411 527
9223372036854775807 8970676912557384689 126347562148695559
9223372036854775783 3 1
9223372036854775783 9223372036854775643 1
9223371873002223329 9223371800114211497 3037000493
neko saru 0
33.33 2.61 0
3 12.96 0
狸 115 0
83 ぬ 0
0 2 0
2 0 0
0 0 0
)
prog="./kf_kadai4.sh"
numsample=$((${#testnum[@]}/3)) 


for i in $(seq $numsample)
do
	j=$((i-1))
	arg1=${testnum[$((j*3))]}
	arg2=${testnum[$((j*3+1))]}
	correctans=${testnum[$((j*3+2))]}
	returnans=$($prog "$arg1" "$arg2")
    if [ "$returnans" -eq "$correctans" ]; then
		echo -e "\e[32m✓ case $i\e[m"
    elif [ $? -gt 0 ] && [ "$correctans" -eq 0 ]; then
		echo -e "\e[32m✓ case $i\e[m"
	else
		echo -e "\e[31m✗ Oops! something is wrong... case $i\e[m"
		exit 1
		# 正解データと不一致の場合はエラー終了
	fi
done

exit 0
# すべて正解データと一致すれば正常終了

