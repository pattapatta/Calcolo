
f1 = inline("sqrt(x.^2+1)-x");
f2 = inline("x.*sqrt(x.^2+1)-x.^2");
f3 = inline("x./(sqrt(x.^2+1)+x)");

x = 1:2:1000;

y1 = f1(x);
y2 = f2(x);
y3 = f3(x);


subplot(3,1,1)
  plot(x,y1,'linewidth',2);
  title("sqrt(x.^2+1)-x");
  grid on
subplot(3,1,2)
  plot(x,y2,'linewidth',2);
  title("x.*sqrt(x.^2+1)-x.^2")
  grid on
subplot(3,1,3)
  plot(x,y3,'linewidth',2);
  title("x./(sqrt(x.^2+1)+x)")
  grid on

