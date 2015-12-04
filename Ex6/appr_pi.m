
	tr = inline("16^(-x)*(4/(8*x+1) - 2/(8*x+4) - 1/(8*x+5) - 1/(8*x+6))");


	p0 = (4-1/2-1/5-1/6);

	p_i = p0*ones(1,100);
	 

	for a=2:100
	  for b=1:a
	    p_i(a) = p_i(a) + tr(b);
	  endfor
	endfor

% converge velocemente a pi

real_pi = ones(1,100)*pi;
err = abs(real_pi - p_i);

% alla decima iterazione l'errore in format long risulta essere nullo
