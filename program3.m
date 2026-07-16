clc;
clear;
width = input('Width (mm): ');
height = input('Height (mm): ');
thickness = input('Thickness (mm): ');
volume_mm3 = width * height * thickness;
volume_m3 = volume_mm3 / 1e9;
fprintf('\nVolume = %.2f mm^3\n',volume_mm3);
fprintf('Volume = %.8f m^3\n',volume_m3);