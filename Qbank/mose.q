/
The Morse code alphabet looks like this:
a| .-
b| -...
c| -.-.
d| -..
e| .
f| ..-.
g| --.
h| ....
i| ..
j| .---
k| -.-
l| .-..
m| --
n| -.
o| ---
p| .--.
q| --.-
r| .-.
s| ...
t| -
u| ..-
v| ...-
w| .--
x| -..-
y| -.--
z| --..
A dot is one "unit" long, and a dash is three units. 
Each element of a letter has a single unit between dots and dashes. 
The letter "r" (".-.") for example will be 7 elements long - one unit for each dot, 
one for the space between the dot and the dash, 
another for the space between the dash and dot, and three for the dash. 
The space between adjacent letters is three units (with no other additional spacing needed) 
and the space between words is seven units.
\



/ kdb solution
/build dictionary of unit times and spacings
d:.Q.a!(0 1;1 0 0 0;1 0 1 0;1 0 0;1#0;0 0 1 0;1 1 0;0 0 0 0;0 0;0 1 1 1;1 0 1;0 1 0 0;1 1;1 0;1 1 1;0 1 1 0;1 1 0 1;0 1 0;0 0 0;1#1;0 0 1;0 0 0 1;0 1 1;1 0 0 1;1 0 1 1;1 1 0 0)

/odd-numbered indices represent spacings, identify the unique spacings to avoid normaliseing the entire dataset
/cut on the appropriate spacings to get letters (find within d) and words (stitch together with sv)

f:{
  c:2 cut deltas x;
  u:asc distinct c[;1];
  " "sv(where 2=n w)cut d?cut[;u?c[;1]]w:where 0<n:u?c[;0]}

f [input]