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

spin:{[dice; dir]
	if[dir=`U; temp:dice[`ft];dice[`ft]:dice[`bm];dice[`bm]:dice[`bk];dice[`bk]:dice[`tp];dice[`tp]:temp;];
	if[dir=`D; temp:dice[`ft];dice[`ft]:dice[`tp];dice[`tp]:dice[`bk];dice[`bk]:dice[`bm];dice[`bm]:temp;];
	if[dir=`L; temp:dice[`ft];dice[`ft]:dice[`rt];dice[`rt]:dice[`bk];dice[`bk]:dice[`lt];dice[`lt]:temp;];
	if[dir=`R; temp:dice[`ft];dice[`ft]:dice[`lt];dice[`lt]:dice[`bk];dice[`bk]:dice[`rt];dice[`rt]:temp;];
	:dice;}

genSpin:{[dice; inputs]
	loc:0;
	ans:enlist 0;
	while[loc<count inputs;
		dice:spin[dice;inputs[loc]];
		ans,:dice`ft;
		loc+:1;];
	:1_ans;}

process:{[inputs]
	x1:genSpin[dice1; inputs];
	x2:genSpin[dice2; inputs];
	show sum where x1=x2;}

inputs:`$1 cut "LRUDDLRDLLDRUUUURLUDLLDLUDRURRDLUDRDURUURDLRULDULLRDRLLLDRDRRRLLDLRUUUDRLRDRLDRRUURDRLUDUUDUDLLDRULRLDRRLUUURRDDUDRDRURRLRRLLDRUUURLLRLRURRRUDUDURUDRURDRDDDURDLUDDLDUDRULDRULURLUULLLURDRLDUDRDUDRLDDRUULLLULRLDUURUUDRDLLDRRDRLLRUUURLDRULUDDRDDLDRURURR"

process inputs

/+ kdb solution
/Take the initial dice state and use successive indices 
/Inputs are directions and initial state (front;left;top;bottom;right;back)
/Run for each initial state and compare

/
f:{first flip{@\[x;y z]}[y]["UDRL"!(3 1 0 5 4 2;2 1 5 0 4 3;1 5 2 3 0 4;4 0 2 3 5 1)]x}

sum where =/[f/:[first read0`:input.txt;(1 2 3 4 5 6;1 3 2 5 4 6)]]
\