function plot_f(a,b)

 f = inline(" 2*sin(8*x) - log(x.^2+1) ");

 if ( a < b )
    c = a;
    a = b; 
    b = c;
  endif

  % la quantità di punti sarà (a-b)*100 per avere un aumento del numero
  %  di punti con l'aumentare della dimensione dell'intervallo 
 
  x = linspace(a,b,(a-b)*100);

  y = f(x);   

  plot(x,y,'r');
  xlabel(" decomposition ");
  ylabel(" 2*sin(8*x) - ln(x.^2+1) ");
  grid on;

endfunction
