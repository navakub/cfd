function [] = plot2(t, xe, xh, ye, yh, tex, xex, yex)
% plot solutions (problem 2)

subplot(2,2,1);
plot(t,xe); hold on;
plot(t,xh);
plot(tex,xex);
xlabel('t'); ylabel('\theta');
legend('euler','heun','exact');

subplot(2,2,[2 4]);
plot(xe,ye); hold on;
plot(xh,yh);
plot(xex,yex);
xlabel('\theta'); ylabel('\omega');
legend('euler','heun','exact');

subplot(2,2,3);
plot(t,ye); hold on;
plot(t,yh);
plot(tex,yex);
xlabel('t'); ylabel('\omega');
legend('euler','heun','exact');

end

