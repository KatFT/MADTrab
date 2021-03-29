param nI; #nº de meses
set I := 1..nI; # conjunto de I's

set PROD;
set TRAB;

param Limit;
param mars {i in I,p in PROD}; #trata do mars por ano
param mercury {i in I,p in PROD}; #trata do mercurio por ano
param venus {i in I,p in PROD}; #trata de venus por ano
param d {t in TRAB,p in PROD};	#trata da parte da produçao
#param maxi = sum{t in TRAB,p in PROD} d[p,t];



var x{i in I,p in PROD} >=0; #vai somar as marmeladas a cada mes
var x1{i in I,p in PROD} >=0; #vai somar as marmeladas a cada mes
var x2{i in I,p in PROD} >=0; #vai somar as marmeladas a cada mes
var y{t in TRAB,p in PROD}>=0; #vai ser usada para a restriçao da produçao
var y1{t in TRAB,p in PROD}>=0; #vai ser usada para a restriçao da produçao
var y2{t in TRAB,p in PROD}>=0; #vai ser usada para a restriçao da produçao




#param hij{p in PROD,t in TRAB}:=  min{ii in D, jj in R} min(o[ii,jj], p[ii,jj]);

maximize revenue:
	sum {i in I} (sum { p in PROD} mars[i,p]*x[i,p] + sum { p in PROD} venus[i,p]*x1[i,p] +  sum { p in PROD} mercury[i,p]*x2[i,p] );

#restriçoes
LMars {i in I} : sum {p in PROD} x[i,p] <= Limit;
LMercury {i in I}: sum {p in PROD} x1[i,p] <= Limit;
LVenus {i in I}: sum {p in PROD} x2[i,p] <= Limit;
#maior marosca da minha vida
CapR {i in I,t in TRAB} :x[i,'R']+x1[i,'R']+x2[i,'R']<= min(d['Packing','R'],d['Cleaning','R'],d['Cooking','R']);
CapC {i in I,t in TRAB} :x[i,'C']+x1[i,'C']+x2[i,'C']<= min(d['Packing','C'],d['Cleaning','C'],d['Cooking','C']);
CapI {i in I,t in TRAB} :x[i,'I']+x1[i,'I']+x2[i,'I']<= min(d['Packing','I'],d['Cleaning','I'],d['Cooking','I']);





#por mes produçao r para cada planeta <= 




solve;
end;


