
% Fattorizzazione LU


function [ A ] = row_swap(A,i,j)
  A([i,j],:) = A([j,i],:);
endfunction


% Fa il pivot sulla colonna i.esima all'i-esimo passo dell'iterazione

function [ A, m ] = pivot(A,i)
   m = i;
   n = size(A)(2);
   for j=i+1:n
     if ( abs(A(j,i)) > abs(A(m,m)) )
       m = j;
     endif
   endfor
   A = swap_row(A,i,m);
endfunction


function [ L, U ]  = LU_fact(A)
  n = size(A);
  L = eye(n);
  U = A;
  
  for i=1:n
    U = pivot(U,i);
  endfor


for k = 1 : n-1 % Passo
     [ U max ] = pivot(U,k);
     for i = k+1 : n % Per ogni riga
        L(i,k) = -A(i,k)/A(k,k);
        A(i,:) = L(i,k)*A(k,:) + A(i,:)
     end
end

L = -1*L;

endfunction


A1 = [ 1 0 0 1 ; 1 0 0 1 ; 0 0 1  1 ; 2 3 4 5  ];
A2 = [ 4 0 2 4 ; 0 1 1 1 ; 2 2 11 9 ; 4 1 9 25 ];

[ L1, U1 ]  = LU_fact(A1);
%[ L2, U2 ]  = LU_fact(A2);
