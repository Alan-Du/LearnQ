/
Your input is a set of decks of cards, shuffled together. 
Draw from this deck, in order, one card at a time. 
Any time you hit a total card value of 21, you win! 
Any time you go over 21 you lose. In either case, once a game is done, 
immediately start again with the next card, and repeat until there are no cards left.
It's important to note while playing you can consider aces to be 11 or 1 at any time, 
while 2 to 10 have their face value and Jack, Queen and King are worth 10.
\

inputs:"3 A K 9 A 7 4 9";
dict:`1`2`3`4`5`6`7`8`9`10`J`Q`K`A!(enlist 1;enlist 2;enlist 3;enlist 4;enlist 5;enlist 6;enlist 7;enlist 8;enlist 9;enlist 10;enlist 10;enlist 10;enlist 10; 1 11);

inputs:`$(" " vs inputs);
/+ collector
winN:0;

handSum:enlist each dict[inputs[0]];
loc:1;
tempCnt:2;
while[loc<count inputs;
	card:inputs[loc];
	handSum:tempCnt cut raze raze handSum,\:/:dict[card];
	curSum:sum(flip handSum);
	if[any(curSum=21);winN+:1;handSum:enlist each dict[inputs[loc+1]];loc+:1;tempCny:1];
	if[all(curSum>21);handSum:enlist each dict[inputs[loc+1]];loc+:1;tempCnt:1];
	loc+:1;tempCnt+:1;]
show winN;


/get cumulative sums of the card values (counting ace as 1) and the number of aces
/also get the cumulative sums+11 and 21
/along the lines of an aj but using binr instead of bin, find the indices where the sum has increased by at least 11 (ei) and at least 21 (ti)
/it is a win if the sum at ti = 21+sum at i, or (sum at ei=11+sum at i) and ace count has increased by ei, since that ace could now be counted as high
/depending on the type of win, tw or ew, put in the column ni the index where the game starting from that row would end
/starting from 0, get the indices where each game starts by iteratively indexing into ni
count the wins there are from those games

{tw:pt=s ti:s binr pt:21+s:0,sums b:d x;w:tw|ew:(a[ei]>a:0i,sums 1=b)&pe=s ei:s binr pe:11+s;sum w@?[ew;ei;ti]\[0]}
	
