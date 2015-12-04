
a1=1:10;
c1=11:19;

A = diag(a1) + diag(c1,1) + diag(c1,-1);

% A deve essere tridiagonale
function [ B ] = tri_fact(A)

  n = size(A)(2);
  p = ones(1,n);
  q = ones(1,n-1);
  a = diag(A);
  c = diag(A,-1);

  p(1) = sqrt(a(1));

  for i=2:n
    q(i-1) = c(i-1)./p(i-1);
    p(i) = sqrt(a(i)-q(i-1).^2);
  endfor

  B = diag(p) + diag(q,-1);

endfunction

B = tri_fact(A);

A1 = B*B';

