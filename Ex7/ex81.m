

% Funzione per la creazione di matrici elementari

%function [ E ] = Elementary_Matrix(alpha, u, v)
%   n = size(B = u*v');
%   E = eye(n) + alpha*B;
%endfunction

% NB occorre invertire la trasposizione dei vettori per creare una matrice
%  altrimenti il risultato in E è uno scalare

function [ E ] = Elementary_Matrix(alphau, v)
   n = size(B = alphau'*v);
   E = eye(n) + B;
endfunction


function [ y ]  = alpha_u(x)
  n = size(x)(2);
  e1 = [ 1, zeros(1,n-1) ];
  y = ( e1.*x-x)/(x(1));
endfunction

#{
x = 1:5
n = size(x)(2);
e1 =  e1 = [ 1, zeros(1,n-1) ];
alphau = alpha_u(x);

E = Elementary_Matrix(alphau, e1)
#}


function [ y ] = e(x)
  n = size(x)(2);
  y = [ 1, zeros(1,n-1) ];
endfunction

% Ora considero una matrice generica e scrivo l'algoritmo per la
%  Fattorizzazione LU
A
function [ L, U ] = LU_factorization(A)

  L = I;
  U = A;
  
  n = size(A)(2);
  for i=1:n
    x = A(i,i:n);
    E = Elementary_Matrix(alpha_u(x), e(x))

% Solo alla prima iterazione le matrici E e A hanno le stesse dimensioni
%  successivamente E diventa più piccola, va quindi ornata aggiungendo
%  1 e 0 opportunamente
 
    if (i!=1)
      
    endif


    L = E*L
    U = E*A
  endfor

endfunction














