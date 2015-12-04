
function X = my_roots(alpha)
  
  b = (1+10^(2*alpha))/10^alpha;
  t1 = (b + sqrt(b^2-4))/2;
  t2 = (b - sqrt(b^2-4))/2;

  x1 = -sqrt(t1);
  x2 = -sqrt(t2);
  x3 =  sqrt(t1);
  x4 =  sqrt(t2);

  X = [ x1, x2, x3, x4 ];

endfunction
