/
In front of you are two dice. You know the numbers on the front, left, and top faces of each. 
Through your exquisite knowledge of dice trivia, 
you are also aware the numbers on opposite faces of a die add up to 7. The faces are like so:

Dice 1:
  Front: 1
  Left:  2
  Top: 3

Dice 2:
  Front: 1
  Left:  3
  Top: 2


You're provided with a series of directions - up (U), down (D), left (L), or right (R), 
to spin the current front face of each dice. 
If you spin the dice in the same direction at each step of the input \"LRDLU\", 
the front faces after each of these five instructions would be:

Ins. Dice1 Dice2
0     5     4
1     1     1
2     3     2
3     5     4
4     1     1


Above, it's clear the front faces match after instruction indices 1 and 4 (starting from 0).
\

dice1:`ft`bk`lt`rt`tp`bm!1 6 2 5 3 4;
dice2:`ft`bk`lt`rt`tp`bm!1 6 3 4 2 5;

/+ implement up (U), down (D), left (L), or right (R)

spin1:{[dir]
	if[dir=`U; temp:dice1[`ft];dice1[`ft]:dice1[`bm];dice1[`bm]:dice1[`bk];dice1[`bk]:dice1[`tp];dice1[`tp]:temp;];
	if[dir=`D; temp:dice1[`ft];dice1[`ft]:dice1[`tp];dice1[`tp]:dice1[`bk];dice1[`bk]:dice1[`bm];dice1[`bm]:temp;];
	if[dir=`L; temp:dice1[`ft];dice1[`ft]:dice1[`rt];dice1[`rt]:dice1[`bk];dice1[`bk]:dice1[`lt];dice1[`lt]:temp;];
	if[dir=`R; temp:dice1[`ft];dice1[`ft]:dice1[`lt];dice1[`lt]:dice1[`bk];dice1[`bk]:dice1[`rt];dice1[`rt]:temp;];
	:dice1`ft;}

spin2:{[dir]
	if[dir=`U; temp:dice2[`ft];dice2[`ft]:dice2[`bm];dice2[`bm]:dice2[`bk];dice2[`bk]:dice2[`tp];dice2[`tp]:temp;];
	if[dir=`D; temp:dice2[`ft];dice2[`ft]:dice2[`tp];dice2[`tp]:dice2[`bk];dice2[`bk]:dice2[`bm];dice2[`bm]:temp;];
	if[dir=`L; temp:dice2[`ft];dice2[`ft]:dice2[`rt];dice2[`rt]:dice2[`bk];dice2[`bk]:dice2[`lt];dice2[`lt]:temp;];
	if[dir=`R; temp:dice2[`ft];dice2[`ft]:dice2[`lt];dice2[`lt]:dice2[`bk];dice2[`bk]:dice2[`rt];dice2[`rt]:temp;];
	:dice2`ft;}

process:{[inputs]
	x1:spin1 each inputs;
	x2:spin2 each inputs;
	show sum where x1=x2;}
	
inputs:`$1 cut "LRUDDLRDLLDRUUUURLUDLLDLUDRURRDLUDRDURUURDLRULDULLRDRLLLDRDRRRLLDLRUUUDRLRDRLDRRUURDRLUDUUDUDLLDRULRLDRRLUUURRDDUDRDRURRLRRLLDRUUURLLRLRURRRUDUDURUDRURDRDDDURDLUDDLDUDRULDRULURLUULLLURDRLDUDRDUDRLDDRUULLLULRLDUURUUDRDLLDRRDRLLRUUURLDRULUDDRDDLDRURURR"

process inputs

/+ kdb solution
/Take the initial dice state and use successive indices 
/Inputs are directions and initial state (front;left;top;bottom;right;back)
/Run for each initial state and compare

f:{first flip{@\[x;y z]}[y]["UDRL"!(3 1 0 5 4 2;2 1 5 0 4 3;1 5 2 3 0 4;4 0 2 3 5 1)]x}

sum where =/[f/:[first read0`:input.txt;(1 2 3 4 5 6;1 3 2 5 4 6)]]