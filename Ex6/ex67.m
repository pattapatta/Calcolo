
f = inline("sin(x) + log(x) -1 ");
x = [1.5, 4, 5, 5.5, 8];
y = f(x);

xx = linspace(1,9,1000);

c = polyfit(x,y,4);

yy = polyval(c,xx);

y_ex = f(xx);


err = abs(y_ex-yy);


subplot(2,1,1)
plot(x,y,'linewidth',3,'o',xx,y_ex,'linewidth',2,'r', xx,yy,'linewidth',2,'b');
legend(" Nodi ", " sin(x) + log(x) -1 ", " Polinomio di 4 grado ","location","northwest");
grid on
title(" Interpolazione di sin(x) + log(x) -1 mediante la funzione polyfit");

subplot(2,1,2)
plot(xx,err,'linewidth',2,'r');
title(" Errori Interpolatori ")
grid on

