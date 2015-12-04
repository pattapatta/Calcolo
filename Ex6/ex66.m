
f = inline(" e.^-x ");

x = linspace(-3,3,9);

y = f(x);

% Polinomio di grado minimo

 cp = polyfit(x,y,8);

 xx = linspace(-3,3,1000);

% Valori del Polinomio
 
 yp = polyval(cp,xx);


% Ricerca dei Nodi di Chebychev


cheb = inline("1/2(-3+3) + 1/2(3+3)*cos((2*x-1)/(2*9))");

  xc = zeros(1,9);
  for i=1:9 
    xc(i) = 1/2*(-3+3)+1/2*(3+3).*(cos(((2.*i-1)./18).*pi));
  endfor 


yc = f(xc);

% Polinomio di grado minimo con
 Chebychev

 cc = polyfit(xc,yc,8);

% Valori del Polinomio di grado minimo 

 ypc = polyval(cc,xx);


% Errori

y_ex = f(xx);
err_pol  = abs(y_ex-yp);
err_cheb = abs(y_ex-ypc);


% Plotting
 
subplot(2,1,1)
  plot(x,y,'linewidth',2,'o',xx,yp,'linewidth',2,'r',xx,ypc,'linewidth',2,'g');
  legend("Nodi", "Interpolazione su nodi semplici", "Interpolazione su nodi di Chebychev");
grid on
title("Confronto di polinomi interpolatori su nodi equispaziati e su nodi di Chebychev","location","
f = inline(" e.^-x ");

x = linspace(-3,3,9);

y = f(x);

% Polinomio di grado minimo

 cp = polyfit(x,y,8);

 xx = linspace(-3,3,1000);

% Valori del Polinomio
 
 yp = polyval(cp,xx);


% Ricerca dei Nodi di Chebychev


cheb = inline("1/2(-3+3) + 1/2(3+3)*cos((2*x-1)/(2*9))");

  xc = zeros(1,9);
  for i=1:9 
    xc(i) = 1/2*(-3+3)+1/2*(3+3).*(cos(((2.*i-1)./18).*pi));
  endfor 


yc = f(xc);

% Polinomio di grado minimo con
 Chebychev

 cc = polyfit(xc,yc,8);

% Valori del Polinomio di grado minimo 

 ypc = polyval(cc,xx);


% Errori

y_ex = f(xx);
err_pol  = abs(y_ex-yp);
err_cheb = abs(y_ex-ypc);


% Plotting
 
subplot(2,1,1)
  plot(x,y,'linewidth',2,'o',xx,yp,'linewidth',2,'r',xx,ypc,'linewidth',2,'g');
  legend("Nodi", "Interpolazione su nodi semplici", "Interpolazione su nodi di Chebychev",'location','east');
grid on
title("Confronto di polinomi interpolatori su nodi equispaziati e su nodi di Chebychev");

subplot(2,1,2)
  plot(xx,err_pol,'linewidth',2,'r',xx,err_cheb,'linewidth',2,'g');
  legend("Errori interpolazione nodi semplici","Errore interpolazione nodi di Chebychev");
grid on
title("Errori interpolatori");

