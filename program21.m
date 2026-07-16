clc;
clear;
DISTANCES = 9;
FACTORS = 4;
crushDistance = [40 50 60 70 80 90 100 110 120];
peakFactor = [1.20 1.30 1.40 1.50];
energy = 7358.0; % J
vehicleMass = 300.0; % kg
bestScore = -1;
bestDistance = 0;
bestFactor = 0;
fprintf('=============================================================\n');
fprintf(' PEAK IMPACT FORCE OPTIMIZATION PROGRAM\n');
fprintf('=============================================================\n\n');
fprintf('===============================================================================================================\n');
fprintf('Distance Factor AvgForce(N) PeakForce(N) PeakG Safety Score\n');
fprintf('===============================================================================================================\n');
for i = 1:DISTANCES
    avgForce = energy / (crushDistance(i) / 1000.0);
    for j = 1:FACTORS
        peakForce = avgForce * peakFactor(j);
        acceleration = peakForce / vehicleMass;
        peakG = acceleration / 9.81;
        safety = 40.0 / peakG;
        score = ...
            0.5 * safety + ...
            0.3 * (100000.0 / peakForce) + ...
            0.2 * (40.0 / peakG);
        fprintf('%7.0f %7.2f %12.0f %13.0f %8.2f %8.2f %8.3f\n', ...
            crushDistance(i), ...
            peakFactor(j), ...
            avgForce, ...
            peakForce, ...
            peakG, ...
            safety, ...
            score);
        if score > bestScore
            bestScore = score;
            bestDistance = crushDistance(i);
            bestFactor = peakFactor(j);
        end
    end
end
fprintf('\n=====================================================\n');
fprintf('OPTIMUM DESIGN\n');
fprintf('=====================================================\n');
fprintf('Crush Distance : %.0f mm\n', bestDistance);
fprintf('Peak Factor : %.2f\n', bestFactor);
fprintf('Best Score : %.3f\n', bestScore);
fprintf('=====================================================\n');
