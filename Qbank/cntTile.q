/
want to count total area of tiles if
they can overlap somehow, discard those
that none overlapping with others 
\
dat:("IIII"; enlist ",") 0:`:/home/tiles.txt
N:max (max dat`lx;max dat`ux);
M:max (max dat`ly;max dat`uy);

board:(til N) cross (til M);

isOverlap:{[R1;R2]
	$[(R1[`lx]>R2[`ux])|(R1[`ux]<=R2[`lx])|(R1[`uy]<=R2[`ly])|(R1[`ly]>=R2[`uy]); :0; :1];}
checkLoop:{[row]
	ans:enlist 0;
	ans,:isOVerlap[row;] each dat;
	$[(sum ans)>1; :1; :0];}
inds,:checkLoop each dat;
dat:dat[where 1=inds];

/ make sure point indie square
isInside:{[pnt;row]
	$[(pnt[0]>=row[`lx])&(pnt[0]<row[`ux])&(pnt[1]>=row[`ly])&(pnt[1]<row[`uy]); :1; :0];}

checkOver:{[pnt]
	ins:enlist 0;
	ins,: isInside[pnt;] each dat;
	$[any ins; :1; :0];}
ans,:checkOver each board;
show sum ans;