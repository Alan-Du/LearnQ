/
on one day you can get 100 of both milk and cereal
milk always expires on 5th day after that morning breakfast,
you can use cereal as soon as you get it if you already have milk
\

dat:("DII"; enlist ",") 0:`:/buytime.txt;

milk:()!();
milk[first dat][`date]-5]:0;
cereal:0;

cleanMilk:{[dt]
	/+ get rid of expired milk
	dtli:key milk;
	badDt:dtli where dtli<=(dt-5);
	if[(count badDt)>0; milk::badDt _ milk;];}
loc:0;
while[loc<(count dat);
	dt:dat[loc][`date];
	mlk:dat[loc][`milk];
	crl:dat[loc][`cereal];
	/+ update cereal milk
	cereal+:crl;
	if[(cereal>=100)&((sum value milk)>100); cereal-:100; minDt:where milk=min milk; milk[minDt]-:100;];
	if[mlk>0;mild[dt]:mlk]];
	cleanMilk[dt];
	loc+:1;]
show (dt;milk;cereal)