clc;

clear;

Material = {'CFRP'; 'Al Honeycomb'; 'Al Foam'; 'PU Foam'};

Density = [1600; 80; 450; 120];

SEA = [1.15; 26.30; 4.77; 9.20];

fprintf('-----------------------------------------\n');

fprintf('HYBRID MATERIAL DATABASE\n');

fprintf('-----------------------------------------\n\n');

fprintf('%-18s %-12s %-10s\n', 'Material', 'Density', 'SEA');

for i = 1:length(Material)

    fprintf('%-18s %-12.2f %-10.2f\n', Material{i}, Density(i), SEA(i));

end
