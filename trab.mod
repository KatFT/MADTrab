param nI; #nº de meses
set I := 1..nI; # conjunto de I's

set PROD;
set TRAB;

param Limit;
param mars {i in I,p in PROD}; #trata do mars por ano
param mercury {i in I,p in PROD}; #trata do mercurio por ano
param venus {i in I,p in PROD}; #trata de venus por ano
param d {p in PROD,t in TRAB};	#trata da parte da produçao
#param maxi = sum{t in TRAB,p in PROD} d[p,t];



var x{i in I,p in PROD} >=0; #vai somar as marmeladas a cada mes
var x1{i in I,p in PROD} >=0; #vai somar as marmeladas a cada mes
var x2{i in I,p in PROD} >=0; #vai somar as marmeladas a cada mes
var y{p in PROD,t in TRAB}>=0; #vai ser usada para a restriçao da produçao



#param hij{p in PROD,t in TRAB}:=  min{ii in D, jj in R} min(o[ii,jj], p[ii,jj]);

maximize revenue:
	sum {i in I} (sum { p in PROD} mars[i,p]*x[i,p] + sum { p in PROD} venus[i,p]*x1[i,p] +  sum { p in PROD} mercury[i,p]*x2[i,p] );

#restriçoes
LMars {i in I} : sum {p in PROD} x[i,p] <= Limit;
LMercury {i in I}: sum {p in PROD} x1[i,p] <= Limit;
LVenus {i in I}: sum {p in PROD} x2[i,p] <= Limit;

#CapR {p in PROD,t in TRAB} :(sum {i in I} mars[i,p]+sum {i in I} mercury[i,p]+sum {i in I} venus[i,p])*y[p,t]<= 0;
#CapC {i in I} :sum {p in PROD} mars[i,p]+sum {p in PROD} mercury[i,p]+sum {p in PROD} venus[i,p]<= ;
#CapI {i in I} :sum {p in PROD} mars[i,p]+sum {p in PROD} mercury[i,p]+sum {p in PROD} venus[i,p]<= ;






#por mes produçao r para cada planeta <= 




solve;
end;


