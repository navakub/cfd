clc;clear
%flow past circular cylinder
a=2; U=1;

h=0.1;nt=1000;
for i=1:20
    x0=-10;y0=-10+(i-1);
    %disp([x0 y0]);
    plot(x0,y0,'xb');
     for it=1:nt
        theta=atan(y0/x0);r=sqrt(x0^2+y0^2);
%         vx_u=U*cos(theta);vy_u=U*sin(theta);
%         k=K/(2*pi);vx_d=-k*(2*x0*y0/r^4);vy_d=-k*(2*(y0^2-x0^2)/r^4);
%         vx=vx_d+vx_u;
%         vy=vy_d+vy_u;
        vr=U*(1-a^2/r^2)*cos(theta);vt=-U*(1+a^2/r^2)*sin(theta);
        vx=vr*cos(theta)-r*vt*sin(theta);
        vy=vr*sin(theta)+r*vt*cos(theta);
        %vx=vx/norm(vx);vy=vy/norm(vy);
        x1=x0+h*vx;
        y1=y0+h*vy;
        %disp([x1 y1]);
        plot(x1,y1,'or');hold on;
        x0=x1;y0=y1;
     end
end
     axis([-10 10 -10 10]);



