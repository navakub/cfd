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

zs=linspace(zmin+0.2,zmax-0.2,n+1)'; s=zs(2)-zs(1);

% source strength (Q)
b=[1/2*r.^2; 0];
A=zeros(n);A(n,:)=s;
for i=1:n-1
    for j=1:n-1
        d=sqrt(r(i)^2+(z(i)-zs(j))^2);
        d_=sqrt(r(i)^2+(z(i)-zs(j+1))^2);
        A(i,j)=d-d_;
    end
end
Q=(A+eps*eye(n))\b;

% spatial domains
zp=zmin:0.01:zmax;rp=rmin:0.01:rmax;[Zp,Rp]=meshgrid(zp,rp);
nz=length(zp);nr=length(rp); 

% flow variable (psi,ur,uz)
psi=zeros(nr,nz); ur=zeros(nr,nz); uz=zeros(nr,nz);
for i=1:nr
    for j=1:nz
        psik=0;uzk=0;
        for k=1:n
            d_=sqrt(rp(i)^2+(zp(j)-zs(k+1))^2);
            d=sqrt(rp(i)^2+(zp(j)-zs(k))^2);
            
            psik=psik+Q(k)*U*(d_-d);
            ur(i,j) = ur(i,j) - Q(k)*U/rp(i)*((zp(j)-zs(k+1))/d_ - (zp(j)-zs(k))/d);%ur
            uzk=uzk+Q(k)*(1/d_ - 1/d);
        end
        psi(i,j) = 1/2*U*rp(i)^2 + psik;
        uz(i,j) = U*(1+uzk); %uz
    end
end

% visualization
figure();
contour(Zp,Rp,psi,100,'ShowText','off');
xlabel('z');ylabel('r');
title("Flow past ellipsoidal cylinder of a = "+num2str(a));
end