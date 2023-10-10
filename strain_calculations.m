clear; clc;

%% Constants
E = 280e6; % Youngs Modulus of PP
GF = 2; % Gauge Factor
R = 350; % Wheatstone Bridge Resistance
h = 0.4e-3; % beam thickness
b = 10e-3; % beam height
Vin = 4.5; % excitation voltage

syms F L Vb E % applied force and location
%% Calculations

e = F*L/(1/6 * b * h^2 * E);
delR = R * GF * e;
V = Vin * ((R + delR)/(R+R+delR)-(R/(R+R)));
eqn = Vb == V;
F = vpa(simplify(solve(eqn, F)),4)
