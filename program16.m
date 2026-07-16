clc;
clear;
LAYERS = 4;
SEQUENCES = 6;
% Material Data
material(1).name = 'CFRP';
material(1).density = 1600;
material(1).sea = 1.15;
material(2).name = 'Al Honeycomb';
material(2).density = 80;
material(2).sea = 26.30;
material(3).name = 'Al Foam';
material(2).density = 80;
material(2).sea = 26.30;
material(3).name = 'Al Foam';
material(3).density = 450;
material(3).sea = 4.77;
material(4).name = 'PU Foam';
material(4).density = 120;
material(4).sea = 9.20;
width = [70 80 90 100];
height = [140 160 180 200];
thickness = [20 70 60 50];
sequence = [
    1 2 3 4;
    1 3 2 4;
    2 1 3 4;
    2 3 4 1;
    3 2 1 4;
    4 3 2 1
    ];
weight = [4 3 2 1];
bestScore = 0;
bestSequence = 1;
fprintf('\n============================================================\n');
fprintf(' LAYER SEQUENCE OPTIMIZATION PROGRAM\n');
fprintf('=========================\n');
for s = 1:SEQUENCES
    totalMass = 0;
    totalEnergy = 0;
    score = 0;
    fprintf('\n----------------------------------------------------------\n');
    fprintf('Sequence %d\n', s);
    fprintf('----------------------------------------------------------\n');
    for i = 1:LAYERS
        m = sequence(s,i);
        volume = width(i) * height(i) * thickness(i);
        volume = volume / 1e9;
        mass = material(m).density * volume;
        energy = material(m).sea * mass * 1000;
        score = score + material(m).sea * weight(i);
        totalMass = totalMass + mass;
        totalEnergy = totalEnergy + energy;
        fprintf('%d -> %-15s Mass=%7.4f Energy=%8.2f\n', ...
            i, material(m).name, mass, energy);
    end
    fprintf('\nTotal Mass = %.4f kg\n', totalMass);
    fprintf('Total Energy = %.2f J\n', totalEnergy);
    fprintf('Sequence Score = %.2f\n', score);
    if score > bestScore
        bestScore = score;
        bestSequence = s;
    end
end
fprintf('\n==============================================================\n');
fprintf('BEST LAYER SEQUENCE\n');
fprintf('==============================================================\n');
for i = 1:LAYERS
    fprintf('%d. %s\n', i, material(sequence(bestSequence,i)).name);
end  
fprintf('\nBest Score = %.2f\n', bestScore);