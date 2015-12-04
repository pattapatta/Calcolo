
n=4;

f = inline('sqrt(x+1)');
x = linspace(0,1,n);
y = f(x);

xx = 0:0.01:1;
yy = interp1(x,y,xx);


function [ber]=bernstein(n,k)
  i=0;
  if k == 0
    coef=1 ;
  else
    coef=prod([1:n])/(prod([1:k])*prod([1:n-k]));
  end
  for t=0:1/n:1
    i=i+1;
    ber(i)=coef*t^k*(1-t)^(n-k);
  endfor
endfunction

berValues = zeros(101, 1);
for i = 0:3
berValues = berValues + f(i/3).*bernstein(i,3)';
end


for k=1:n+1
 B(k,:) = bernstein(n,k-1);
endfor

Ber = zeros(1,5);
for j=1:5
  for i=1:5
    Ber(j) = Ber(j) + y(j)*B(i,j);
  endfor
endfor
