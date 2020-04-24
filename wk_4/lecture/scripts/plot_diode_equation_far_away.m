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

% Up close or far away regulator
I_limits = [-2 10];% * 5e-12;

V = linspace(-1, 1, 1e4);
I_diode = I_s * (exp(q_e * V / k / T) - 1);

fig = figure();
plot(V, I_diode, '-b', 'LineWidth', 2.5);
xline(0, 'LineWidth', 1 ,'alpha', .5);
yline(0, 'LineWidth', 1, 'alpha', .5);
xlim([-.9, .9])
ylim(I_limits)
xlabel('ძაბვა (ვოლტი)')
ylabel('გამავალი დენი (ამპერი)')
legend('დიოდის გრაფი', 'Location', 'northwest')
title('დენის ძაბვაზე დამოკიდებულების გრაფი')
grid on
grid minor

saveas(fig, '../images/iv_far_away.png')