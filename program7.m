clc;
clear;
area = zeros(1,4);
percentage = zeros(1,4);
totalArea = 0;
fprintf('AREA PERCENTAGE CALCULATOR\n\n');
for i = 1:4
    area(i) = input(sprintf('Enter Area of Layer %d (mm^2): ',i));
    totalArea = totalArea + area(i);
end
fprintf('\n-------------------------------------------------\n');
fprintf('Layer\tArea (mm^2)\tArea Percentage\n');
fprintf('-------------------------------------------------\n');
for i = 1:4
    percentage(i) = (area(i)/totalArea)*100;
    fprintf('%d\t%.2f\t\t%.2f %%\n', ...
        i, area(i), percentage(i));
end
fprintf('-------------------------------------------------\n');
fprintf('Total Area = %.2f mm^2\n',totalArea);