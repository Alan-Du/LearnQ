/
It can be useful to know how to break down a number - usually this is done with factors, 
but instead, let's try it with summable components. For a number, 
you can work out the possible combinations of non-negative integers which sum to that number.
For example, these are the combinations of three numbers which sum to 3:
The digit "1" occurs 9 times above. For your input, 
how many times does the character "1" appear in all combinations summing to that number?
Note the number "11" would be twice, "21" once, so 1 21 11 would be 4 times.
\

/+ kdb solution
/Avoid generating all combinations
/know that each combination must be N+100-(sums to N)
/generate a list of til each number up to the input
/join to each number less than the input
/This makes the list of (100-N) quantities
/subtract the sum of these from the input to get the Ns
/raze to get all

{flip b,enlist x-sum b:(where 1+x-a,x+1;raze(1+x-a)#\:a:til x+1)} 