
function [x,y] = m_calc(m)
  m = abs(m);
  x1 = linspace(-m,0,50);
  x2 = linspace( 0,m,50);
  
  y1 =  (m-(x1.^2)./m).^m ;
  y2 =  ((x2.^2)./m+m).^m ;

  x = [ x1 x2 ];
  y = [ y1 y2 ];

endfunction

x=[];
y=[];

color = ['r','b','g','y','m','c'];

A = [];
for i=1:6
 [ x,y ] = m_calc(i);
 A = [ [ x, y ] ; A];
 semilogy(x,y,'linewidth',2,color(i));
 grid on
 hold on
endfor
 legend("m=1","m=2","m=3","m=4","m=5","m=6")



figure 2
for i=1:6
  subplot(2,3,i)
  semilogy(A(i,1:100),A(i,101:200),'linewidth',2,color(i));
  title([ " m = " num2str(i) ]);
  ylabel(" log scale ");
  grid on
endfor
