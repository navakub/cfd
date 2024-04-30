clc;clear;close all;


% solve Laplace equation V_xx+V_yy=0
% semi circle
O = [0  0. ];  % origin of circle 
a = 0.3 ;         % RAdius of circle 

%space
n=10;
x = linspace(-a,a,n) ; hx=x(2)-x(1);
y = linspace(0,a,n) ; hy=y(2)-y(1);
[X,Y] = meshgrid(x,y) ;

%semicircular pipe
th = linspace(0,pi) ;
xc = O(1)+a*cos(th) ; 
yc = O(2)+a*sin(th) ; 

%pipe
px=[xc a -a];
py=[yc 0 0];
% Get points lying inside the pipe 
in = inpolygon(X(:),Y(:),px,py) ;
Xa=X(in); Ya=Y(in);



V0=1; %initial condition

%mapping
Za=(Xa+1i*Ya)/a;
V=V0 * angle(((1+Za)./(1-Za)))*2/pi; % laplace solution (potential)

% finite difference
Va = zeros(length(Xa),1); Va_ = Va;
alpha=cos(pi/n)+cos(pi/n);a2=alpha^2;beta=(8-4*sqrt(4-a2))/a2;
for it=1:10000
    r=norm(Va(:));
    for i=1:length(Va_)
        if(Ya(i)==0)
            Va(i)=0;
            Va_(i)=0;
        elseif(Ya(i)-yc(i)==0)
            Va(i)=V0;
            Va_(i)=V0;
        end
    end
    for i=1:length(Va_)-1
%         if(Ya(i)~=0 && Ya(i)~=a)
%             if(Xa(i)==min(Xa)+hx) %left
%                 a = abs(-sqrt(a^2-Ya(i)^2)-Xa(i));
%                 b = hx;
%                 c = hy;
%                 d = hy;
%                 Vaa=1;
%                 Vab=Va(Xa==Xa(i)+hx);
%                 Vac=Va(Ya==Ya(i)-hy);
%                 Vad=Va(Ya==Ya(i)+hy);
%             elseif(Xa(i)==max(Xa)-hx) %right
%                 a = hx;
%                 b = abs(sqrt(a^2-Ya(i)^2)-Xa(i));
%                 c = hy;
%                 d = hy;
%                 Vaa=Va(Xa==Xa(i)-hx);
%                 Vab=1;
%                 Vac=;
%                 Vad=;
%             elseif(Y(i)==max(Ya)) %top
%                 Vad=1;
%                 if(Xa(i)==min(Xa)+hx) %left again
%                     a = abs(-sqrt(a^2-Ya(i)^2)-Xa(i));
%                     b = hx;
%                     c = hy;
%                     d = hy;
%                      Vaa=1;
%                         Vab=;
%                         Vac=;
%                         Vad=;
%                 elseif(Xa(i)==max(Xa)-hx) %right again
%                     a = hx;
%                     b = abs(sqrt(a^2-Ya(i)^2)-Xa(i));
%                     c = hy;
%                     d = hy;
%                      Vaa=;
%                     Vab=1;
%                     Vac=;
%                     Vad=;
%                 end
%             elseif(Ya(i)==min(Ya)+hy)
%                 Vac=0;
%                 if(Xa(i)==min(Xa)+hx) %left again
%                     a = abs(-sqrt(a^2-Ya(i)^2)-Xa(i));
%                     b = hx;
%                     c = hy;
%                     d = hy;
%                      Vaa=1;
%                     Vab=;
%                     Vac=;
%                     Vad=;
%                 elseif(Xa(i)==max(Xa)-hx) %right again
%                     a = hx;
%                     b = abs(sqrt(a^2-Ya(i)^2)-Xa(i));
%                     c = hy;
%                     d = hy;
%                     Vaa=;
%                     Vab=1;
%                     Vac=;
%                     Vad=;
%                 end
%             else
%                 a = hx;
%                 b = hx;
%                 c = hy;
%                 d = hy;   
%                  Vaa=Va(Xa(i)-hx);
%                 Vab=;
%                 Vac=;
%                 Vad=;
%             end
%             Va_(i) = a*b*c*d/(a*b+c*d)*(Vaa/a/(a+b) + Vab/b/(a+b) + Vac/c/(c+d) + Vad/d/(c+d)); 
%         end
    end
    Va=Va_;
    r_=norm(Va_(:));
    if abs(r-r_)<1e-10
        break
    end
    r=r_;
end

% u = diff(V,1,2)./diff(X,1,2);
% v = diff(V,1,1)./diff(Y,1,1);

% % % outside-circle points are Excluded
% for i = 1:n
%     for j = 1:n
%         if norm([X(i,j) Y(i,j)])>a
%             V(i,j) = NaN;
%             Va_(i,j) = NaN;
% %             u(i,j) = NaN;
% %             v(i,j) = NaN;
%         end
%     end
% end


% plot 
figure;
subplot(121);
hold on;
contourf(X,Y,V,10,'ShowText','on');
plot(xc,yc,'xk')
xlabel('x');ylabel('y');title('potential (map)'); colorbar()

subplot(122);
hold on;
contourf(X,Y,Va_,10,'ShowText','on');
plot(xc,yc,'xk')
xlabel('x');ylabel('y');title('potential (FD)'); colorbar()