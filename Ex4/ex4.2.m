A = hilb(1000);
B = rand(1000);

x = ones(1000,1);
y = ones(1000,1);

% Ax = b;
% By = c;

b = A*x;
c = B*y;

x1 = A\x;
y1 = B\y;

%  Calcolare gli errori relativi tra b,c b1 e c1
%   rapportandoli al numero di condizionamento di A e B

Ka = cond(A);
Kb = cond(B);


err_relx = norm(x-x1)/norm(x);
err_rely = norm(y-y1)/norm(y);

gayyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
