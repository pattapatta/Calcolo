load csape.m

x = [-1, -0.5, 0, 0.5, 1];
y = [0.5, 0.8, 1, 0.8, 0.5];
 
xx = linspace(-1,1,1000);

% "Complete" condition imposes that the spline's values  have to be clamped 
%  at the extreme knots with values specified in 2nd argument vector
pp_cl = csape(x,y,'complete',[1/2 -1/2]);

% Not-a-knot condition imposes the continuity of third derivative between first and second and
%   next-to-last and last knot-
pp_nk = csape(x,y,'not-a-knot');

yy_cl = ppval(pp_cl,xx);
yy_nk = ppval(pp_nk,xx);

plot(xx,yy_cl,'linewidth',2,'r',xx,yy_nk,'linewidth',2,'b');
grid on
legend(" Spline Vincolata ", " Not-a-Knot Spline ");
title("Utilizzo della funzione csape per il calcolo di una Spline interpolante");
