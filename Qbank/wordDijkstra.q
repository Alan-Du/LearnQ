/+ Compute the smallest cost from Tupac to Diddy
/+ standard Dijkstra's algorithm!
data:("SSI"; enlist ",") 0: `:/home/sdu/Qnight/practice/costGP.txt;
src:`$"TUPAC";
tgt:`$"DIDDY";

ans:();
allName:raze (data`s;data`d);
allName:distinct (allName where not allName=src);

unvisited:allName!(count allName)#0;


tempDis:(enlist src)!(enlist 0);

iDict:(enlist src)!(enlist 0);

curNode:src;
curDis:0;

while[(0<count unvisited) and (not tgt in key tempDis);
/+ always pick unvisited ones with smallest distince
nxt:flip select d,c+curDis from data where s=curNode, d in key unvisited;
nxtDict:nxt[`d]!nxt[`c];
tempDis+:nxtDict;
if[curNode in key unvisited; unvisited:curNode _ unvisited;];
tempDis:curNode _ tempDis;
/+ always pick the smallest one to run
curDis: min valss:value tempDis;
curNode:first (key tempDis) where valss=curDis;]

show (tempDis;tempDis[tgt]);

/+ kdb solution

/This is a standard Dijkstra's algorithm

f:{
  m:exec d!c by s from n:("SSJ";(),",")0:x;
  u:@[(distinct[raze n`d`s]!()):\:0W;y;:;0];
  ({((k,where z<0W)_ y&v+x k;z,((),k:y?v:min y)#y)}[m].)/[(u;()!())][1;z]
  }

/build a list of all unvisited nodes, set distance to zero
/start exploring from source node, and write in the tentative distance to all other nodes
/move onto the nearest node, and repeat, marking previous node as visited
/only travel to unvisited nodes until complete or destination found