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
var y{t in TRAB,p in PROD}>=0; #vai ser usada para a restriçao da produçao 
var y1{t in TRAB,p in PROD}>=0; #vai ser usada para a restriçao da produçao
var y2{t in TRAB,p in PROD}>=0; #vai ser usada para a restriçao da produçao


#lucro
maximize revenue:
	sum {i in I} (sum { p in PROD} mars[i,p]*x[i,p] + sum { p in PROD} venus[i,p]*x1[i,p] +  sum { p in PROD} mercury[i,p]*x2[i,p] );

#restriçoes
LMars {i in I} : sum {p in PROD} x[i,p] <= Limit;
LMercury {i in I}: sum {p in PROD} x1[i,p] <= Limit;
LVenus {i in I}: sum {p in PROD} x2[i,p] <= Limit;
#maior marosca da minha vida
CapR {i in I} :x[i,'R']+x1[i,'R']+x2[i,'R']<= min(d['Packing','R'],d['Cleaning','R'],d['Cooking','R']);
CapC {i in I} :x[i,'C']+x1[i,'C']+x2[i,'C']<= min(d['Packing','C'],d['Cleaning','C'],d['Cooking','C']);
CapI {i in I} :x[i,'I']+x1[i,'I']+x2[i,'I']<= min(d['Packing','I'],d['Cleaning','I'],d['Cooking','I']);

solve;
printf "\n-----------------------------------------\n";
printf "\nExercício 1:\n";
printf "\nValor ótimo: %g\n", revenue;
printf "\n-----Mars:-----\n\n";
printf {i in I, p in PROD} "x[%d,%s] = %g\n", i, p, x[i,p];
printf {i in I, p in PROD} "mars[%d,%s] = %g\n", i, p, mars[i,p];
printf "\n-----Venus:-----\n\n";
printf {i in I, p in PROD} "x1[%d,%s] = %g\n", i, p, x1[i,p];
printf {i in I, p in PROD} "venus[%d,%s] = %g\n", i, p, venus[i,p];
printf "\n-----Mercury:-----\n\n";
printf {i in I, p in PROD} "x2[%d,%s] = %g\n", i, p, x2[i,p];
printf {i in I, p in PROD} "mercury[%d,%s] = %g\n", i, p, mercury[i,p];



printf "\n-----------------------------------------\n";


#printf {i in I} "LMars[%d] = %g [dual: %g]\n", i, LMars[i], LMars[i].dual;
printf "\nExercício 2:\n\n";
printf {i in I} "Dual do LMars[%d] = %g\n", i,LMars[i].dual;
printf "\n----------\n\n";
printf {i in I} "Dual do LMercury[%d] = %g\n", i,LMercury[i].dual;
printf "\n----------\n\n";
printf {i in I} "Dual do LVenus[%d] = %g\n", i,LVenus[i].dual;
printf "\n----------\n\n";
printf {i in I} "Dual do CapR[%d] = %g\n", i,CapR[i].dual;
printf "\n----------\n\n";
printf {i in I} "Dual do CapC[%d] = %g\n", i,CapC[i].dual;
printf "\n----------\n\n";
printf {i in I} "Dual do CapI[%d] = %g\n", i,CapI[i].dual;

printf "\n-----------------------------------------\n";




end;


