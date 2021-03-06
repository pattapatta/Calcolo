%%%% Parte a %%%%


function my_print(a,b)
  if( a > b )
    c = a;
    a = b;
    b = c;
  endif

  f = inline("2*sin(8*x)-log(x.^2+1)");

  x = linspace(a,b,100*(b-a));
  y = f(x);

  plot(x,y,'linewidth',2,'r');
  grid on
  title("2*sin(8*x)-log(x.^2+1)")

endfunction

my_print(-5,5);

%%%% Parte b %%%%

x1 = linspace(2,3,50);
x2 = linspace(3,4,50);

y1 = x1.^2;

x = [ x1, x2 ];
y = [ y1, ones(1,50)*9 ];

figure 2
plot(x1,y1,'linewidth',2,'r',x2,9,'linewidth',2,'g')
legend("y=x^2 ","y=9 ")
title(" Funzione definita a tratti ")
grid on


