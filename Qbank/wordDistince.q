dat:"I"$" " vs 'read0 `:/home/sdu/Qnight/practice/bingorow.txt;
/+ dat:enlist 10 5 21 45 53 70 66 4;
bingoBoard:(6  17 34 50 68;10 21 45 53 66;5  25 36 52 69;14 30 33 54 63;15 23 41 51 62);
loc:til 5;
diag:enlist {bingoBoard[x;x]} each loc;
diag,:enlist {bingoBoard[4-x;x]} each loc;
bingoWin:(bingoBoard,flip bingoBoard), diag;

ans,:{[row] 5+min where 1={[n;row] :any({[x;n;row]all x in row[til n]}[;n;row] each bingoWin);}[;row] each 5+til -5+(count row)} each dat;


/kdb solution
/find the location of the board values in the input list, and index in to pull out the winning line combinations
/Each column represents the position of that winning line - the maximum value is the amount of inputs it took to complete the line, and the minimum value is the quickest winning line

/note 'a' is the board matrix, loaded however is convenient
c:(flip t[;0]+/:(reverse t 0;t 0)),'flip[t],'t:5 5#til 25

g:{1+min max(x?raze a)c};

g each value each read0`:input;