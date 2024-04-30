function w = Kernel(r,h)
    % 2 dimensions only
	norm_r = norm(r);
	w = 1.0 / (h^2*pi)* exp( -norm_r^2 / h^2);	
end
