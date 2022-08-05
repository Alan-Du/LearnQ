/
We'll define shame as days on a goalless streak - any national team 
who plays an international game and finishes without scoring is in 
a state of shame, starting that day. The shame ends the day they score 
a goal in another international game.
\

data:select date,home_team,away_team,home_score,away_score from data:("DSSIISSSS";enlsit ",") 0:`path
scoreData:`date xasc (select date,team:home_taem,score:home_score from data),(select date,team:away_taem,score:away_score from data);

allTm:exec distinct team from scoreData;
callShame:{[tm]
	tt:select from scoreData where team=tm;
	zeroData:select team,sDate:date from tt where score=0;
	eDateLi:enlist 1000.01.01;
	eDateLi,:{[tbl;sDate] $[0Nd=eDate:exec first date from tbl where date>sDate,score>0;:sDate;eDate];}[tt;]each zeroDate`sDate;
	eDateLi:1_eDateLi;
	zeroDate:update diff:eDate-sDate from (update eDate:eDateLi from zeroDate);
	:first select from zeroDate where diff=max diff;}
show select from (shaeTB,:calShame each allTm) where diff=max diff;


/Flatten the input csv so there's no home-away distinction
/Calculate the biggest difference where there has been no change and the score is zero
/Key function is 'differ', and in-table operations

f:{" "sv string get first select t,d,e from
  (update a:next deltas d,e:next d from 
  raze[r g@'(where@differ@)@'(0=r`x)g:get 
  group exec t from r:`d xasc(select d,t:h,x from t),select d,t:a,x:y from 
  t:1 _flip`d`h`a`x`y!("DSSII";",")0:x])
  where x=0,a=max a}