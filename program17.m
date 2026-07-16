clc;
clear;
cellSize = [3.2 4.8 6.4 9.5 12.7 19.0];
fprintf('===============================================\n');
fprintf(' ALUMINIUM HONEYCOMB CELL SIZE OPTIMIZATION\n');
fprintf('===============================================\n\n');
density = input('Density (kg/m3) : ');
width = input('Width (mm) : ');
height = input('Height (mm) : ');
thickness = input('Thickness (mm) : ');
sea = input('SEA (kJ/kg) : ');
volume = width * height * thickness;
volume = volume / 1e9;
bestScore = 0;
bestCell = 0;
fprintf('\n===========================================================\n');
fprintf('Cell(mm) Mass(kg) Energy(J) CrushStress(MPa) Efficiency(%%) Score\n');
fprintf('=============================================================\n');
for i = 1:length(cellSize)
    mass = density * volume;
    energy = sea * mass * 1000;
    stress = 250.0 / cellSize(i);
    efficiency = 100.0 / cellSize(i);
    score = (energy * efficiency) / (stress + 1);
    fprintf('%7.1f %10.4f %12.2f %15.2f %15.2f %12.2f\n', ...
        cellSize(i), mass, energy, stress, efficiency, score);
    if score > bestScore
        bestScore = score;
        bestCell = cellSize(i);
    end
end
fprintf('\n===============================================\n');
fprintf('OPTIMUM CELL SIZE = %.1f mm\n', bestCell);
fprintf('BEST SCORE = %.2f\n', bestScore);
fprintf('===============================================\n');
