/
  1   2   3
     abc def
  4   5   6
 ghi jkl mno
  7   8   9
pqrs tuv wxyz
      0
      _
\
/ output string as if on the telephone pad

/ answer
/ use offsets and set values to alphabet+space
d:raze[t,/:'1 3 3 3 3 3 4 3 4#\:t:1+til 9]!" ",.Q.a;
d value'[read0`:input.txt]

/ my solution
telD:((1+til 9),0)!(enlist " ";" abc";" def";" ghi";" jkl";" mno";" pqrs";" tuv";" wxyz";enlist " ");
{x:value x;.[telD; x]} each dat;
/+ testing "oh so they have internet on computers now"
