clc;
clear;
bestMass = 100000;
bestWidth = 0;
disp('=========================================');
disp('WIDTH SWEEP OPTIMIZATION PROGRAM');
disp('=========================================');
density = input('Density (kg/m3) : ');
height = input('Height (mm) : ');
thickness = input('Thickness (mm) : ');
sea = input('SEA (kJ/kg) : ');
wMin = input('Minimum Width (mm) : ');
wMax = input('Maximum Width (mm) : ');
step = input('Width Step (mm) : ');
fprintf(('\n==========\n');
fprintf('Width Area(mm2) Mass(kg) Energy(J)\n');
fprintf('=======\n');
for width = wMin:step:wMax
    area = width * height;
    volume = area * thickness;
    volume = volume / 1e9;
    mass = density * volume;
    energy = sea * mass * 1000;
    fprintf('%5d %15.2f %12.4f %14.2f\n', ...
        width, area, mass, energy);
    if energy >= 7350
        if mass < bestMass
            bestMass = mass;
            bestWidth = width;
        end
    end
end
fprintf('\n=========================================\n');
if bestWidth == 0
    fprintf('No feasible width satisfies 7350 J.\n');
else
    fprintf('OPTIMUM WIDTH = %d mm\n', bestWidth);
    fprintf('Minimum Mass = %.4f kg\n', bestMass);
end
fprintf('=========================================\n');