clc;clear
U=1;a=1;b=0.9;
yp=0.199; xp = b-sqrt(a^2-yp^2);
zp=xp+1i*yp;

x=-2:.1:2;y=x;z=x+1i*y;
[X,Y]=meshgrid(x,y);Z=X+1i*Y; n=length(x);

% % Inside-circle points are Excluded!
for i = 1:length(X)
    for j = 1:length(Y)
        if abs(Z(i,j)-zp)<=a-1e-5
            Z(i,j) = NaN;
        end
    end
end

ZZ=Z-zp*ones(n);w=complex_pot(ZZ,U,a,yp);
ZZ_=Z+b^2./Z;

% airfoil
theta=0:.1:2*pi;theta=theta';
zc=a*exp(1i*theta)+zp*ones(length(theta),1);za=zc+b^2./zc;

subplot(121);hold on;contour(real(Z),imag(Z),imag(w),-5:.1:5);
fill(real(zc),imag(zc),'y');title('Circle');
subplot(122);hold on;contour(real(ZZ_),imag(ZZ_),imag(w),-5:.1:5);
fill(real(za),imag(za),'y');title('Joukowski');
axis([-2 2 -2 2]);

function w = complex_pot(zprime, U,a,yp)
w = U*(zprime + a^2./zprime + 1i*2*yp*log(zprime/a)); 
end