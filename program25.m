clc;
clear;
density = [1600 80 450 120];
materialSEA = [1.15 26.30 4.77 9.20];
bestScore = -1;
bestMass = 0;
bestEnergy = 0;
bestSEA = 0;
bestForce = 0;
bestPeakG = 0;
bestSafety = 0;
bestTc = 0;
bestTh = 0;
bestTf = 0;
bestTp = 0;
bestWidth = 0;
bestHeight = 0;
fprintf('Searching Complete Design Space...\n');
for tc = 10:10:30
for th = 40:10:90
for tf = 30:10:80
for tp = 20:10:70
for width = 70:10:110
for height = 140:20:220
thickness = [tc th tf tp];
totalMass = 0;
totalEnergy = 0;
for i = 1:4
volume = width * height * thickness(i);
volume = volume / 1e9;
mass = density(i) * volume;
energy = materialSEA(i) * mass * 1000;
totalMass = totalMass + mass;
totalEnergy = totalEnergy + energy;
end
overallSEA = totalEnergy / (1000 * totalMass);
totalThickness = tc + th + tf + tp;
peakForce = totalEnergy / (totalThickness / 1000);
peakG = peakForce / (300 * 9.81);
safety = 40.0 / peakG;
if totalEnergy >= 7358 && ...
        totalMass <= 2.0 && ...
        peakForce <= 80000 && ...
        peakG <= 40 && ...
        overallSEA >= 5.0
    score = ...
        0.30 * (totalEnergy / 7358.0) + ...
        0.25 * (overallSEA / 6.0) + ...
        0.20 * (1 - totalMass / 2.0) + ...
        0.15 * (40.0 / peakG) + ...
        0.10 * (80000.0 / peakForce);
if score > bestScore
bestScore = score;
bestMass = totalMass;
bestEnergy = totalEnergy;
bestSEA = overallSEA;
bestForce = peakForce;
bestPeakG = peakG;
bestSafety = safety;
bestTc = tc;
bestTh = th;
bestTf = tf;
bestTp = tp;
bestWidth = width;
bestHeight = height;
end
end
end
end
end
end
end
end
fprintf('\n==============================================\n');
fprintf('FINAL OPTIMUM DESIGN\n');
fprintf('==============================================\n');
fprintf('CFRP Thickness : %d mm\n', bestTc);
fprintf('Honeycomb Thickness : %d mm\n', bestTh);
fprintf('Al Foam Thickness : %d mm\n', bestTf);
fprintf('PU Foam Thickness : %d mm\n', bestTp);
fprintf('Width : %d mm\n', bestWidth);
fprintf('Height : %d mm\n', bestHeight);
fprintf('Total Mass : %.3f kg\n', bestMass);
fprintf('Total Energy : %.2f J\n', bestEnergy);
fprintf('Overall SEA : %.2f kJ/kg\n', bestSEA);
fprintf('Peak Force : %.2f N\n', bestForce);
fprintf('Peak Deceleration : %.2f g\n', bestPeakG);
fprintf('Safety Factor : %.2f\n', bestSafety);
fprintf('Optimization Score : %.3f\n', bestScore);
fprintf('==============================================\n');