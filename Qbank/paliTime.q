/+ Calculate the seconds diffs to the nearest palindromic times
/+ example:
/+ 13:41:00 -> 13:44:31 diff is 211
/+ want to generate all possible palindro time then get nearest
/+ one possiblity is there are two ways counting time difference
/+ 00:01:00 to 23:50:00 is actuall 11 minutes not 2Hr-11Min

getPalin:{
lclHH:"I"$test where 60>"I"$reverse each -2#'("0",/: test:string til 24);
lclSS:"I"$reverse each -2#'("0",'string lclHH);
lclMM:11*til 6;
allComb:sum each (((lclHH*60*60)+lclSS) cross (lclMM*60));
:`int$allComb;}

paliT:{[tt; allPal]
difAbs:abs(`int$tt-allPal);
difAbs,:86400-difAbs;
:min abs difAbs;}

inputs: "V"$read0 `:/home/sdu/Qnight/practice/timeInput.txt;
/+ inputs:13:42:37 05:58:16 04:43:32 10:28:32 17:52:00;
ans:0;
ans+: paliT[ ;getPalin`] each inputs;
show sum ans



/+ kdb solution

/Build a list of the 96 palidromic times in the day
/Use bin to find the nearest lower value to the input, and check if closer to it or the nearest above (with 0 1+\:)
/Fill the topmost palindrome time with midnight for very late times

{min abs x-/:86400^p 0 1+\:bin[p:(96#60*t+10*t)+((a+10*b)+3600*(16#t)+10*a:where 6 6 4)where 16#6]x:"j"$x}