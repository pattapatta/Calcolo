

H = hilb(10);
x = ones(10,1);

b = H*x;

x1 = H\b;

z = [ 0.001, zeros(1,size(b)-1)]'

c = b+z ;

y = H\c;

err = norm(x-y)/norm(x)




