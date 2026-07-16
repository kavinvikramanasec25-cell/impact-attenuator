clc;
clear;
MATERIALS = 6;
density = [200 300 400 500 600 700];
sea = [5.60 5.30 5.00 4.77 4.40 4.10];
fprintf('=============================================\n');
fprintf(' ALUMINIUM FOAM DENSITY OPTIMIZATION\n');
fprintf('=============================================\n\n');
width = input('Width (mm) : ');
height = input('Height (mm) : ');
thickness = input('Thickness (mm) : ');
volume = width * height * thickness;
volume = volume / 1e9;
bestScore = -1.0;
bestIndex = 1;
fprintf('\n=================================================================================\n');
fprintf('Density Mass(kg) Energy(J) SEA Plateau(MPa) Efficiency Score\n');
fprintf('===========================================================================================================\n');
for i = 1:MATERIALS
    mass = density(i) * volume;
    energy = sea(i) * mass * 1000.0;
    plateau = 0.045 * density(i);
    efficiency = energy / (mass * 1000.0);
    score = ...
        0.40 * (energy / 7350.0) + ...
        0.30 * (sea(i) / 6.0) + ...
        0.20 * (plateau / 30.0) + ...
        0.10 * (1.0 - mass / 1.5);
    fprintf('%6.0f %10.4f %12.2f %7.2f %12.2f %12.2f %8.3f\n', ...
        density(i), mass, energy, sea(i), plateau, efficiency, score);
    if score > bestScore
        bestScore = score;
        bestIndex = i;
    end
end
fprintf('\n===================================================\n');
fprintf('OPTIMUM ALUMINIUM FOAM\n');
fprintf('===================================================\n');
fprintf('Density : %.0f kg/m3\n', density(bestIndex));
fprintf('SEA : %.2f kJ/kg\n', sea(bestIndex));
fprintf('Optimization Score : %.3f\n', bestScore);
fprintf('===================================================\n');
