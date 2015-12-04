A = [
      -3, 3, -6;
      -4, 7, -8;
       5, 5, -9; 
     ];

b = [ -6; -5;  3 ];


toll = 10^-3;
w = 0.5;
x0 = [0;0;0];

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
