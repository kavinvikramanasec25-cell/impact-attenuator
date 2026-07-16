clc;
clear;
bestMass = 1000000.0;
bestHeight = 0;
fprintf('\n===========================================\n');
fprintf(' HEIGHT SWEEP OPTIMIZATION PROGRAM\n');
fprintf('===========================================\n\n');
density = input('Density (kg/m3) : ');
width = input('Width (mm) : ');
thickness = input('Thickness (mm) : ');
sea = input('SEA (kJ/kg) : ');
hMin = input('Minimum Height (mm) : ');
hMax = input('Maximum Height (mm) : ');
step = input('Height Step (mm) : ');
fprintf('\n=============\n');
fprintf('Height Area(mm2) Volume(m3) Mass(kg) Energy(J)\n');
fprintf('============\n');
for height = hMin:step:hMax
    area = width * height;
    volume = area * thickness;
    volume = volume / 1000000000.0;
    mass = density * volume;
    energy = sea * mass * 1000;
    fprintf('%5d %15.2f %15.6f %12.4f %15.2f\n', ...
        height, area, volume, mass, energy);
    if energy >= 7350
        if mass < bestMass
            bestMass = mass;
            bestHeight = height;
        end
    end
end
fprintf('\n===========================================\n');
if bestHeight == 0
    fprintf('NO FEASIBLE HEIGHT FOUND\n');
else
    fprintf('OPTIMUM HEIGHT = %d mm\n', bestHeight);
    fprintf('MINIMUM MASS = %.4f kg\n', bestMass);
end
fprintf('===========================================\n');
