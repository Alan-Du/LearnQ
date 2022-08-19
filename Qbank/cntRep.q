/ count most repeated elements substring

allstr: read0 `:/allste.txt;
cntStr:{[istr]
	N:count istr;
	comb:raze (1+til `int$(N%2)),\:/:til `int$(N%2);
	cnts:{[x;istr] count where 0=differ cut[x[0];x[1]_istr]}[;istr] each comb;
	:1+max cnts;}
show sum cntStr each allstr;