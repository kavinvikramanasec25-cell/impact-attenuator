clc;
clear;
bestMass = 100000;
bestThickness = 0;
disp('=====================================');
disp('THICKNESS SWEEP OPTIMIZATION PROGRAM');
disp('=====================================');
density = input('Density (kg/m3) : ');
width = input('Width (mm) : ');
height = input('Height (mm) : ');
sea = input('SEA (kJ/kg) : ');
tMin = input('Minimum Thickness (mm) : ');
tMax = input('Maximum Thickness (mm) : ');
step = input('Thickness Step (mm) : ');
fprintf('\n--------------------------------------------------------------\n');
fprintf('Thickness Mass(kg) Energy(J)\n');
fprintf('--------------------------------------------------------------\n');
for t = tMin:step:tMax
    volume = width * height * t;
    volume = volume / 1e9;
    mass = density * volume;
    energy = sea * mass * 1000;
    fprintf('%5d %15.4f %15.2f\n', t, mass, energy);
    if energy >= 7350
        if mass < bestMass
            bestMass = mass;
            bestThickness = t;
end
end
end
fprintf('\n=====================================\n');
if bestThickness == 0
    fprintf('NO FEASIBLE DESIGN FOUND\n');
else
    fprintf('OPTIMUM THICKNESS = %d mm\n', bestThickness);
    fprintf('MINIMUM MASS = %.4f kg\n', bestMass);
end
fprintf('=====================================\n');