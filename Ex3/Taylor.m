

% e^x = 1 + x^2/2! + x^3/3! + ....
% Calcolare e^-9 stabilizzando la 6 cifra dopo la virgola


x1 = [];
x2 = [];

err = 10^-6;

my_e1 = 1;
x = -9;
i = 1;
while ( abs(e^-9 - my_e1) > err )
 my_e1 = my_e1 + x^i/factorial(i);
 i = i+1;
 x1 = [ x1 , my_e1 ];
endwhile

e2 = 1;
my_e2 = 1;
x = 9;
i = 1;
while ( abs(e^-9 - my_e2) > err )
  e2 = e2 + x^i/factorial(i);
  my_e2 = 1/e2;
  i = i+1;
  x2 = [ x2, my_e2 ];
endwhile 
 




% Calcolo degli errori relativi
%  Calcolati sulla somma dei primi n termini


err_rel1 = [];
for i=1:size(x1)(2)
  err_rel1 = [ err_rel1 , abs(x1(i) - exp(-9))/exp(-9) ];
endfor

err_rel2 = [];
for i=1:size(x2)(2)
  err_rel2 = [ err_rel2 , abs(x2(i) - exp(-9))/exp(-9) ]; 
endfor


a1 = 1:size(x1)(2);
a2 = 1:size(x2)(2);

subplot(2,1,1)
plot(a1,x1,'linewidth',2);
grid on
title("Calcolo dell'errore usando x=-9 nella serie");

subplot(2,1,2)
plot(a2,x2,'linewidth',2);
grid on
title("Calcolo dell'errore usando x=9 nella serie inversa");




