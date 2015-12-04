

function [ A ] = swap_row(A,i,j)
   A([i,j],:) = A([j,i],:);
endfunction


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

 
A = [ 1 0 0 1 ; 1 0 0 1 ; 0 0 1  1 ; 2 3 4 5  ];
%A2 = [ 4 0 2 4 ; 0 1 1 1 ; 2 2 11 9 ; 4 1 9 25 ];

n = size(A)(2);

   for i=1:n
     A = pivot(A,i); 
   endfor


function [ L, U ] = LU_pivoting_fact(A)

   n = size(A)(2);
   L = eye(n);
   U = A;

   for i=1:n
     A = pivot(A,i); 
   endfor
   for i=1:n
     for j=i+1:n
       L(i,j) = -A(i,j)/A(i,i);
       U(j,:) = L(j,i)*U(i,:) + U(j,:);
     endfor
   endfor

   L = -L;
endfunction




[ L, U ] = LU_pivoting_fact(A);




