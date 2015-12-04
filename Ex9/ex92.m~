
#{
     When called with two arguments, return the piecewise polynomial PP
     that may be used with 'ppval' to evaluate the polynomial at
     specific points.  When called with a third input argument, 'spline'
     evaluates the spline at the points XI.  The third calling form
     'spline (X, Y, XI)' is equivalent to 'ppval (spline (X, Y), XI)'.

     The variable X must be a vector of length N.  Y can be either a
     vector or array.  If Y is a vector it must have a length of either
     N or 'N + 2'.  If the length of Y is N, then the "not-a-knot" end
     condition is used.  If the length of Y is 'N + 2', then the first
     and last values of the vector Y are the values of the first
     derivative of the cubic spline at the endpoints.q

#}

function [ xi, yi ] = par_spline(x,y)
  t(1) = 0;
  for i=1:length(x)-1
    t(i+1) = t(i) + sqrt((x(i+1)-x(i))^2 + (y(i+1)-y(i))^2);
  endfor
  z = [t(1):(t(length(t))-t(1))/100:t(length(t))];
  xi = spline(t,x,z);
  yi = spline(t,y,z);

endfunction


x1 = [1,4,5,8,10,13,11,13,14,13];
y1 = [1,3,5,2,4,7,9,11,10,9];

x2 = [-2,-2,-2,-1,0,1,2,22,22,2,2,1,0,-1,-2,-2,-2];
y2 = [0,1,2,2,2,2,2.5,1,0,-1,-2,-2,-2,-2,-2,-1,0];

x3 = [3,10,10,5,5,9,9,6,6,8,8,7,7];
y3 = [2,2,9,9,4,4,8,8,5,5,7,7,6];




[ xx1,yy1 ] = par_spline(x1,y1);
[ xx2,yy2 ] = par_spline(x2,y2);
[ xx3,yy3 ] = par_spline(x3,y3);


%% Plotting nodes
plot(x1,y1,'ro','linewidth',2,x2,y2,'go','linewidth',2,x3,y3,'bo','linewidth',2);
title("Nodi di passaggio per le spline interpolanti parametriche")

%% Plotting nodes
plot(x1,y1,'r','linewidth',2,x2,y2,'g','linewidth',2,x3,y3,'b','linewidth',2);
title("Nodi di passaggio per le spline interpolanti parametriche")

figure 2
plot(xx1,yy1,'r','linewidth',2,xx2,yy2,'g','linewidth',2,xx3,yy3,'b','linewidth',2);
title("Costruzione di una spline parametrica interpolatoria")











