/+ given array of numbers drop all
/+ records between any two duplicates
/+ return the sum of residual
/+ example
/+ 1 4 5 2 4 7 2 6 3 6
/+ -> 1 4 7 2 6-> sum 20
/+ my solution
arr: 1 4 5 2 4 7 2 6 3 6
dropDup:{[arr]
	loc:0;
	while[loc<count (syms:distinct arr);
		if[(count (ind:where arr=syms[loc]))>1; arr:sublist[(0;first ind);arr,(last ind)_arr;];
 		loc+:1;];
	:sum arr;]}
dropDup[arr]

/+ solution
/+ return index of selected elements
/+ recursively search for elements in the reversed array

{-1_x{count[x]-y?x z}[x;reverse x]\[0]}