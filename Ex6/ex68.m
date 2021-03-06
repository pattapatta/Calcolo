
f = inline("1./(1+25*x.^2)");

x9 = linspace(-1,1,9);
x10 = linspace(-1,1,10);
x11 = linspace(-1,1,11);
x12 = linspace(-1,1,12);

y9 = f(x9);
y10 = f(x10);
y11 = f(x11);
y12 = f(x12);


c9 = polyfit(x9,y9,8);
c10 = polyfit(x9,y9,9);
c11 = polyfit(x9,y9,10);
c12 = polyfit(x9,y9,11);

xx = linspace(-1,1,1000);

y_ex = f(xx);
yp9 = polyval(c9,xx);
yp10 = polyval(c10,xx);
yp11 = polyval(c11,xx);
yp12 = polyval(c12,xx);

'linewidth',1,
plot(xx,y_ex,'linewidth',1,'r',xx,yp9,'linewidth',1.5,'g',xx,yp10,'linewidth',1,'y',xx,yp11,'linewidth',1.5,'m',xx,yp12,'linewidth',1,'b');
legend(" Funzione di Runge Esatta ", " Polinomio di 9 grado ", " Polinomio di 10 grado ", " Polinomio di 11 grado ", " Polinomio di 12 grado ","location","south");
grid on
title(" Approssimazione della funzione di Runge mediante polinomi interpolatori di grado 9,10,11,12");
%title("Andamento dei polinomi interpolanti la funzione di Runge al crescere del grado")
