function [A, P] = pivoting(A)
    P = eye(length(A));
    for i = 1: length(A)
        if(A(i, i) == 0)
            [m, j] = max(abs(A(i:length(A), i)));
            j = i + j - 1;
            A([i,j],:) = A([j,i],:);
            P([i,j],:) = P([j,i],:);
        end
    end
end


% fattorizzazione LU

function [ L, U, P ] = lu_fact(A)
   [ A, P ] = pivoting(A);
   n = size(A);
   L = eye(n);
   U = zeros(n);

   for k=1:n-1
     for i=k+1:n
       L(i,k) = A(i,k)/A(k,k);
       A(i,:) = A(i,:) - L(i,k)*A(k,:);
     endfor
   endfor

   U = A;
endfunction


A1 = [
       1, 0, 0, 1; 
       1, 0, 0, 1; 
       0, 0, 1, 1;
       2, 3, 4, 5; 
     ];

A2 = [
       4, 0,  2,  4; 
       0, 1,  1,  1;
       2, 2, 11   9; 
       4, 1,  9, 25; 	
     ];


[ l1, u1, p1 ] = lu_fact(A1);

[ l2, u2, p2 ] = lu_fact(A2);


[ ll1, uu1, pp1 ] = lu(A1);
[ ll2, uu2, pp2 ] = lu(A2);

l1

u1

p1

p1*(l1*u1)



l2

u2

p2

p2*(l2*u2)



ll1

uu1

pp1

pp1*(ll1*uu1)



ll2

uu2

pp2

pp2*(ll2*uu2)


#{


octave:157> l1
l1 =

   1   0   0   0
   2   1   0   0
   0   0   1   0
   1   0   0   1

octave:158> u1
u1 =

   1   0   0   1
   0   3   4   3
   0   0   1   1
   0   0   0   0

octave:159> p1
p1 =

   1   0   0   0
   0   0   0   1
   0   0   1   0
   0   1   0   0

octave:160> p1*(l1*u1)
ans =

   1   0   0   1
   1   0   0   1
   0   0   1   1
   2   3   4   5

A1 =

   1   0   0   1
   1   0   0   1
   0   0   1   1
   2   3   4   5




octave:161> l2
l2 =

   1.00000   0.00000   0.00000   0.00000
   0.00000   1.00000   0.00000   0.00000
   0.50000   2.00000   1.00000   0.00000
   1.00000   1.00000   0.75000   1.00000

octave:162> u2
u2 =

    4.00000    0.00000    2.00000    4.00000
    0.00000    1.00000    1.00000    1.00000
    0.00000    0.00000    8.00000    5.00000
    0.00000    0.00000    0.00000   16.25000

octave:163> p2
p2 =

Diagonal Matrix

   1   0   0   0
   0   1   0   0
   0   0   1   0
   0   0   0   1

octave:164> p2*(l2*u2)
ans =

    4    0    2    4
    0    1    1    1
    2    2   11    9
    4    1    9   25



A2 =

    4    0    2    4
    0    1    1    1
    2    2   11    9
    4    1    9   25




%%%% MATRICI DI MATLAB %%%%

octave:165> ll1
ll1 =

   1.00000   0.00000   0.00000   0.00000
   0.50000   1.00000   0.00000   0.00000
   0.00000  -0.00000   1.00000   0.00000
   0.50000   1.00000   0.00000   1.00000

octave:166> uu1
uu1 =

   2.00000   3.00000   4.00000   5.00000
   0.00000  -1.50000  -2.00000  -1.50000
   0.00000   0.00000   1.00000   1.00000
   0.00000   0.00000   0.00000   0.00000

octave:167> pp1
pp1 =

Permutation Matrix

   0   0   0   1
   0   1   0   0
   0   0   1   0
   1   0   0   0
 
octave:168> pp1*(ll1*uu1)
ans =

   1   0   0   1
   1   0   0   1
   0   0   1   1
   2   3   4   5

A1 =

   1   0   0   1
   1   0   0   1
   0   0   1   1
   2   3   4   5



octave:169> ll2
ll2 =

   1.00000   0.00000   0.00000   0.00000
   0.50000   1.00000   0.00000   0.00000
   0.00000   0.50000   1.00000   0.00000
   1.00000   0.50000  -0.50000   1.00000

octave:170> uu2
uu2 =

    4.00000    0.00000    2.00000    4.00000
    0.00000    2.00000   10.00000    7.00000
    0.00000    0.00000   -4.00000   -2.50000
    0.00000    0.00000    0.00000   16.25000
 
octave:171> pp2
pp2 =

Permutation Matrix

   1   0   0   0
   0   0   1   0
   0   1   0   0
   0   0   0   1

 octave:172> pp2*(ll2*uu2)
ans =

    4    0    2    4
    0    1    1    1
    2    2   11    9
    4    1    9   25

A2 =

    4    0    2    4
    0    1    1    1
    2    2   11    9
    4    1    9   25


Le matrici di permutazione restituite dall'algoritmo implementato nel linguaggio non sono le stesse che ottengo dal mio algoritmo.
Evidentemente l'implementazione interna utilizza un algoritmo differente
da quello di eliminazione gaussiana.

}#


