 %months = { 'G','F','M','A','M','J','L','A','S','O','N','D'}
 %set(gca,'XtickLabel',months)
 x=1:12;
 y=[12.51, 13.05, 11.7, 9.26, 8.3, 6.25, 5.34, 4.59, 5.14, 6.36, 10.31, 13.88]


 xx=linspace(1,12,1200);


 % spline lineare  
 % se il campo " metodo " viene omesso di default viene usata
 %  l'interpolazione lineare, ovvero le spline lineari
 
 yyl = interp1(x,y,xx);


 % interpolazione polinomiale
 % comando polifit

 coeff_yyp = polyfit(x,y,11);
 yyp = polyval(coeff_yyp,xx);

 % spline cubica
 
 yyc = interp1(x,y,xx,'spline');

 
 % plotting

 plot(x,y,'linewidth',2,'o',xx,yyl,'linewidth',2,'g',xx,yyp,'linewidth',2,'b',xx,yyc,'linewidth',2,'r');
 grid minor
 set(gca,'Xtick',1:12,'XTickLabel',{ 'G','F','M','A','M','J','L','A','S','O','N','D'})

 ylabel("Portata [m^3/sec]");
 xlabel("Months");
 title("Confronto calcolo della portata tramite tre metodi di interpolazione");

 legend(" Nodi "," interpolazione lineare a tratti "," interpolazione polinomiale "," interpolazione cubica a tratti ",'location','northwest');


