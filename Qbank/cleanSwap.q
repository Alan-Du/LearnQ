/+ clean swap graph problem
/+ each time more next row and can choose to move
/+ right or left by one location
/+ get the max of values collected possible

inputs: {"I"$" "vs x} each read0 `:/home/sdu/Qnight/practice/mapInput.txt;

N:count inputs;
wide:count inputs[0];
dirs:-1 0 1;
stepN:5;

loopAll:{[sLoc]
disNxtStep:enlist sLoc;
ansDict:(til (wide-(stepN-1)))!(wide-(stepN-1))#0;
ansDict[sLoc]:ansDict[sLoc]+(sum inputs[0][sLoc+til stepN]);
rowN:1;
while[rowN<N;
lcls:raze disNxtStep,\:/:dirs;
lcls:temp where ((min each temp)>=0)&((max each temp:sums each lcls)<=wide-stepN);
ans:{[x; rowN;ansDict] ansDict[(first x)]+sum inputs[rowN][(last x)+til stepN]}[;rowN;ansDict] each lcls;
tt:{[x;y;nxtStep] :max (y where nxtStep=x)}[;ans;nxtStep] each disNxtStep:distinct nxtStep:last each lcls;
ansDict[disNxtStep]:tt;
rowN+:1;];
:max ansDict;}

show max loopAll each til 16;

/+ KDB solution

/Reduce input matrix to possible combinations of the [x] wide input width
/Iterate through one row at a time, get sums of current row and possible shift of previous row
/Check the max value that could end up in each point, max at each point is running max
/Run to bottom - max of this is maximum possible value without tracing the path
/+ {max{z+max y x}[til[t+1]-/:-1 0 1]/[flip s[(),x-1],(x _s)-(s:sums flip y)til t:count[y 0]-x]}
