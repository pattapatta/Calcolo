
% Andamento dell'errore relativo nel calcolo dell'integrale definito della funzione e^(-x.^2)
%  mediante l'uso delle formule di Newton-Cotes

% Inizio calcolando il valore "esatto" dell'integrale


f = @(x) e.^(-x.^2);


%RealI = integrate(fun,0,1);
%err = abs(RealI-I);

RealI = 0.746824;
RealI_v = RealI*ones(1,7);

% Matrice dei Coefficienti delle formule di Newton-Cotes
NC_coeff = [
                  
	1/2        ,1/2         ,0          ,0           ,0           ,0          ,0           ,0;
        1/3        ,4/3         ,1/3        ,0           ,0           ,0          ,0           ,0;
        3/8        ,9/8         ,9/8        ,3/8         ,0           ,0          ,0           ,0;
        14/45      ,64/45       ,24/45      ,64/45       ,14/45       ,0          ,0           ,0;
        95/288     ,375/288     ,250/288    ,250/288     ,375/288     ,95/288     ,0           ,0;
        41/140     ,216/140     ,27/140     ,272/140     ,27/140      ,216/140    ,41/140      ,0;
        5257/17208 ,25039/17208 ,9261/17208 ,20923/17208 ,20923/17208 ,9261/17208 ,25039/17208 ,5257/17208
                
	   ]


% Ora cerco i 7 valori dell'integrale approssimato

a=0;
b=1;
n=7;

I = zeros(1,n);

for i=1:n
  h = (b-a)/i;
  for j=1:i+1
    I(i) = I(i) + NC_coeff(i,j)*f(a+h*(j-1));
  endfor
  I(i) = h*I(i);
endfor


err = abs(RealI_v - I);

plot([1:7], err, 'linewidth',2,'r')
grid minor
title("Andamento dell'errore di integrazione al crescere della decomposizione \n calcolato come differenza tra RealI = 0.746824 e il valore dato dalla formula per un n dato ");
xlabel("Indice della decomposizione")



% Calcolo ora una stima dell'errore per eccesso mediante le formule alle derivate

f2 = @(x) e.^(-x.^2).*(4*x-2);
f4 = @(x) 4*e.^(-x.^2).*(4*x.^3-2*x.^2-6*x+1);
f6 = @(x) 8*e.^(-x.^2).*(8*x.^5-4*x.^4-40*x.^3+12*x.^2+30*x-3);
f8 = @(x) 16*e.^(-x.^2).*(16*x.^7-8*x.^6-168*x.^5+60*x.^4+420*x.^3-90*x.^2-210*x+15);


a = 0;
b = 1;
h1 = (b-a);
h2 = (b-a)/2;
h3 = (b-a)/3;
h4 = (b-a)/4;
h5 = (b-a)/5;
h6 = (b-a)/6;
h7 = (b-a)/7;


% coefficienti dell'errore
coeff_err  = [ (-1/12)*h1^3, (-1/90)*h2^5, (-3/80)*h3^5, (-8/945)*h4^7, (-275/12096)*h5^7, (-9/1400)*h6^9, (-8183/518400)*h7^9 ];


x = 0:0.01:1;


ve1 = f2(x).*coeff_err(1);
ve2 = f4(x).*coeff_err(2);
ve3 = f4(x).*coeff_err(3);
ve4 = f6(x).*coeff_err(4);
ve5 = f6(x).*coeff_err(5);
ve6 = f8(x).*coeff_err(6);
ve7 = f8(x).*coeff_err(7);

% Cerco il massimo di ogni vettore per poter fare una stima per eccesso

Me1 = max(abs(ve1));
Me2 = max(abs(ve2));
Me3 = max(abs(ve3));
Me4 = max(abs(ve4));
Me5 = max(abs(ve5));
Me6 = max(abs(ve6));
Me7 = max(abs(ve7));


Me=[Me1,Me2,Me3,Me4,Me5,Me6,Me7];



figure 2
plot(1:7,Me,'linewidth',2,'g');
grid minor
title("Andamento dell'errore interpolatorio calcolato al crescere della decomposizione \n calcolato mediante le tabelle degli errori ");






