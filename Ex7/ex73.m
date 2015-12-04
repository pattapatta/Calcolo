
% Errori relativi al calcolo dell'integrale definito tra 0 e 1
%  della funzione sin(x) con le formule di Cavalieri Simpson e trapezi
%  al crescere dei sottointervalli della decomposizione


% RealI = integrate(0,1,@(x) sin(x));
% Calcolato Online risulta
RealI = 0.45970;

% Numero di Iterazioni
N = 2*10000;

% coefficienti alpha per n=2 nelle formule di Newton-Cotes
CS_coeff = [ 1/3, 4/3, 1/3 ];
T_coeff  = [ 1,   1 ]
b0 = 1;
a0 = 0;

% a e b sono espressi in funzione degli indici i e j, rispettivamente
%  il denominatore che determina la dimensione di ogni singolo sottointervallo della
%  decomposizione ( i ) e l'indicatore del j-esimo sottointervallo data una decomposizione.
%  Dati questi due indici posso determinare la posizione di 'a' e 'b' durante una determinata iterazione

b = @(i,j) a0 + j*((b0-a0)/i),
a = @(i,j) (j-1)/i;


% Voglio dividere l'intervallo in 2m sottointervalli di modo da poter 
%  applicare la formula di CavalieriSimpson sottointervalli sulle coppie di sottointervalli
% Lo farò per n=1:N

 
function I = CavalieriSimpson(x,y,f)
   I = ((y-x)/2)*(1/3*f(x) + 4/3*f((x+y)/2) + 1/3*f(y));
endfunction

function I = Trapezi(x,y,f)
   I = ((y-x)/2)*(f(x)+f(y));
endfunction

Icv = zeros(N);
It  = zeros(N);

for i=1:N
  for j=1:i
    Icv(i,j) = CavalieriSimpson(a(i,j),b(i,j),@(x) sin(x));
    It(i,j) = Trapezi(a(i,j),b(i,j),@(x) sin(x));
  endfor
endfor



% sommando i termini della stessa riga della matrice I ottengo un'approssimazione ( in teoria sempre migliore )
%  del valore dell'integrale del seno di x tra 0 e 1


IntegralenCv = zeros(1,N);
IntegralenT = zeros(1,N);


% Nelle Matrici Icv e It ho in ogni colonna j il valore dell'integrale calcolato
%  nel sottointervallo ((b-a)/i)*j con i = indice di riga
for i=1:N
  for j=1:i
    IntegralenCv(i) = IntegralenCv(i) + Icv(i,j);
    IntegralenT(i)  = IntegralenT(i)  + It(i,j);	
  endfor
endfor


RealIv = ones(1,N)*RealI;

err_rel_cv = abs(RealIv-IntegralenCv)./RealIv;
err_rel_t  = abs(RealIv-IntegralenT)./RealIv;

semilogy([1:N],err_rel_cv,'linewidth',2,'r',[1:N],err_rel_t,'linewidth',2,'g');
title(" Andamento degli errori relativi al crescere del valore della decomposizione ");
legend("Errore Relativo metodo di Cavalieri-Simpson", "Errore Relativi metodo dei Trapezi")
grid minor
ylabel("Errori Relativi");

