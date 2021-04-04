param nI; #nº de meses
set I := 1..nI; # conjunto de I's

set PROD;
set TRAB;
set PLAT;



param Limit;#para a restriçao q limita para 1000
param tabela {l in PLAT, p in PROD,i in I};#acesso a nossa tabela das vendas de marmelada
param producao {t in TRAB,p in PROD};	#trata da parte da produçao
#param mars {i in I,p in PROD}; #trata do mars por ano
#param mercury {i in I,p in PROD}; #trata do mercurio por ano
#param venus {i in I,p in PROD}; #trata de venus por ano
#param d {t in TRAB,p in PROD};	#trata da parte da produçao
#var produzido{l in PLAT, p in PROD,i in I}>=0; #O QUE PODEMOS PRODUZIR
var vendeu{l in PLAT, p in PROD,i in I}>=0;#qnt e q podemos vender

#var x{i in I,p in PROD} >=0; #vai somar as marmeladas de mars
#var x1{i in I,p in PROD} >=0; #vai somar as marmeladas de venus
#var x2{i in I,p in PROD} >=0; #vai somar as marmeladas de mercury



#lucro
maximize revenue:
	sum {i in I,l in PLAT,p in PROD} (vendeu[l,p,i]*tabela[l,p,i]);
#maximize revenue:
	#sum {i in I} (sum { p in PROD} mars[i,p]*x[i,p] + sum { p in PROD} venus[i,p]*x1[i,p] +  sum { p in PROD} mercury[i,p]*x2[i,p] );

#restriçoes
#LMars {i in I} : sum {p in PROD} x[i,p] <= Limit;
#LMercury {i in I}: sum {p in PROD} x1[i,p] <= Limit;
#LVenus {i in I}: sum {p in PROD} x2[i,p] <= Limit;
#maior marosca da minha vida
#Cap {i in I,p in PROD, t in TRAB} :x[i,p]+x1[i,p]+x2[i,p]<=d[t,p];
M_Mandados {i in I,l in PLAT} : sum {p in PROD} vendeu[l,p,i] <= Limit;

Cap {i in I,t in TRAB, p in PROD} :sum {l in PLAT} vendeu[l,p,i]<= producao[t,p];
solve;
printf "\n-----------------------------------------\n";
printf "\nExercício 1/2/3:\n";
printf "\nValor ótimo: %g\n", revenue;
printf "\n------------------------------------\n";

printf {i in I, p in PROD,l in PLAT} "vendeu[%s,%s,%d] = %g\n", l, p,i, vendeu[l,p,i];

printf "\n-----------------------------------------\n";
end;


