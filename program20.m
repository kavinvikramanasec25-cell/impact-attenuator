clc;
clear;
LAYERS = 4;
material = {
    'CFRP';
    'Al Honeycomb';
    'Al Foam';
    'PU Foam'
    };
density = [1600 80 450 120];
volume = [0.00040 0.00140 0.00120 0.00100];
materialSEA = [1.15 26.30 4.77 9.20];
ratio = [10 40 35 15];
totalEnergy = 7358;
totalMass = 0;
bestEfficiency = 0;
bestLayer = 1;
fprintf('===========================================================\n');
fprintf(' ENERGY DISTRIBUTION OPTIMIZATION PROGRAM\n');
fprintf('===========================================================\n\n');
fprintf('===============================================================================================\n');
fprintf('Material Mass(kg) Energy(J) SEA(kJ/kg) Efficiency(%%)\n');
fprintf('===============================================================================================\n');
for i = 1:LAYERS
    mass = density(i) * volume(i);
    energy = (ratio(i) / 100.0) * totalEnergy;
    sea = energy / (mass * 1000);
    efficiency = (sea / materialSEA(i)) * 100.0;
    totalMass = totalMass + mass;
    fprintf('%-15s %10.4f %12.2f %12.2f %15.2f\n', ...
        material{i}, ...
        energy, ...
        sea, ...
        efficiency);
    if efficiency > bestEfficiency
        bestEfficiency = efficiency;
        bestLayer = i;
    end
end
fprintf('===============================================================================================\n');
fprintf('\nTotal Mass = %.4f kg\n', totalMass);
fprintf('Total Energy = %.2f J\n', totalEnergy);
fprintf('Overall SEA = %.2f kJ/kg\n', ...
    totalEnergy / (totalMass * 1000));
fprintf('\n=============================================\n');
fprintf('BEST PERFORMING LAYER\n');
fprintf('=============================================\n');
fprintf('Material : %s\n', material{bestLayer});
fprintf('Efficiency : %.2f %%\n', bestEfficiency);
