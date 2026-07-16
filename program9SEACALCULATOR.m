clc;
clear;
fprintf('SPECIFIC ENERGY ABSORPTION CALCULATOR\n\n');
energy = input('Energy Absorbed (J): ');
mass = input('Mass (kg): ');
sea = energy/(1000*mass);
fprintf('\n--------------------------------\n');
fprintf('SEA = %.4f kJ/kg\n',sea);
fprintf('--------------------------------\n');