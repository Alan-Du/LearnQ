/+ script to convert any string into html color
/+ set the string's non-hexadecimal characters to 0
/+ pad zero to string to make it length of multiple of 3
/+ split result into 3 equal sections and 
/+ take the first 2 digits of each are the hex components

/+ my solution
hexChar:"0123456789abcdef";
convertColorHtml:{[str]
	str:@[str; ind; :; (count ind:where not str in hexChar)#enlist "0"];
	while[(count str) mod 3; str; :"0"];
	:raze 2#((3;0N)#str);}
tsrt:"do you think that maybe like, 1 in 10 people could be actually robots?";

/+ solution
/+ construct comparitive list 'a' of hex values
/+ find appropriate matching values and null
/+ cut into 3 equal lengths using reshape
sol:{"0"^raze#[3 0N; #[c+(neg c:count r)mod 3]r:a (a:.Q.n,6#.Q.a)?x][;0 1]};