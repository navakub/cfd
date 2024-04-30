function f = CalculateContactForce(x, k_wall)
% The walls are located at x<0, x>1, and y<0

N = size(x,1);
f = zeros(N,2);

for i = 1 : N
    if x(i,1) < 0 
        f(i,1) = -k_wall*x(i,1);    % x-positive force
    elseif x(i,1) > 1 
        f(i,1) = k_wall*(1-x(i,1)); % x-negative force
    end
    
    if x(i,2) < 0 
        f(i,2) = -k_wall*x(i,2);    % y-positive force    
    end
end
