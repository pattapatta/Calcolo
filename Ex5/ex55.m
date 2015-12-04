
% funzione per matrice bidiagonale del tipo
%   A = diag(ones(1,n)) + diag(2*ones(1,n-1),1);

function [ inv_A ] = inv_bidiag(A);

% Calcolo l'inversa con il metodo di Gauss Giordan


% n = numero di righe di A
n = size(A)(1);


AI = [ A , eye(size(A)(2)) ];


for r=n:-1:2
  AI(r-1,:) = AI(r-1,:)-2*AI(r,:);
endfor

inv_A = AI(:,size(AI)(2)/2+1:size(AI)(2));


endfunction


