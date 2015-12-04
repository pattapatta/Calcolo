% Risoluzione di sistemi lineari con matrici tridiagonali
%  Utilizzo la fattorizzazione LU per la matrice A e poi 
%  risolvo il sistema che ne consegue.


A = diag(ones(1,5));
A = A + diag(ones(1,4),1)*3;
A = A + diag(ones(1,4),-1)*5;

% Fattorizzazione LU per matrici tridiagonali.
  % conditio sine qua non A deve essere tridiagonale.
function [ L, U ] = tridiag_fatt(A)
  a = diag(A);
  c = diag(A,1);
  b = diag(A,-1);

  % Calcolo dei determinanti dei minori
  %  NB d(n) = det(A)

  d = ones(1,size(a)+1);
  d(1) = 1;
  d(2) = a(1);
  for i=2:size(a)
    d(i+1) =  (a(i)*d(i) - b(i-1)*c(i-1)*d(i-1));
  endfor


  % diagonale inferiore di L
  l = ones(1,size(a)-1);
  % diagonale principale di U
  u = ones(1,size(a));

  for i=1:size(a)-1
   l(i) = l(i)*( b(i)*d(i)/d(i+1) );
  endfor

  for i=1:size(a)
   u(i) = d(i+1)/d(i);
  endfor

  % Ora posso calcolare le due matrici L ed U
  
  L = diag(ones(1,size(a))) + diag(l,-1);
  U = diag(u) + diag(c,1);

endfunction


[ L,U ] = tridiag_fatt(A);
b = [ 1,2,3,4,5 ]';
%% Algoritmo di risoluzione
%   Ax = b
%   A  = LU
%   LUx = b
%
%   Ly = b
%   Ux = y
%   
%
%   x è la mia soluzione finale  


% Diagonale inferiore di L
 bl = diag(L,-1);

% Diagonale principale di U
 au = diag(U);

% Diagonale superiore di U
 cu = diag(U,1);

n = size(L)(1);


x_sure = A\b

y = ones(1,n);
x = ones(1,n);Y


% Risoluzione di Ly = b
y(1) = b(1);
for i=2:n
  y(i) = b(i) - bl(i-1)*y(i-1);
endfor


% Risoluzione di Ux = y
x(n) = y(n)/au(n);
for i=n-1:-1:1
  x(i) = (y(i-1)-cu(i)*x(i+1))/cu(i);
endfor









