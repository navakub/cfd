clc;clear;close all;


% solve Laplace equation V_xx+V_yy=0
% semi circle
O = [0  0. ];  % origin of circle 
a = 1.4 ;         % RAdius of circle 

%space
n=250;
x = linspace(-a,a,n) ; hx=x(2)-x(1);
y = linspace(0,a,n) ; hy=y(2)-y(1);
[X,Y] = meshgrid(x,y) ;

%semicircular pipe
th = linspace(0,pi) ;
xc = O(1)+a*cos(th) ; 
yc = O(2)+a*sin(th) ; 


V0=1; %initial condition

%mapping
Z=(X+1i*Y)/a;
V=V0 * angle(((1+Z)./(1-Z)))*2/pi; % laplace solution (potential)

% finite difference
Va = zeros(length(X)); Va_ = Va;
% outside-circle points are Excluded
for i = 1:n
    for j = 1:n
        if norm([X(i,j) Y(i,j)])>a
            V(i,j) = NaN;
            Va_(i,j) = NaN;
        end
    end
end
alpha=cos(pi/n)+cos(pi/n);a2=alpha^2;beta=(8-4*sqrt(4-a2))/a2;
for it=1:10000
    r=norm(Va(:));
    for i=1:n
        for j=1:n
        if(Y(i)==0) %flat surface
            Va(i,j)=0;
            Va_(i,j)=0;
        elseif(isnan(Va_(i,j)))  %curved surface
            Va(i,j)=V0;
            Va_(i,j)=V0;
        end
        end
    end
    for ix=2:n-1
        for iy=2:n-1
            Va_(iy,ix) = Va(iy,ix) + beta/4*(Va_(iy,ix-1) + Va(iy,ix+1) + Va_(iy-1,ix) + Va(iy+1,ix) -4*Va(iy,ix)); %SOR
        end
    end
    Va=Va_;
    r_=norm(Va_(:));
    if abs(r-r_)<1e-10
        break
    end
    r=r_;
end


% outside-circle points are Excluded
for i = 1:n
    for j = 1:n
        if norm([X(i,j) Y(i,j)])>a
            V(i,j) = NaN;
            Va_(i,j) = NaN;
        end
    end
end

% plot map
figure;
subplot(121);
hold on;
contourf(X,Y,V,10,'ShowText','on');
plot(xc,yc,'-k')
xlabel('x');ylabel('y');title('potential (map)'); colorbar()


% plot FD
subplot(122);
hold on;
contourf(X,Y,Va_,10,'ShowText','on');
plot(xc,yc,'-k')
xlabel('x');ylabel('y');title('potential (FD)'); colorbar()