

f = inline("sin(x) + log(x) -1 ");
xx = [1.5, 4, 5, 5.5, 8];
yy = f(xx);

p = zeros(5);


  % riempio la matrice da destra a sinistra dall'alto in basso
  %  curandomi di riempire ogni vettore di coefficienti con 
  %  una quantità di zeri pari al numero di colonne della matrice
  %  meno il numero di coefficienti
for i=1:5
  p(i,:) = [ zeros(1, 5-i)  polyfit(xx(1:i),yy(1:i),i-1)];
endfor



x = linspace(1,1000,1000);
y = zeros(5,1000);

for i=1:5
 y(i,:) = polyval(p(i,5-i+1:5),x);
endfor

figure 1
  plot(x,y(1,:),'r');
hold on  
  plot(x,y(2,:),'g');
  plot(x,y(3,:),'b');
  plot(x,y(4,:),'k');
  plot(x,y(5,:),'y');
