a = ones(1,8)
A = [];
for b= 1:8
 A(b,:) = b*a;
endfor

S = triu(A)
L = tril(A)

for i=1:size(S)
  S(i,i) = 0;
  L(i,i) = 1;
endfor

d0 = diag(A);
d1 = diag(A,1);
d_1 = diag(A,-1);

B1 = diag(d0) + diag(d1,1) + diag(d_1,-1);
B2 = diag(d0) + diag(d1,1);
B3 = diag(d0) + diag(d_1,-1);


