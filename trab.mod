param nI; #nº de meses
set I := 1..nI; # conjunto de I's

set PROD;
set TRAB;

param Limit;
param mars {i in I,p in PROD}; #trata do mars por ano
param mercury {i in I,p in PROD}; #trata do mercurio por ano
param venus {i in I,p in PROD}; #trata de venus por ano
param d {t in TRAB,p in PROD};	#trata da parte da produçao


var x{i in I,p in PROD} >=0; #vai somar as marmeladas de mars
var x1{i in I,p in PROD} >=0; #vai somar as marmeladas de venus
var x2{i in I,p in PROD} >=0; #vai somar as marmeladas de mercury



#lucro
maximize revenue:
	sum {i in I} (sum { p in PROD} mars[i,p]*x[i,p] + sum { p in PROD} venus[i,p]*x1[i,p] +  sum { p in PROD} mercury[i,p]*x2[i,p] );

#restriçoes
LMars {i in I} : sum {p in PROD} x[i,p] <= Limit;
LMercury {i in I}: sum {p in PROD} x1[i,p] <= Limit;
LVenus {i in I}: sum {p in PROD} x2[i,p] <= Limit;
#maior marosca da minha vida
Cap {i in I,p in PROD, t in TRAB} :x[i,p]+x1[i,p]+x2[i,p]<=d[t,p];


solve;
printf "\n-----------------------------------------\n";
printf "\nExercício 1/2:\n";
printf "\nValor ótimo: %g\n", revenue;
printf "\n-----------------Mars:-------------------\n";
printf {i in I, p in PROD} "x[%d,%s] = %g\n", i, p, x[i,p];
printf "\n----------------Venus:--------------------\n";
printf {i in I, p in PROD} "x1[%d,%s] = %g\n", i, p, x1[i,p];
printf "\n-----------------Mercury:--------------------\n";
printf {i in I, p in PROD} "x2[%d,%s] = %g\n", i, p, x2[i,p];
printf "\n-----------------------------------------\n";
end;


