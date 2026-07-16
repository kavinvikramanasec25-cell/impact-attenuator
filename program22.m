clc;
clear;
DISTANCES = 9;
FACTORS = 4;
distance = [40 50 60 70 80 90 100 110 120];
factor = [1.20 1.30 1.40 1.50];
energy = 7358.0; % J
vehicleMass = 300.0; % kg
bestScore = -1;
bestDistance = 0;
bestFactor = 0;
fprintf('=============================================================\n');
fprintf(' PEAK DECELERATION OPTIMIZATION PROGRAM\n');
fprintf('=============================================================\n\n');
fprintf('=============================================================================================================================\n');
fprintf('Dist(mm) Factor AvgForce(N) PeakForce(N) Accel(m/s2) PeakG Injury Safety Score\n');
fprintf('=============================================================================================================================\n');
for i = 1:DISTANCES
    avgForce = energy / (distance(i) / 1000.0);
    for j = 1:FACTORS
        peakForce = avgForce * factor(j);
        acceleration = peakForce / vehicleMass;
        peakG = acceleration / 9.81;
        injury = peakG / 40.0;
        safety = 40.0 / peakG;
        score = ...
            0.40 * safety + ...
            0.30 * (1.0 - peakG / 100.0) + ...
            0.30 * (distance(i) / 120.0);
        fprintf('%6.0f %6.2f %12.0f %12.0f %13.2f %8.2f %8.2f %8.2f %8.3f\n', ...
            distance(i), ...
            factor(j), ...
            avgForce, ...
            peakForce, ...
            acceleration, ...
            peakG, ...
            injury, ...
            safety, ...
            score);
        if score > bestScore
            bestScore = score;
            bestDistance = distance(i);
            bestFactor = factor(j);
        end
    end
end
fprintf('\n=============================================================\n');
fprintf('OPTIMUM DESIGN\n');
fprintf('=============================================================\n');
fprintf('Crush Distance : %.0f mm\n', bestDistance);
fprintf('Peak Factor : %.2f\n', bestFactor);
fprintf('Best Score : %.3f\n', bestScore);
fprintf('=============================================================\n');