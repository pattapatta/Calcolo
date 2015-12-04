
t = 1:6;
y = [ 0.5,0.8,0.7,0.3,0.1,0.4 ]

f = inline(' 1 + sin(2*pi*x/6) + cos(2*pi*x/6) ');


A = [];
for i=1:6
  A = [ A ; [ 1, sin(2*pi*i/6), cos(2*pi*i/6) ] ];
endfor

a = A\y';

a = fliplr(a);

p = polyval(a,t);

A

