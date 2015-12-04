
function [ber]=bernstein(n,k)
  i=0;
  if k == 0
    coef=1 ;
  else
    coef=prod([1:n])/(prod([1:k])*prod([1:n-k]));
  end
  for t=0:0.01:1
    i=i+1;
    ber(i)=coef*t^k*(1-t)^(n-k);
  endfor
endfunction



n=4;

f = inline('sqrt(x+1)');
x = linspace(0,1,n);
y = f(x);

xx = 0:0.01:1;
yy = interp1(x,y,xx);

P = polyfit(x,f(x),3);
Pv = polyval(P,xx);

berValues = zeros(101, 1);
for i = 0:3
berValues = berValues + f(i/3).*bernstein(3,i)';
end


plot(xx,Pv,'linewidth',1.5,'k',xx,berValues,'linewidth',2,'r*',xx,yy,'linewidth',2,'g');
hold on
plot(x,y,'o','linewidth',2);
