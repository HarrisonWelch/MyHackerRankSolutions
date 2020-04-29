# https://www.hackerrank.com/challenges/awk-3/problem

awk '{
    if($2 < 50 || $3 < 50 || $4 < 50) 
        print $1,$2,$3,$4,": FAIL"; 
    else if ((($2+$3+$4) / 3) < 60)
        print $1,$2,$3,$4,": C";
    else if ((($2+$3+$4) / 3) < 80)
        print $1,$2,$3,$4,": B";
    else
        print $1,$2,$3,$4,": A";
}'
