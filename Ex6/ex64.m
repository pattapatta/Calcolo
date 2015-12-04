load csape.m

x = linspace(0,2*pi,500);
y = sin(x);

xx = linspace(0,2*pi,50);
yy = sin(xx);

% Cofficents Periodic Spline 
%    S'(x0) = S'(xn)
%    S''(x0) = S''(xn)

cp = csape(x,y,'periodic');




% Coefficents Natural Spline 
%    S'''(x0)=S'''(xn) = 0

cn = csape(x,y,'complete',[ 0 0 ]);



yp = ppval(cp,xx);
yn = ppval(cn,xx);

err_periodic = abs(yy-yp);
err_natural  = abs(yy-yn);


subplot(2,1,1)
  plot(x,y,'linewidth',2,'g', xx,yp,'linewidth',0.5,'b', xx,yn,'linewidth',2,'r')
  title(" Interpolazione del seno con spline cubiche naturali e periodiche ");
  grid on
  legend(" sin(x) ", " periodic spline ", " natural spline ");
subplot(2,1,2)
  plot(xx,err_periodic,'linewidth',2,'r', xx,err_natural,'linewidth',2,'b')
  title(" errori interpolatori di spline periodiche e naturali ");
  grid on
  legend( " Errore spline periodica ", " Errore spline naturale ");



% Si noti che data una discretizzazione iniziale piccola ( 5 punti ) come questa
%  gli errori risultano rilevanti per entrambe le tecniche interpolatorie, per quanto per la
%  spline naturale risultino già maggiori.
% Se aumentiamo notevolmente invece il numero di intervalli notiamo che entrambi gli errori
%  tendono a diminuire drasticamente all'interno dell'intervallo, mentre agli estremi la
%  spline naturale continua a mantenere un errore notevole.
