param nI; #nº de meses
set I := 1..nI; # conjunto de I's

set PROD;
set TRAB;

param Limit;
param mars {i in I,p in PROD}>=0; #trata do mars por ano
param mercury {i in I,p in PROD}>=0; #trata do mercurio por ano
param venus {i in I,p in PROD}>=0; #trata de venus por ano
param d {p in PROD,t in TRAB}>=0;	#trata da parte da produçao


var x{i in I, p in PROD} >=0; #vai somar as marmeladas a cada mes
var y{p in PROD, t in TRAB}>=0; #vai ser usada para a restriçao da produçao


#param hij{p in PROD,t in TRAB}:=  min{ii in D, jj in R} min(o[ii,jj], p[ii,jj]);

maximize revenue:
	sum {i in I} (sum { p in PROD} mars[i,p]*venus[i,p]*mercury[i,p]*x[i,p]);

#restriçoes
LMars {i in I} : sum {p in PROD} mars[i,p]*x[i,p] <= Limit;
LMercury {i in I}: sum {p in PROD} mercury[i,p]*x[i,p] <= Limit;
LVenus {i in I}: sum {p in PROD} venus[i,p]*x[i,p] <= Limit;





solve;
end;


