# hackerrank.com/challenges/text-processing-in-linux-the-grep-command-5/problem

tr -d " " | grep "11\|22\|33\|44\|55\|66\|77\|88\|99\|00" | sed "s/.\{4\}/& /g"
