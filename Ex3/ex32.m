f1 = inline (" ((x+1).^2 -1)./x ");
f2 = inline (" x+2 ");

x = 1:-0.001:0;

y1 = f1(x);
y2 = f2(x);

subplot(2,1,1) 
  plot(x,y1,'linewidth',2);
  title(" ((x+1)^2 -1 )/x ");
  grid on
subplot(2,1,2)
  plot(x,y2,'linewidth',2);
  title(" x+2 ")
  grid on
