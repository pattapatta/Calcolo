
f1 = inline("(1+1./x).^x");
f2 = inline("(4*n)./(n+2)");
f3 = inline("log(1+sqrt(n./(n+1)))");

x = 1:2:1000;

y1 = f1(x);
y2 = f2(x);
y3 = f3(x);

n = size(x);

err1 = abs(ones(1,n)*exp(1) - y1);
err2 = abs(ones(1,n)*4 - y2);
err3 = abs(ones(1,n)*log(2) -y3);

subplot(3,2,1)
  plot(x,y1,'linewidth',2);
  grid on
  title("(1+1./x).^x");

subplot(3,2,2)
  plot(x,err1,'linewidth',2);
  grid on
  title("Errore rispetto e^x");

subplot(3,2,3)
  plot(x,y2,'linewidth',2);
  grid on
  title("(4*n)./(n+2)");

subplot(3,2,4)
  plot(x,err2,'linewidth',2);
  grid on
  title("Errore rispetto a 4");

subplot(3,2,5)
  plot(x,y3,'linewidth',2);
  grid on
  title("log(1+sqrt(n./(n+1)))");

subplot(3,2,6)
  plot(x,err3,'linewidth',2);
  grid on
  title("Errore rispetto a 2");

