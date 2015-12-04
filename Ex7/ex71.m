%% Newton Cotes con n = 4 %%


% expr0= ((x-1)/(0-1))*((x-2)/(0-2))*((x-3)/(0-3))*((x-4)/(0-4));
% expr2= ((x-0)/(2-0))*((x-1)/(2-1))*((x-3)/(2-3))*((x-4)/(2-4));


% Codice per il Calcolo dei Coefficienti in Matlab
syms x;

alpha0 =  int(((x-1)/(0-1))*((x-2)/(0-2))*((x-3)/(0-3))*((x-4)/(0-4))  ,x,  0,  4);

alpha2 =  int(((x-0)/(2-0))*((x-1)/(2-1))*((x-3)/(2-3))*((x-4)/(2-4))  ,x,  0,  4);

alpha1 = (4-(2*alpha0)*-alpha2);
alpha1 = alpha1/2;
alpha3 = alpha1;
alpha4 = alpha0;

#{
% Coefficienti precalcolati
alpha0 = 14/15;
alpha1 = 64/15;
alpha2 = 24/25;
alpha3 = alpha1;
alpha4 = alpha0; 
#}

% alpha0+alpha1+alpha2+alpha3+alpha4 = 4 ? Proprietà delle costanti di Newton
%  se non vale i calcoli sono errati

alpha = [ alpha0, alpha1, alpha2, alpha3, alpha4 ]


% La formula di NewtonCotes chiusa vuole che I = h*[alpha0*f(x(0)+alpha1*f(x)...]

a=0;
b=1;
h = (b-a)/4;

x = [];
x = [ x, 0 ];
for i=1:4
  x = [ x, a+i*h ];
endfor


f = inline("e^(-x.^2)");
fun = @(x) e^(-x.^2);
y = f(x);

I = 0;
for i=1:5
  I = I + y(i)*alpha(i);
endfor

  I = h*I;

RealI = integrate(fun,0,1);

err = abs(RealI-I);









