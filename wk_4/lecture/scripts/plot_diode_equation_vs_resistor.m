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

R = 10; % In ohms

% Up close or far away regulator
I_limits = [-10 10];% * 5e-12;

V = linspace(-1, 1, 1e4);
I_diode = I_s * (exp(q_e * V / k / T) - 1);
I_resistor = V * R;

fig = figure();
plot(V, I_diode, '-b', 'LineWidth', 2.5);
hold on;
plot(V, I_resistor, '-r', 'LineWidth', 2.5); 
xline(0, 'LineWidth', 1 ,'alpha', .5);
yline(0, 'LineWidth', 1, 'alpha', .5);
xlim([-.9, .9])
ylim(I_limits)
xlabel('ძაბვა (ვოლტი)')
ylabel('გამავალი დენი (ამპერი)')
legend('დიოდის გრაფი', 'რეზისტორის გრაფი : R=10\Omega', 'Location', 'northwest')
title('დენის ძაბვაზე დამოკიდებულების გრაფი')
grid on
grid minor

saveas(fig, '../images/iv_diode_vs_resistor.png')