dat:read0 `:/home/sdu/Qnight/practice/eledat.txt;
dat:"I"$" " vs 'dat;
flrDic:(til count dat)!dat;
stp:0;
cnt:1;
dir:1;
while[stp in key flrDic;
movs:flrDic[stp];
show (stp;movs);
if[movs[0]=0;dir*:-1];
  stp+:dir*movs[1];
cnt+:1;]
show cnt;

/ kdb solution

/Keep track of floor and direction in the state list being passed into the iteration
/Use an index into a list of directions to implement change, and index back into the floor list to move
{-1+count({(y+d*x[y]1;d:z*-1 1 x[y]0)}[flip("JJ";" ")0:`bounce.csv].)\[x,1]}