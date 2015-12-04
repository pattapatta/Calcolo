function [x1,x2,x3,x4] = f_root(alpha)
  t1 = ( -(1+10(2*alpha))/10^alpha + sqrt( ((1+10^(2*alpha))/10^alpha)^2 -4  )    )/2;
  t2 = ( -(1+10(2*alpha))/10^alpha - sqrt( ((1+10^(2*alpha))/10^alpha)^2 -4  )    )/2;

  x1 = sqrt(t1);
  x2 = -sqrt(t1);
  x3 = sqrt(t2);
  x4 = -sqrt(t2);

endfunction
