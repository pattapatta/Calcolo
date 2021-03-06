
f = inline("-(x-5).*log(x)./x.^2");
x = 1:0.5:5;
y = f(x);


xx = linspace(1,5,500);

% comando interp1 per interpolazione a tratti lineare

yyl = interp1(x,y,xx,'linear'); 

% comando interp1 per interpolazione a tratti cubica


yyi = interp1(x,y,xx,'cubic');


% comando spline per interpolazione a tratti

pps = spline(x,y);
yys = ppval(pps,xx);


% plotting

plot(x,y,'linewidth',2,'o',xx,yyi,'linewidth',2,'g',xx,yys,'linewidth',2,'r',xx,yyl,'linewidth',2,'b');
legend(" Nodi ", " Interp1 Spline Cubica ", " Spline Cubica ", " Interp1 Spline Lineare");
title("-(x-5).*log(x)./x.^2")
grid on

% Errori
% Valori della funzione nei punti xx

yyreal = f(xx);

% confrontiamo i valori della funzione con quelli approssimati

err_interp_lineare = abs(yyreal-yyl);
err_interp_cubica  = abs(yyreal-yys);
err_interp_spline  = abs(yyreal-yys);


figure 2 

plot(xx,err_interp_cubica,'linewidth',2,'g',xx,err_interp_spline,'linewidth',2,'o',xx,err_interp_lineare,'linewidth',2,'r');
legend(" Interp1 Spline Cubica ", " Spline Cubica ", " Interp1 Spline Lineare");
grid on
title("Errori Interpolatori");

% La migliore funzione interpolante risulta essere, all'analisi degli errori, la spline cubica.
%  Gli errori della spline cubica calcolati con la funzione spline e quelli calcolati con la funzione
%  interpl(xx,yy,'spline') risultano essere praticamente sovrapposti nel grafico, possiamo concludere quindi che siano
%  entrambi metodi appropriati per il calcolo della funzione interpolante 
 

