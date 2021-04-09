param nI; #nº de meses
set I := 0..nI; # conjunto de I's q vai de 0 a 12
set B := 1..nI; #conjunto de B's q vai de 1 a 12
set PROD;
set TRAB;
set PLAT;

param pagarUni; #preço por unidade
param Limit;#para a restriçao q limita para 1000
param tabela {l in PLAT, p in PROD,i in B};#acesso a nossa tabela das vendas de marmelada
param producao {t in TRAB,p in PROD};	#trata da parte da produçao

var produzido{l in PLAT,p in PROD,i in B}>=0; #O QUE PODEMOS PRODUZIR

var vendeu{l in PLAT, p in PROD,i in B}>=0;#qnt e q podemos vender
var sobrou {i in I,p in PROD}>=0; #o que sobrou de cada tipo de marmelada

#lucro
maximize revenue :
	sum {i in B,l in PLAT,p in PROD} (vendeu[l,p,i]*tabela[l,p,i])-sum{i in B, p in PROD} sobrou[i,p]*pagarUni;

#restriçoes--------------------------#
#para a parte de acumular as marmeladas q sobraram
Caso_base {p in PROD}: sobrou[0,p]=0;
Stock_mes{i in B,p in PROD}: sobrou[i,p]=sum {l in PLAT} (produzido[l,p,i]-vendeu[l,p,i])+sobrou[i-1,p];

#capacidade mandada de marmeladas para cada planeta (qnt q posso vender)
M_Mandados {i in B,l in PLAT} : sum {p in PROD} vendeu[l,p,i] <= Limit;

#qnt q posso produzir

Cap {i in B, t in TRAB} :sum {l in PLAT,p in PROD} produzido[l,p,i]/producao[t,p]<=1;
#------------------------------------#

solve;
printf "\n-----------------------------------------\n";
printf "\nExercício 4:\n";
printf "\nValor ótimo: %g\n\n", revenue;
printf {i in B, p in PROD,l in PLAT} "produzido[%s,%s,%d] = %g\n",  l,p,i, produzido[l,p,i];
printf "\n-----------------------------------------\n";

printf {i in B, p in PROD,l in PLAT} "vendeu[%s,%s,%d] = %g\n", l, p,i, vendeu[l,p,i];
printf "\n-----------------------------------------\n";

printf {i in B, p in PROD} "sobrou[%d,%s] = %g\n", i,p, sobrou[i,p];

printf "\n-----------------------------------------\n";

end;


