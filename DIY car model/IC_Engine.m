%% Engine Simulink script

% Declaring the constants
MFL=5;              %fuel max capacity in litres
Initial_FL=1;       %percent of total capacity at start
fuel_density=719.7; %petrol density (kg/m^3)

%%
%Initializing engine maps
%engine speed mapped
load('Map_speed');
speed_units='rad/sec';
load('Map_throtte');
throttle_units='1';
load('Map_torque');
trq_units='Nm';

%%
%Initializing gas tank
%engine fuel consumption
load('Fual_Map_spd');
load('Fual_Map_trq');
load('Fual_Map_fuel');
fuel_units='g/sec';

%%
%this plots the engine performance graph
figure(1)
[x,y]=meshgrid(map_spd,map_throttle);
surf(x,y,map_trq)

%this plots fuel consumption graph
figure(2)
[x,y]=meshgrid(fuelmap_spd,fuelmap_trq);
surf(x,y,fuelmap_fuel)
