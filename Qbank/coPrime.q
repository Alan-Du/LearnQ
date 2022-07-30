/+ find co-prmes number that are less than given number
/+ return the sum of all those numbers
/+ example:
/+ 15 has the following co-primes:
/+ 1 2 4 7 8 11 13 14
/+ return will be 60

numN:15;

gcd:{[n1;n2] first {-2#x,x[0] mod x[1]}/[{0<last x;(n1;n2)}]}
ans: enlist 0;
ans,:{$[gcd[numN;x]=1;:x;:0]} each til numN;

/make a list of factors up to the sqrt of the input 
/find their matching co-factors to make up the input
/filter for the "primes" within the list by checking for even division of that list within itself
/make a list of til[x] and removes the multiples of the found primes

{where not til[x] in raze 1,a*'til@'x div a:{x where 1=sum x=/:x*'x div/:x}i[w],d w:where x=i*d:x div i:1_1+til floor sqrt x}