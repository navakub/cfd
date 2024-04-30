% Equation of state: polytrope
% https://en.wikipedia.org/wiki/Polytrope

clc;clear;close all

% Simulation parameters
tEnd            = 10;        % time at which simulation ends
dt              = 0.01;      % timestep
m               = 0.1;       % particle mass
h               = 0.01;      % smoothing length
rho_to_p_const  = 0.1;       % equation of state constant
n_poly          = 5;         % polytropic index
nu              = 0.01;        % damping
k_wall          = 1000;

% Create particles and define their initial locations
k = 1;
for px = 0 : 2*h : 0.2
    for py = 0 : 2*h : 1
        x(k,:) = [px py];
        k = k + 1;
    end
end

N = size(x,1); % Number of particles
a = zeros(N,2);
v_mhalf = zeros(N,2);
K = ceil(tEnd/dt);
X = zeros(N,2,K);      % log all position data during the simulation

tic
for i =1 : K
    v_phalf = v_mhalf + a * dt;
    x = x + v_phalf * dt;
    v = 0.5 * (v_mhalf + v_phalf);
    v_mhalf = v_phalf;

    % update densities, pressures, accelerations
    rho = CalculateDensity(x, m, h);
    P = rho_to_p_const * rho.^(1 + 1/n_poly);
    a = CalculateAcceleration(x, v, m, rho, P, nu, h);

    % apply contact force by the walls
    f_contact = CalculateContactForce(x, k_wall);
    a = a + f_contact / m;

    X(:,:,i) = x;

    plot(X(:,1,i), X(:,2,i), 'b.');
    hold on;plot([0,0,1,1],[1,0,0,1],'r');hold off
    axis equal;xlim([-0.1 1.1]);ylim([-0.1 1.1]);
    title("i = "+i)
    drawnow
end
toc