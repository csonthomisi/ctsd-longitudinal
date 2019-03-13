%% Választott modell a Trucksimbõl:
% ControlTheory01 dataset
% 
% Simulink model: .mdl
% Longitudinal force at wheel center az input!!!
% Mappa: Asztal/ControlTheory01/
% Motor: 150kW, 7spd, AT, 4WD
% Road: Long Road ControlTheory01
% Straight -> Straight ControlTheory01
% Center Line elevation: 10 meter dip
% Mû 0,85
%% Imputs
torque = 1000; % [Nm]
brake_force = 0; % [N]

theta = 180; % [fok] Lejtõ dõlésszög
thetarad = theta * pi / 180;
%% Datas
g = 9.81; % [m/s^2]
%% Vechicle datas
% Wheel radius
r1 = 0.51;
r2 = 0.51;
r3 = 0.51;
r4 = 0.51;


% Rolling Friction Coefficient
% Meg kellene találni...
Cf1 = 1;
Cf2 = 1;
Cf3 = 1;
Cf4 = 1;
% Wheel Inertia
J1 = 0.9;
J2 = 0.9;
J3 = 0.9;
J4 = 0.9;
% Force from car weight 
% Car 600kg
% Wheels 160 kg
Fz = 760*g; %[N]

Fz1 = Fz / 4;
Fz2 = Fz / 4;
Fz3 = Fz / 4;
Fz4 = Fz / 4;

%% Drag force constants
% Fd = 1/2*Ro*A*Cd*v^2 = Drag_force_constant * v^2
Ro = 1.206; % [kg/m3], Air Density
A = 6.8; % [m], Front Surface
Cd = 0.68; % Drag Coefficient
Drag_force_constant = 0.5 * Ro * A * Cd; % ~ 0.365

%% Rolling resistance
% Rx = Cr * m * g * cos(theta)
Cr = 1; % Rolling resistance
m = Fz / g; % Weight of the Vehicle
Rx = Cr * m * g * cos(thetarad); 

%% Fs
% Fs = m * g * sin(theta)
Fs = m * g * sin(thetarad);

%% Start the model
open('Longitudinal_model')
%sim('Longitudinal_model') % Szimuláció futtatása
