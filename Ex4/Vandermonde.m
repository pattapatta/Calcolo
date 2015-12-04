

x10 = linspace(-1,1,10);
x15 = linspace(-1,1,15);
x20 = linspace(-1,1,20);

V10 = vander(x10);
V15 = vander(x15); 
V20 = vander(x20);

f = inline(" exp(x)+1 ");

% I bi sono i coefficienti della funzione calcolati nei nodi 
%   mi servono ad imporre le condizioni di interpolazione.
b10 = f(x10)';
b15 = f(x15)';
b20 = f(x20)';

% I sistemi sarebbero genericamente Vx = b, devo trovare x
%   che per comodità chiamerò a, il vettore dei coefficienti.


% Coefficienti del polinomio  
a10 = V10\b10;
a15 = V15\b15;
a20 = V20\b20;


eps = [];
for i=1:20
 eps = [ eps, (-1)^(i)*10^(-5) ];
endfor

b10_1 = b10 + eps([1:10])';
b15_1 = b15 + eps([1:15])';
b20_1 = b20 + eps([1:20])';


% Coefficienti polinomio perturbato
a10_1 = V10\b10_1;
a15_1 = V15\b15_1;
a20_1 = V20\b20_1;




% Ricordiamo che Un polinomio in Matlab `e dato da un vettore che contiene 
%   i sui coefficienti ordinati da an  fino ad a0.



a10 = fliplr(a10);
a15 = fliplr(a15);
a20 = fliplr(a20);
a10_1 = fliplr(a10_1);
a15_1 = fliplr(a15_1);
a20_1 = fliplr(a20_1);


% Uso x20 per valutare i polinomi 
y10 = polyval(a10,x20);
y15 = polyval(a15,x20);
y20= polyval(a20,x20);
y10_1 = polyval(a10_1,x20);
y15_1 = polyval(a15_1,x20);
y20_1 = polyval(a20_1,x20);



subplot(3,1,1)
 plot(x20,y10,'linewidth',2,'*',x20,y10_1,'linewidth',2,'g'); 
 grid on
 legend("Polinomio interpolante","Polinomio interpolante perturbato",'location','northwest');
 title("Polinomi di 10 grado");
subplot(3,1,2)
 plot(x20,y15,'linewidth',2,'*',x20,y15_1,'linewidth',2,'g'); 
 grid on
 legend("Polinomio interpolante","Polinomio interpolante perturbato",'location','northwest');
 title("Polinomi di 15 grado");
subplot(3,1,3)
 plot(x20,y20,'linewidth',2,'*',x20,y20_1,'linewidth',2,'g'); 
 grid on 
 legend("Polinomio interpolante","Polinomio interpolante perturbato",'location','northwest');
 title("Polinomi di 20 grado");

maxa10 = max(abs(a10 - a10_1));
maxa15 = max(abs(a15 - a15_1));
maxa20 = max(abs(a20 - a20_1));

t = linspace(-1,1,101);

pt10   = polyval(a10,t);
pt10_1 = polyval(a10_1,t);
pt15   = polyval(a15,t);
pt15_1 = polyval(a15_1,t);
pt20   = polyval(a20,t);
pt20_1 = polyval(a20_1,t);


maxp10 = max(abs(pt10-pt10_1)); 
maxp15 = max(abs(pt15-pt15_1));
maxp20 = max(abs(pt20-pt20_1));


