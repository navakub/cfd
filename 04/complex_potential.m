clc;clear
%complex potential

n=50;
z0=0+0i;
x=linspace(-10,10,n);y=x;[X,Y]=meshgrid(x,y);

Z=X+1i*Y;
Z0=z0*ones(n);
%uniform
alpha=pi/6;U=100;
w1=U*Z*exp(-1i*alpha);
phi1=real(w1);psi1=imag(w1);

%source sink
L=3000/(2*pi); %L=lambda/(2*pi)
w2=L*log(Z-Z0);
phi2=real(w2);psi2=imag(w2);

%vortex
G=100/(2*pi); %G=gamma/(2*pi)
w3=(1i*G)*log(Z-Z0);
phi3=real(w3);psi3=imag(w3);

%doublet
K=1000/(2*pi); %K=kappa/(2*pi)
w4=K./(Z-Z0);
phi4=real(w4);psi4=imag(w4);


subplot(231);contour(X,Y,phi1,10);hold on;contour(X,Y,psi1,10);title('uniform');
subplot(232);contour(X,Y,phi2,10);hold on;contour(X,Y,psi2,10);title('source-sink');
subplot(233);contour(X,Y,phi3,10);hold on;contour(X,Y,psi3,10);title('vortex');
subplot(234);contour(X,Y,phi4,10);hold on;contour(X,Y,psi4,10);title('doublet');
subplot(235);contour(X,Y,phi1+phi4,11);hold on;contour(X,Y,psi1+psi4,11);title('uniform+doublet');
subplot(236);contour(X,Y,phi1+phi3+phi4,11);hold on;contour(X,Y,psi1+psi3+psi4,11);title('uniform+doublet+vortex');