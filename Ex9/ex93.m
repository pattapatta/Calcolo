


m = 10; 
n = 10;


function [ I ] = trapezi(f,a,b,c,d)
 
  hx = b-a;
  hy = d-c;
  
  I = ((hx*hy)/4)*(f(a,c)+f(a,d)+f(b,c)+f(b,d));

endfunction

function [ I ] = trapezi_iterata(f,a,b,c,d,m,n)

  hx = (b-a)/n;
  hy = (d-c)/m;

  I = 0;
  for i=0:n-1
    for j=0:m-1

      I = I + trapezi(f, a+i*hx, a+(i+1)*hx, c+j*hy, c+(j+1)*hy);  
    endfor
  endfor

endfunction

f  = @(x,y) (1./(1+x+y))

RealI = 0.523248;

for i=1:10
  I(i) = trapezi_iterata(f,0,1,0,1,i,i);
  err(i) = abs(I(i)-RealI) 
endfor


x=1:10;
semilogy(x,err,'r','linewidth',2);
title("Andamento dell'errore d'integrazione al crescere della decomposizione");
grid on







