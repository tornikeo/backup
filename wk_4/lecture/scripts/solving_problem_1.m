%% INITIALIZE
%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%
%% CONSTANT DEFINITION
%%%%%%%%%%%%%%%%%%%%%%%%%
k = 1.38064852e-23;
q_e = 1.60217662e-19;
I_s = 1e-12;
T = 300; % Kelvins, Room temperature
%%%%%%%%%%%%%%%%%%%%%%%%%
%% VISUALISATION
%%%%%%%%%%%%%%%%%%%%%%%%%

R = 220; % In ohms

% Up close or far away regulator
I_limits = [-1 6] * 1e-2;

V = linspace(-29, 29, 1e5);
I_diode = I_s * (exp(q_e * V / k / T) - 1);
I_resistor = (5 - V) / R;

fig = figure();
plot(V, I_diode, '-b', 'LineWidth', 2.5);
hold on;
plot(V, I_resistor, '-r', 'LineWidth', 2.5); 
xline(0, 'LineWidth', 1 ,'alpha', .5);
yline(0, 'LineWidth', 1, 'alpha', .5);
xlim([-3.9, 3.9])
ylim(I_limits)
xlabel('ძაბვა (ვოლტი)')
ylabel('გამავალი დენი (ამპერი)')
legend('არაწრფივი განტოლება', 'წრფივი განტოლება', 'Location', 'northwest')
title('დენის ძაბვაზე დამოკიდებულების გრაფი')
text(.613, .02, '\leftarrow ჩვენი ამონახსნი (0.613, 0.02)');
grid on
grid minor

saveas(fig, '../images/solution_problem_1.png');