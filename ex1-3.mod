param nI; #nº de meses
set I := 1..nI; # meses do ano 1-12

#vamos buscar aos dados da tabela
set PROD; # R C I
set TRAB; #Cleaning Cooking Packing
set PLAT; #Venus Mars Mercury

param Limit;#para a restriçao q limita para 1000
param tabela {l in PLAT, p in PROD,i in I};#acesso a nossa tabela das vendas de marmelada
param producao {t in TRAB,p in PROD};	#trata da parte da produçao da marmelada

var vendeu{l in PLAT, p in PROD,i in I}>=0;#quantidade de marmeladas que conseguimos vender

#lucro
maximize lucro:
	sum {i in I,l in PLAT,p in PROD} (vendeu[l,p,i]*tabela[l,p,i]);


#restriçoes----------------------------------------
M_Mandados {i in I,l in PLAT} : sum {p in PROD} vendeu[l,p,i] <= Limit; #limite de marmelada por planeta

Cap {i in I,t in TRAB} :sum {p in PROD,l in PLAT} (vendeu[l,p,i]/producao[t,p]) <= 1;#divisao do tempo de produçao pelas marmeladas
#---------------------------------------------------

solve;
printf "\n-----------------------------------------\n";
printf "\nExercício 1/2/3:\n";
printf "\nValor ótimo: %g\n", lucro;
printf "\n-----------------------------------------\n";

printf {i in I, p in PROD,l in PLAT} "vendeu[%s,%s,%d] = %g\n", l, p,i, vendeu[l,p,i];

printf "\n-----------------------------------------\n";
end;


