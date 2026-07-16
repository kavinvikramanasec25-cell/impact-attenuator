clc;
clear;
mass = zeros(1,4);
totalMass = 0;
fprintf('TOTAL MASS CALCULATOR\n\n');
for i = 1:4
    mass(i) = input(sprintf('Enter Mass of Layer %d (kg): ',i));
    totalMass = totalMass + mass(i);
end
fprintf('\n---------------------------------\n');
fprintf('Total Mass = %.4f kg\n',totalMass);
fprintf('---------------------------------\n');
