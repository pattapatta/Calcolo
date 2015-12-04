
% 1
 
r1 = 5
r1 =  5
V1 = 4/3*pi*r1^2 
V1 =  104.72
V2 =V1+(30/100)*V1
V2 =  136.14
r2 = ((V2/pi)*(3/4))^1/3
r2 =  10.833



% 2

ex = inline(" 1+x ");
ex2 = inline(" 1+x+(x^2)/2 ");
% errore assoluto
ea1 = abs(e^(0.1)-ex(0.1))
ea1 =  0.0051709
ea2 = abs(e^(0.1)-ex2(0.1))
ea2 =    1.7092e-04
% errore relativo
er1 = (abs(e^(0.1)-ex(0.1)))/e^(0.1)
er1 =  0.0046788
er2 = (abs(e^(0.1)-ex2(0.1)))/e^(0.1)
er2 =    1.5465e-04


% 3

% Radici di un polinomio
% uso il vettore dei coefficienti
p1 = [ 2 -4 -1 ];
p2 = [ 1 0 2 0 -3 ];
p3 = [ 1 0 0 2197];
s1 = roots(p1)
s1 =

   2.22474
  -0.22474

s2 = roots(p2)
s2 =

  -0.00000 + 1.73205i
  -0.00000 - 1.73205i
  -1.00000 + 0.00000i
   1.00000 + 0.00000i

s3 = roots(p3)
s3 =

  -13.0000 +  0.0000i
    6.5000 + 11.2583i
    6.5000 - 11.2583i


% 4

% 5



% 5



