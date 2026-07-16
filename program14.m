clc;
clear;
bestMass = 999999;
bestDensity = 0;
disp('=============================================');
disp('DENSITY SWEEP OPTIMIZATION PROGRAM');
disp('=============================================');
width = input('Width (mm) : ');
height = input('Height (mm) : ');
thickness = input('Thickness (mm) : ');
sea = input('SEA (kJ/kg) : ');
dMin = input('Minimum Density (kg/m3) : ');
dMax = input('Maximum Density (kg/m3) : ');
step = input('Density Step (kg/m3) : ');
area = width * height;
volume = area * thickness;
volume = volume / 1e9;
fprintf('\n==========================================================\n');
fprintf('Density Volume(m3) Mass(kg) Energy(J) SEA(kJ/kg)\n');
fprintf('============================================================\n');
for density = dMin:step:dMax
    mass = density * volume;
    energy = sea * mass * 1000;
    fprintf('%6d %15.6f %15.4f %15.2f %15.2f\n', ...
        density, volume, mass, energy, sea);
    if energy >= 7350
        if mass < bestMass
            bestMass = mass;
            bestDensity = density;
        end
    end
end
fprintf('\n=============================================\n');
if bestDensity == 0
    fprintf('NO FEASIBLE MATERIAL FOUND\n');
else
    fprintf('OPTIMUM DENSITY = %d kg/m3\n', bestDensity);
    fprintf('MINIMUM MASS = %.4f kg\n', bestMass);
end
fprintf('=============================================\n');