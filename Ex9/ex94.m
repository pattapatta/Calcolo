function [ x, ro, err, numIt ] = SOR(A,b,x0,w,toll)

 if(size(A)(1)~=size(A)(2))
    error("La matrice deve essere quadrata");
  endif

  n=size(A);
   
  D = diag(diag(A));
  L = tril(A,-1);
  U = triu(A,1);
  invD = diag(1./diag(A));  
  I = eye(n);
  % Matrice di Iterazione
  P = inv((I+w*invD*L))*[(1-w)*I-w*invD*U];

  ro = max(abs(eig(P)));
 
  numIt = 0;
  err = ones(3,1);
  xold = x0;
  xnew = xold;
  while(1)
    numIt = numIt+1;
    xold = xnew; 
    xnew = P*xold + w*inv(I+w*invD*L)*invD*b;
    err = [ err; abs(xnew-xold) ];
    if(err(numIt)<toll)
      break
    endif
  endwhile    
  
  x = xnew;

endfunction


A1 = [
      -3, 3, -6;
      -4, 7, -8;
       5, 5, -9; 
     ];

A2 = [
      7,  4, -7;
      4,  5, -3;
     -7, -3,  8;
      ];

b1 = [ -6; -5;  3 ];
b2 = [  4;  6; -2 ];


toll = 10^-1;
x0 = [0;0;0];

x11 = [];
ro11 = []; 
err11 = [];
numIt11 = [];


for w=0.2:1.8/5:2
   [ x, ro, err, numIt ] =  SOR(A1,b1,x0,w,toll);
   x11 = [ x11, x ]; 
   ro11 = [ ro11; ro ]; 
   err11 = [ err11; err ]; 
   numIt11 = [ numIt11; numIt ]
endfor


x12 = [];
ro12 = []; 
err12 = [];
numIt12 = [];

for w=0.2:1.8/5:2
   [ x, ro, err, numIt ] =  SOR(A1,b2,x0,w,toll);
   x12 = [ x12, x ]; 
   ro12 = [ ro12; ro ]; 
   err12 = [ err12; err ]; 
   numIt12 = [ numIt12; numIt ]; 
endfor

x21 = [];
ro21 = []; 
err21 = [];
numIt21 = [];

for w=0.2:1.8/5:2
   [ x, ro, err, numIt ] =  SOR(A2,b1,x0,w,toll);
   x21 = [ x21, x ]; 
   ro21 = [ ro21; ro ]; 
   err21 = [ err21; err ]; 
   numIt21 = [ numIt21; numIt ]; 
endfor

x22 = [];
ro22 = []; 
err2 = [];
numIt22 = [];

for w=0.2:1.8/5:2
   [ x, ro, err, numIt ] =  SOR(A2,b2,x0,w,toll);
   x22 = [ x22, x ]; 
   ro22 = [ ro22; ro ]; 
   err22= [ err22; err ]; 
   numIt22 = [ numIt22; numIt ]; 
endfor



