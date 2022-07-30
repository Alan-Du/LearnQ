/
You're in an oddly shaped room, 
there are squares on the floor and you move one square at a time. 
The room looks like this:

  ##
 ####
######
######
 ####
  ##

This is a six-by-six area defined in indices from 0 to 5 on each axis.
You start in the first # in the top row, or position 0 2 in indices, 
and recieve a series of instructions to step up (U) left (L) right (R) or 
down (D) on the map above. You can't step outside the # - if you're given 
an instruction to do so, ignore it, and move on to the next instruction.
For example, with input UDRR, you eventually run out of instructions at position 1 4.
\

/ my solution
moveDict:`U`L`R`D!((-1;0);(0;-1);(0;1);(1;0););
board:((0;2);(0;3);(1;1);(1;2);(1;3);(1;4);(2;0);(2;1);(2;2);(2;3);(2;4);(2;5);
	   (3;0);(3;1);(3;2);(3;3);(3;4);(3;5);(4;1);(4;2);(4;3);(4;4);(5;2);(5;3););
	   
answer:0;
curI:(0;2);
moveStep:{[x]
	mm:curI+moveDict[`$x];
	`curI set $[mm in board; mm; curI];
	answer+:(cutI[0]+cutI[1]);}	   



/+ kdb solution
/Avoid using nested lists for maximum speed
/nested lookups are expensive! 
/instead calculate offset of co-ordinates along a flat list

/First define a flattened boolean maze
l:"#"=raze m:("  ##  ";" #### ";"######")0 1 2 2 1 0

/Define a dictionary of coordinate movements
o:"UDLR"!-1 1 -1 1*(count m 0;1)0 0 1 1

/Move only if on a "#", and use vs to transform accounting for flattened map
f:{count[m 0] vs {$[l r:x+y;r;x]}/[2;o x]}