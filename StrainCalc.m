function F = StrainCalc(Vb, E, L)
%% Constants
GF = 2; % Gauge Factor
R = 350; % Wheatstone Bridge Resistance
h = 0.4e-3; % beam thickness
b = 10e-3; % beam height
Vin = 4.5; % excitation voltage

syms F
%% Calculations


e = F*L/(1/6 * b * h^2 * E);
delR = R * GF * e;
V = Vin * ((R + delR)/(R+R+delR)-(R/(R+R)));
eqn = Vb == V;
F = vpa(solve(eqn, F),5);
