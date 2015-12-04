function X = lp_root(alpha)

  b = (1+10^(2*alpha))/10^alpha;
  t1 = (b + sqrt(b^2-4))/2;
  t2 = (b - sqrt(b^2-4))/2;

  x1 = -sqrt(t1);
  x2 = -sqrt(t2);
  x3 =  sqrt(t1);
  x4 =  sqrt(t2);

  X = [ x1, x2, x3, x4 ];

endfunction


A = [];

for i=1:10
  A = [ A ; lp_root(i) ];
endfor


B = [];

for i=1:10
  B = [ B ; roots([ 1, 0, -((1+10^(2*i))/10^i), 0, 1])' ];
endfor


for i=1:10
  A(i,:) = sort(A(i,:));
  B(i,:) = sort(B(i,:));
endfor

E1 = abs(A-B)./A;
E2 = abs(A-B)./B;

