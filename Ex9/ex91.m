
%%%%%%%%%%%%%%%%%%%%%%
%%% SECONDA PARTE %%%%
%%%%%%%%%%%%%%%%%%%%%%

clear
clc


n=4;

f = inline('sqrt(x+1)');
x = linspace(0,1,n);
y = f(x);

xx = 0:0.01:1;
yy = interp1(x,y,xx);

berValues = zeros(101, 1);
for i = 0:3
  berValues(i) = berValues + f(i/3).*bernstein(i,3)';
end


plot(xx,berValues,'linewidth',2,'ro');
hold on
plot(xx,yy,'linewidth',2,'g');

