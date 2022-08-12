/
The way Elo works is by comparing the expected win rate of two head-to-head competitors,
calculated for player a with:
Ea = 1 / (1 + 10^((Rb-Ra)/400))

Ra and Rb are the ratings of teams a and b - which start at 1200 and are modified with:
Ri' = Ri + 20(1-Ei)

where Ri is the old ranking, and Ri' is the updated ranking for the winning team - 20(1-Ei)
is the amount of points the winner gains and the loser loses.
For example, if Ra is 1400 and Rb is 1200, a has an expected win rate of around 0.75 over b,
and if a wins, Ra gains, and Rb loses, about 5 points each.
Conversely if b wins, b gains and a loses 15 points.
\

t:("SSS";enlist",")0:`:/home/sdu/Qnight/practice/matches.csv
t: select winner:@'[teams;winLoc],loser:@'[teams;1-winLoc] from update teams:(h,'a), winLoc:{where (max x)=x}each tempS from update tempS:{"J"$"-" vs string x}each score from t;

allTeams:distinct ((exec distinct winner from t),(exec distinct loser from t));

raBook:allTeams ! ((count allTeams)#1200f);

prcsRec:{[rr]
rWin:raBook[rr[`winner]];
rLos:raBook[rr[`loser]];
Ei:1%(1 + 10 xexp ((rWin-rLos)%400));
delRs:-20*(1-Ei);
raBook[rr[`winner]] +: delRs;
raBook[rr[`loser]] -: delRs}

prcsRec each t;
show max raBook;
show min raBook;

/+ KDB solution
/Simplest implementation of the Elo formula
/Significant speed advantage from pre-initialising dictionary keys before doing the iterative update
{@[x;y,z;+;1 -1*20*1-1%1+10 xexp(x[z]-x y)%400]}/[(!/)flip(distinct raze t`h`a),'1200f]. t@'/:(`a`h;`h`a)@\:{x[0]=max x}("JJ";"-")0:(t:("SS*";1#csv)0:x)`score}