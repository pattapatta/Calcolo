#!usr/bin/octave

function [x1,x2,x3,x4] = my_root1(alpha)

  b = (1+10^(2*alpha))/10^alpha;
  t1 = (b + sqrt(b^2-4))/2;
  t2 = (b - sqrt(b^2-4))/2;

  x1 = -sqrt(t1);
  x2 = -sqrt(t2);
  x3 =  sqrt(t1);
  x4 =  sqrt(t2);

endfunction


A = [];

for alpha = 1:10
 A(alpha,1) = 1;
 A(alpha,2) = 0;
 A(alpha,3) = -(1+10^(2*alpha))/10^alpha;
 A(alpha,4) = 0;
 A(alpha,5) = 1;
endfor

my_solutions = [];
oc_solutions = [];

for alpha = 1:10
  my_solutions = [ my_solutions ; my_root1(alpha) ];
  oc_solutions = [ oc_solutions ; roots(A(alpha, :))];
endfor


for a = 1:10
  my_solutions(a,:) = sort(my_solutions(a,:));
  oc_solutions(a,:) = sort(oc_solutions(a,:));
endfor

% errori relativi = my_solutions./oc_solutions
error_relativ = [];

for a = 1:10
  error_relativ = [ error_relativ ; my_solutions./oc_solutions ]
endfor

