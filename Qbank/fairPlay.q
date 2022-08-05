/
This cipher starts with a keyword, which is reduced to the first 
distinct occurrence of each letter of the alphabet within that 
word (removing any spaces if necessary). Then all remaining letters 
of the alphabet (except j) are joined on. The resulting 25 letter 
string is cut into a 5x5 grid. For example key word "playfair", 
this results in:
The plain text to be encrypted is prepared for lookup in the grid 
by removing all spaces, splitting repeat letters with "x", padding 
the string length to the nearest multiple of two (again with "x"), 
and splitting into two-letter pairs. For example string, "tree":

The position of each component of each letter pair is then found 
in the grid, and encrypted according to the following rules:
1. If the two letters are in the same row, the new letters are the 
letters directly to the right of the input letters (wrapping around if necessary)
2. If the two letters are in the same column, the new letters are 
the letters directly below the input letters (wrapping as above)
3. If the letters are separated diagonally, they form the corners 
of a "box". The encrypted letters are the letters on the laterally 
opposite end of this box to the input (i.e. look to the far left or 
right of the input while staying within the box)
\

/flatten input grid [x]
/generate plaintext with appropriate splitting and x padding
/find the letters in the grid [a] and deal with same row and col
/swap column index for pairs not in same row/col, index back into grid

f:{[f;x;y]
  a:distinct@[x;where "j"=x:lower[x except" "],.Q.a;:;"i"];                    
  b:"x"sv(0,where not differ b)cut b:@[y;where"j"=y:lower y except" ";:;"i"];  
  if[count[b]mod 2;b,:"x"];  d:count[b]#01b;                                   
  r:f[r]reverse next'[w]+w:(d&=':)each r:(div;mod)[;a?b;5];                    
  :a 5 sv .[r mod 5;(1;(e-1),e);:;r[1;e,-1+e:where d&not any w]];
 };

f[-][ [codeword]; [input] ]