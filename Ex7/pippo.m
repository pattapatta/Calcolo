
% R e a l I = i n t e g r a t e ( 0 , 1 ,@( x ) s i n ( x ) ) ;
% Calcolato Online r i s u l t a
RealI = 0.45970;

CS_coeff = [ 1 / 3 , 4 / 3 , 1/3 ] ;

b0 = 1 ;
a0 = 0 ;

b = @( i , j ) a0 + j ∗ ( ( b0−a0 ) / i ) ,
a = @( i , j ) ( j −1)/ i ;


function I = CavalieriSimpson (x , y , f )
I = ( ( y−x ) / 2 ) ∗ ( 1 / 3 ∗ f ( x ) + 4/3∗ f ( ( x+y ) / 2 ) + 1/3∗ f ( y ) ) ;
endfunction

I = zeros (10) ;

f o r i =1:10
f o r j =1: i
I ( i , j ) = CavalieriSimpson(a(i,j),b(i,j),@(x)sin(x) ) ;
endfor
endfor


Integralen = zeros (1 ,10) ;


for i =1:10
for j =1: i
Integralen(i) = Integralen(i) + I(i,j) ;
endfor
endfor

RealIv = ones (1 ,10) ∗ RealI ;

err_rel = abs( RealIv−Integralen)./RealIv;

plot ([1:10],err_rel , ’linewidth’,2,’r’);
grid minor
