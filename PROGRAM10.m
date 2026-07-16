clc;
clear;
density = zeros(1,4);
width = zeros(1,4);
height = zeros(1,4);
thickness = zeros(1,4);
sea = zeros(1,4);
volume = zeros(1,4);
mass = zeros(1,4);
energy = zeros(1,4);
totalMass = 0;
totalEnergy = 0;
fprintf('HYBRID IMPACT ATTENUATOR CALCULATOR\n\n');
for i = 1:4
    fprintf('\nLayer %d\n',i);
    density(i) = input('Density (kg/m^3): ');
    width(i) = input('Width (mm): ');
    height(i) = input('Height (mm): ');
    thickness(i) = input('Thickness (mm): ');
    sea(i) = input('SEA (kJ/kg): ');
    volume(i) = width(i) * height(i) * thickness(i);
    volume(i) = volume(i)/1e9;
    mass(i) = density(i) * volume(i);
    energy(i) = sea(i) * mass(i) * 1000;
    totalMass = totalMass + mass(i);
    totalEnergy = totalEnergy + energy(i);
end
overallSEA = totalEnergy/(1000*totalMass);
fprintf('\n================================================================
====\n');
fprintf('Layer\tMass (kg)\tEnergy (J)\tSEA (kJ/kg)\n');
fprintf('=================================================================
===\n');
for i = 1:4
    fprintf('%d\t%.4f\t\t%.2f\t\t%.2f\n', ...
        i, mass(i), energy(i), sea(i));
end
fprintf('=================================================================
===\n');
fprintf('Total Mass : %.4f kg\n',totalMass);
fprintf('Total Energy : %.2f J\n',totalEnergy);
fprintf('Overall SEA : %.4f kJ/kg\n',overallSEA);
fprintf('=================================================================
===\n');