/+ calculate work chain of given word pair inside wordSpace
/+ for each word pair run a standard BFS's algorithm!
wordSpace:read0 `:/home/sdu/Qnight/practice/wordSpace.txt;
temp:group count each wordSpace;
wDic:(key temp)!(wordSpace value temp);

aPs:"," vs 'read0 `:/home/sdu/Qnight/practice/queryPair.txt;
/aPs:"," vs 'read0 `:/home/sdu/Qnight/practice/testPair.txt;

strDis:{[s1;s2] :sum not s1=s2;}

BFSfind:{[sStr; eStr]
show ("INPUTS:";sStr;eStr);
curDis:1;
curStr:enlist sStr;
visited:curStr;
unvisited: wDic[count sStr] except curStr;
while[not (eStr in visited);
curDis+:1;
nxtVisit:distinct raze {[x;y] y where 1=(strDis[x;] each y)}[;unvisited] each curStr;
unvisited: unvisited except nxtVisit;
visited,: nxtVisit;
curStr: nxtVisit;];
:curDis;}

ans:{[x] :BFSfind[x[0];x[1]];} each aPs;

prd ans

/kdb solution

/Input words set to "b"
/breadth-first search
/iterate over a list of checked words starting from the first input
/find those which are one character different which haven't already been checked
/add the new words as destinations from the source words in a dictionary
/repeat until you've reached your destination

f:{r:first{(;key n)y[0],n:raze{w!count[w:flip x[;where count[y]=1+sum y=x]]#enlist y}/:[flip x except key y 0;y 1]}[b where count'[b]=count x]/[{not x in key y 0}x;(e!enlist"";e:y,:)];
  -1_(r@)\[x]}