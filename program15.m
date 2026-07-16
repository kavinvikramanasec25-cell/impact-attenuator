clc;
clear;
MATERIALS = 6;
LAYERS = 4;
name = {'CFRP','Al Honeycomb','Al Foam', ...
    'PU Foam','PVC Foam','PET Foam'};
density = [1600 80 450 120 70 110];
sea = [1.15 26.30 4.77 9.20 12.50 11.20];
width = [70 80 90 100];
height = [140 160 180 200];
thickness = [20 70 60 50];
totalMass = 0;
totalEnergy = 0;
disp('=============================================');
disp('HYBRID MATERIAL COMBINATION GENERATOR');
disp('=============================================');
disp(' ');
disp('Available Materials');
disp(' ');
for i = 1:MATERIALS
    fprintf('%d. %-15s Density=%6.1f SEA=%5.2f\n', ...
        i, name{i}, density(i), sea(i));
end
disp(' ');
disp('Select material for each layer');
disp(' ');
choice = zeros(1,LAYERS);
for i = 1:LAYERS
    choice(i) = input(sprintf('Layer %d Material ID : ',i));
    if choice(i) < 1 || choice(i) > MATERIALS
        disp('Invalid Selection');
        return;
    end
end
fprintf('\n===============\n');
fprintf('Layer Material Mass(kg) Energy(J)\n');
fprintf('=================\n');
for i = 1:LAYERS
    volume = width(i) * height(i) * thickness(i);
    volume = volume / 1e9;
    mass = density(choice(i)) * volume;
    energy = sea(choice(i)) * mass * 1000;
    totalMass = totalMass + mass;
    totalEnergy = totalEnergy + energy;
    fprintf('%3d %-15s %10.4f %15.2f\n', ...
        i, name{choice(i)}, mass, energy);
end
fprintf('=====================================\n');
fprintf('Total Mass = %.4f kg\n', totalMass);
fprintf('Total Energy = %.2f J\n', totalEnergy);
fprintf('Overall SEA = %.2f kJ/kg\n', ...
    totalEnergy/(1000*totalMass));
if totalEnergy >= 7350
    fprintf('\nSTATUS : FEASIBLE DESIGN\n');
else
    fprintf('\nSTATUS : NOT FEASIBLE\n');
end
