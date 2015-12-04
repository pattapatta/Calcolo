color = ['r','b','g','y','m','c'];

%%% Valuta i polinomi di Bernstein  per t in [0,1] noti k e n  %%%%

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


%%% Bnk per k =1:n fissato n %%%

n=6;

for k=1:n
 B(k,:) = bernstein(n,k);
endfor


x = 0:0.01:1;


for i=1:n
 plot(x,B(i,:),'linewidth',2,color(i))
 legend([" m = " num2str(i)])
 grid on
 hold on
endfor
title(" Polinomi di Bernstein per k da 1 a 6 ");
hold off
legend("m=1","m=2","m=3","m=4","m=5","m=6")

figure 2
for i=1:n
 subplot(2,3,i)
 plot(x,B(i,:),'linewidth',2,color(i))
 grid on
 title([ "Polinomio di Bernstein per k = " num2str(i) ]);
endfor







%%%%%%%%%%%%%%%%%%%%%%
%%% SECONDA PARTE %%%%
%%%%%%%%%%%%%%%%%%%%%%






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

figure 3
plot(xx,Pv,'linewidth',1.5,'k',xx,berValues,'linewidth',2,'r*',xx,yy,'linewidth',2,'g',x,y,'o','linewidth',2);
legend('Interpolazione Polinomiale','Interpolazione di Bernstein','Interpolazione con spline lineare','Nodi di passaggio')
grid on
