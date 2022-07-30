/+ compute gcd given 2 numbers
/+ recursion take last two numbers 
/+ from each iteration
gcd:{[n1;n2] first {-2#x,x[0] mod x[1]}/[{0<last x;(n1;n2)}]}
