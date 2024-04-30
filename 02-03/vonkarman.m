clc;clear

n=20; %number of segments
a=1;U=1;
theta=pi/n*linspace(n-1,1,n-1)';
r=a*sin(theta);
z=a*cos(theta);
s=1.6*a/n; zs=-0.8*a:s:0.8*a';

eps=0;

b=[1/2*r.^2; 0];
A=zeros(n);
for i=1:n
    for j=1:n
        if i==n
            A(i,j)=s;
        else
            d=sqrt(r(i)^2+(z(i)-zs(j))^2);
            d_=sqrt(r(i)^2+(z(i)-zs(j+1))^2);
            A(i,j)=d-d_;
        end
    end
end

Q=(A+ones(n)*eps)\b;

zp=-1:0.01:1; rp=zp; [Rp,Zp]=meshgrid(rp,zp);
np=length(zp);
psi=zeros(np); psi_exact=zeros(np);
for i=1:np
    for j=1:np
        psi_exact(i,j) = 1/2*U*rp(i)^2*(1 - a^3/sqrt(rp(i)^2+zp(j)^2)^3);
        %psi from von_karman
        qq=0;
        for k=1:n
            q=Q(k)*U;
            d_=sqrt(rp(i)^2+(zp(j)-zs(k+1))^2);
            d=sqrt(rp(i)^2+(zp(j)-zs(k))^2);
            qq=qq+q*(d_-d);
        end
        psi(i,j) = 1/2*U*rp(i)^2 + qq;
    end
end
subplot(121);contour(Rp,Zp,psi,-10:0.1:2,'ShowText','on');title('von karman');
subplot(122);contour(Rp,Zp,psi_exact,-10:0.1:2,'ShowText','on');title('exact');