clc;
clear;
LAYUPS = 6;
% Laminate Data
laminate(1).layup = '[0]8';
laminate(1).sea = 0.95;
laminate(1).stiffness = 10;
laminate(1).delamination = 4;
laminate(2).layup = '[0/90]2s';
laminate(2).sea = 1.10;
laminate(2).stiffness = 9;
laminate(2).delamination = 6;
laminate(3).layup = '[+45/-45]2s';
laminate(3).sea = 1.45;
laminate(3).stiffness = 6;
laminate(3).delamination = 10;
laminate(4).layup = '[0/+45/-45/90]s';
laminate(4).sea = 1.35;
laminate(4).stiffness = 8;
laminate(4).delamination = 9;
laminate(5).layup = '[0/45/-45/90]s';
laminate(5).sea = 1.30;
laminate(5).stiffness = 8;
laminate(5).delamination = 9;
laminate(6).layup = '[0/0/+45/-45/90]s';
laminate(6).sea = 1.20;
laminate(6).stiffness = 9;
laminate(6).delamination = 8;
fprintf('=============================================\n');
fprintf(' CFRP PLY ORIENTATION OPTIMIZATION\n');
fprintf('=============================================\n\n');
width = input('Width (mm): ');
height = input('Height (mm): ');
thickness = input('Thickness (mm): ');
density = input('Density (kg/m3): ');
volume = width * height * thickness;
volume = volume / 1e9;
bestScore = -1;
bestIndex = 1;
fprintf('\n=========================================================================================================\n');
fprintf('Layup Mass Energy SEA Stiffness Delamination Score\n');
fprintf('=========================================================================================================\n');
for i = 1:LAYUPS
    mass = density * volume;
    energy = laminate(i).sea * mass * 1000;
    score = ...
        0.40 * (energy / 7350.0) + ...
        0.30 * (laminate(i).sea / 1.50) + ...
        0.20 * (laminate(i).stiffness / 10.0) + ...
        0.10 * (laminate(i).delamination / 10.0);
    fprintf('%-24s %7.4f %9.2f %6.2f %10.2f %14.2f %10.3f\n', ...
        laminate(i).layup, ...
        mass, ...
        energy, ...
        laminate(i).sea, ...
        laminate(i).stiffness, ...
        laminate(i).delamination, ...
        score);
    if score > bestScore
        bestScore = score;
        bestIndex = i;
    end
end
fprintf('\n====================================================\n');
fprintf('OPTIMUM CFRP LAMINATE\n');
fprintf('====================================================\n');
fprintf('Layup : %s\n', laminate(bestIndex).layup);
fprintf('SEA : %.2f kJ/kg\n', laminate(bestIndex).sea);
fprintf('Optimization Score : %.3f\n', bestScore);
fprintf('====================================================\n');
