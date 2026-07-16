clc;
clear;
density = input('Density (kg/m^3): ');
volume = input('Volume (m^3): ');
mass = density * volume;
fprintf('\nMass = %.4f kg\n',mass);
