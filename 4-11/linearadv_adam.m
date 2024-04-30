clc;clear
h=.01; u=100; dt=.1*h/u;
x=0:h:1; nx=length(x);
p=0.1+0.1*exp(-1000*(x-.2).^2); p1=p; p2=p;
alpha=u*dt/(2*h);
for it=1:1000
    for ix=2:nx-1
        p2(ix)=p1(ix)+alpha*(-1.5*(p1(ix+1)-p1(ix-1)) + .5*(p(ix+1)-p(ix-1)));
    end

    p2(1)=p1(1)+alpha*(-1.5*(p1(2)-p1(nx)) + .5*(p(2)-p(nx)));
    p2(nx)=p1(nx)+alpha*(-1.5*(p1(1)-p1(nx-1)) + .5*(p(1)-p(nx-1)));

    p=p1;p1=p2;
    plot(x,p2); axis([0 1 0 .21]); title("it="+it); drawnow;
end
