
A1 = [ -3, 3, -6; 
       -4, 7, -8; 
        5, 7, -9
     ];

b1 = [ -6; -5; 3 ];


A2 = [  4,  1,  1; 
        2, -9,  0; 
        0, -8, -6
     ];

b2 = [ 6; -7; -14 ];



function [ xnew, err, ro ] = Jacobi(A,b,x0,Nmax,toll)

  D = diag(A);
  E = D-tril(A);
  F = D-triu(A);

  invD = diag(1./diag(A));
  Pj = invD*(E+F);  % Matrice di iterazione
  ro = max(abs(eig(Pj)));  

  xold = x0;
  i=1;
  test = 1;
  err = zeros(1,Nmax);
  
  while i<Nmax && test>toll
    xnew   = Pj*xold + invD*b;   % Da definizione
    err(i) = norm(xnew-xold);
    test   = err(i);
    xold   = xnew;
    i      = i+1;
  endwhile

  err = err(1:i-1);

endfunction



function [ xnew, err, ro ] = GaussSeidel(A,b,x0,Nmax,toll)

  D = diag(A);
  E = D-tril(A);
  F = D-triu(A);

  invDE = inv(D+E);
  Pgs = invDE*F;  % Matrice di iterazione
  ro = max(abs(eig(Pgs)));

  xold = x0;
  i=1;
  test = 1;
  err = zeros(1,Nmax);
  
  while i<Nmax && test>toll
    xnew   = Pgs*xold + invDE*b;   % Da definizione
    err(i) = norm(xnew-xold);
    test   = err(i);
    xold   = xnew;
    i      = i+1;
  endwhile

  err = err(1:i-1);

endfunction




[x1j, err1j, ro1j]= Jacobi(A1, b1, zeros(3, 1), 100, 10^-3);
[x2j, err2j, ro2j]= Jacobi(A2, b2, zeros(3, 1), 100, 10^-3);

 
[x1g, err1g, ro1g]= GaussSeidel(A1, b1, zeros(3, 1), 100, 10^-3);
[x2g, err2g, ro2g]= GaussSeidel(A2, b2, zeros(3, 1), 100, 10^-3);



hold on
subplot(2,2,1)
semilogy(1:length(err1j), err1j)
title([ "Jacobi(A1x1=b1), ro(P1j) = " num2str(ro1j) ] )
grid on
subplot(2,2,2)
semilogy(1:length(err2j), err2j)
title([ "Jacobi(A2x2=b2), ro(P2j) = " num2str(ro2j) ] )
grid on
subplot(2,2,3)
semilogy(1:length(err1g), err1g)
title([ "GaussSidel(A1x1=b1), ro(P1g) = " num2str(ro1g) ] )
grid on
subplot(2,2,4)
semilogy(1:length(err2g), err2g)
title(["GaussSidel(A2x2=b2), ro(P2g) = " num2str(ro2g) ])
grid on




#{
   SI noti che l'unica successione convergente è quella che usa il metodo di Gauss Sidel sul primo dei sistemi, 
     la matrice d'iterazione associata infatti ha raggio spettrale minore di 1.
   Il teorema ci dice che questa è una condizione necessaria e sufficiente, quindi è coerente con la teoria
     minore di 1.
     avere come unica successione convergente quella che ha matrice associata d'iterazione con raggio spettrale
#}



%%% fprintf degli errori %%%%%

e1j = [ 1:length(err1j); err1j ]; 
e2j = [ 1:length(err2j); err2j ]; 

e1g = [ 1:length(err1g); err1g ]; 
e2g = [ 1:length(err2g); err2g ]; 


file_errori = fopen('errori1j.txt','w');
fprintf(file_errori, '%6s %56s\n', 'x', 'errore sistema 1 con Jacobi')
fprintf(file_errori, '%6.2f %56.8f\n' , e1j);

file_errori = fopen('errori2j.txt','w');
fprintf(file_errori, '%6s %56s\n', 'x', 'errore sistema 2 con Jacobi')
fprintf(file_errori, '%6.2f %56.8f\n' , e2j);

file_errori = fopen('errori1g.txt','w');
fprintf(file_errori, '%6s %56s\n', 'x', 'errore sistema 1 con Gauss Sidel')
fprintf(file_errori, '%6.2f %56.8f\n' , e1g);

file_errori = fopen('errori2g.txt','w');
fprintf(file_errori, '%6s %56s\n', 'x', 'errore sistema 2 con Gauss Sidel')
fprintf(file_errori, '%6.2f %56.8f\n' , e2g);


