clc;
clear;
fprintf('=============================================\n');
fprintf(' IMPACT ATTENUATOR CONSTRAINT CHECKER\n');
fprintf('=============================================\n\n');
width = input('Width (mm): ');
height = input('Height (mm): ');
tcfrp = input('CFRP Thickness (mm): ');
thoney = input('Honeycomb Thickness (mm): ');
tfoam = input('Foam Thickness (mm): ');
tpu = input('PU Thickness (mm): ');
totalMass = input('Total Mass (kg): ');
totalEnergy = input('Total Energy (J): ');
peakForce = input('Peak Force (N): ');
peakG = input('Peak g: ');
overallSEA = input('Overall SEA (kJ/kg): ');
passed = 0;
totalConstraints = 8;
fprintf('\n========================================\n');
fprintf('CONSTRAINT CHECK RESULTS\n');
fprintf('========================================\n');
% Width Check
if width >= 70 && width <= 110
    fprintf('Width PASS\n');
    passed = passed + 1;
else
    fprintf('Width FAIL\n');
end
% Height Check
if height >= 140 && height <= 220
    fprintf('Height PASS\n');
    passed = passed + 1;
else
    fprintf('Height FAIL\n');
end
% Total Thickness Check
if (tcfrp + thoney + tfoam + tpu) >= 120 && ...
        (tcfrp + thoney + tfoam + tpu) <= 250
    fprintf('Thickness PASS\n');
    passed = passed + 1;
else
    fprintf('Thickness FAIL\n');
end
% Mass Check
if totalMass <= 2.0
    fprintf('Mass PASS\n')
    passed = passed + 1;
else
    fprintf('Mass FAIL\n');
end
% Energy Check
if totalEnergy >= 7358
    fprintf('Energy PASS\n');
    passed = passed + 1;
else
    fprintf('Energy FAIL\n');
end
% Peak Force Check
if peakForce <= 80000
    fprintf('Peak Force PASS\n');
    passed = passed + 1;
else
    fprintf('Peak Force FAIL\n');
end
% Peak g Check
if peakG <= 40
    fprintf('Peak g PASS\n');
    passed = passed + 1;
else
    fprintf('Peak g FAIL\n');
end
% Overall SEA Check
if overallSEA >= 5.0
    fprintf('Overall SEA PASS\n');
    passed = passed + 1;
else
    fprintf('Overall SEA FAIL\n');
end
compliance = passed * 100 / totalConstraints;
fprintf('\n========================================\n');
fprintf('Constraints Passed : %d / %d\n', passed, totalConstraints);
fprintf('Compliance : %.2f %%\n', compliance);
if passed == totalConstraints
    fprintf('\nDESIGN STATUS : ACCEPTED\n');
else
    fprintf('\nDESIGN STATUS : REJECTED\n');
end
fprintf('========================================\n');