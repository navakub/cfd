function [] = vonkarman(U,a,n,zmin,zmax,rmin,rmax,eps)
% von Karman method to simulate a steady-state flow past an ellipsoidal cylinder.
% --------output--------
% (rp,zp): spatial domain for visualization
% Q: source strength
% (ur,uz): velocity for r-z axes
% --------input--------
% a: radius
% n: number of segments
% [zmin,zmax]: leftmost,rightmost spatial domain (z-axis)
% [rmin,rmax]: lowermost,uppermost spatial domain (r-axis)
% eps: small positive number
theta=(n*ones(n-1,1)-linspace(1,n-1,n-1)')*pi/n;
r=a*sin(theta);z=cos(theta);

zs=linspace(min(z)+0.1,max(z)-0.1,n+1)'; s=zs(2)-zs(1);

% source strength (Q)
b=[1/2*r.^2; 0];
A=zeros(n);A(n,:)=s;
for i=1:n-1
    for j=1:n
        d=sqrt(r(i)^2+(z(i)-zs(j))^2);
        d_=sqrt(r(i)^2+(z(i)-zs(j+1))^2);
        A(i,j)=d-d_;
    end
end
Q=(A+eps*eye(n))\b;
% spatial domains
hp=(zmax-zmin)/n;
zp=zmin:hp:zmax;rp=rmin:hp:rmax;
nz=length(zp);nr=length(rp); 

% flow variable (psi)
psi=zeros(nr,nz);
for i=1:nr
    for j=1:nz
        psik=0;
        for k=1:n
            d_=sqrt(rp(i)^2+(zp(j)-zs(k+1))^2);
            d=sqrt(rp(i)^2+(zp(j)-zs(k))^2);
            psik=psik+Q(k)*U*(d_-d);
        end
        psi(i,j) = 1/2*U*rp(i)^2 + psik;
    end
end

% visualization
figure();
contour(zp,rp,psi,100);colorbar();
xlabel('z');ylabel('r');
title("Flow past ellipsoidal cylinder with a = "+num2str(a)+", n = "+num2str(n)+", \epsilon = "+num2str(eps));
end