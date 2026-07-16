clc;
clear;
density = [1600 80 450 120];
seaMaterial = [1.15 26.30 4.77 9.20];
bestScore = -1;
bestMass = 0;
bestEnergy = 0;
bestSEA = 0;
bestForce = 0;
bestG = 0;
bestCFRP = 0;
bestHoney = 0;
bestFoam = 0;
bestPU = 0;
bestWidth = 0;
bestHeight = 0;
fprintf('\nSearching Design Space...\n');
for tc = 10:10:30
for th = 40:10:90
for tf = 30:10:80
for tp = 20:10:70
for width = 70:10:110
for height = 140:20:220
volume = zeros(1,4);
t = [tc th tf tp];
totalMass = 0;
totalEnergy = 0
for i = 1:4
    volume(i) = width * height * t(i);
    volume(i) = volume(i) / 1e9;
    mass = density(i) * volume(i);
    energy = seaMaterial(i) * mass * 1000;
    totalMass = totalMass + mass;
    totalEnergy = totalEnergy + energy;
end
overallSEA = totalEnergy / (1000 * totalMass);
totalThickness = tc + th + tf + tp;
force = totalEnergy / (totalThickness / 1000);
peakG = force / (300 * 9.81);
score = ...
    0.35 * (overallSEA / 10.0) + ...
    0.35 * (totalEnergy / 7358.0) + ...
    0.20 * (1.5 - totalMass) + ...
    0.10 * (40.0 / peakG);
if score > bestScore
    bestScore = score;
    bestMass = totalMass;
    bestEnergy = totalEnergy;
    bestSEA = overallSEA;
    bestForce = force;
    bestG = peakG;
    bestCFRP = tc;
    bestHoney = th;
    bestFoam = tf;
    bestPU = tp;
    bestWidth = width;
    bestHeight = height;
end
end
end
end
end
end
end
fprintf('\n============================================\n');
fprintf('OPTIMUM IMPACT ATTENUATOR DESIGN\n');
fprintf('============================================\n');
fprintf('CFRP Thickness : %d mm\n', bestCFRP);
fprintf('Honeycomb Thickness : %d mm\n', bestHoney);
fprintf('Al Foam Thickness : %d mm\n', bestFoam);
fprintf('PU Foam Thickness : %d mm\n', bestPU);
fprintf('Width : %d mm\n', bestWidth);
fprintf('Height : %d mm\n', bestHeight);
fprintf('Total Mass : %.3f kg\n', bestMass);
fprintf('Total Energy : %.2f J\n', bestEnergy);
fprintf('Overall SEA : %.2f kJ/kg\n', bestSEA);
fprintf('Peak Force : %.2f N\n', bestForce);
fprintf('Peak g : %.2f\n', bestG);
fprintf('Optimization Score : %.3f\n', bestScore);
fprintf('============================================\n');
