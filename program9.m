clc;
clear;
ratio = zeros(1,4);
energy = zeros(1,4);
fprintf('ENERGY DISTRIBUTION CALCULATOR\n\n');
totalEnergy = input('Enter Total Impact Energy (J): ');
for i = 1:4
    ratio(i) = input(sprintf('Energy Ratio for Layer %d (%%): ',i));
end
fprintf('\n---------------------------------------------\n');
fprintf('Layer\tRatio (%%)\tEnergy (J)\n');
fprintf('---------------------------------------------\n');
for i = 1:4
    energy(i) = totalEnergy * ratio(i) / 100;
    fprintf('%d\t%.2f\t\t%.2f\n', ...
        i, ratio(i), energy(i));
end
fprintf('---------------------------------------------\n');
