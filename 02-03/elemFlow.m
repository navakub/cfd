function [psi, U,V] = elemFlow(X,Y,p ,type)
% get stream-fn and velocity field of 2D-flow
% parameter p
if type=='uniform'
    psi
elseif type=='line'
    psi=p/(2*pi)*atan()
elseif type=='vortex'
elseif type=='doublet'
end
U=diff(psi,y);V=-diff(psi,x);
U=U(X,Y); V=V(X,Y);
end

