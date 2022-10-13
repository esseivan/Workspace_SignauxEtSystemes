% 3.1. Affichage de signaux
clear; close all; clc;


f = 6e3;
tau = 0.5e-3;
resolution = 10e-6;
t = -1:resolution:1;

x1 = 5*cos(2*pi*f*t);
x2 = 4*exp(-t/tau).*cos(2*pi*f*t);

%% Plot
t_ms = t*1000;

axes(1) = subplot(2,1,1);
plot(t, x1, 'LineWidth', 1.5, 'Color','b');
ylabel('x_1(t)','FontSize',18);
ylim([-5 5]);
grid on;


axes(2) = subplot(2,1,2);
plot(t, x2, 'LineWidth', 1.5, 'Color','r');
ylabel('x_2(t)','FontSize',18);
xlabel('t [ms]','FontSize',18);
ylim([-10 10]);
yticks([-10 0 10]);
grid
grid on;

linkaxes(axes, 'x')
xlim([-0.5e-3 1.5e-3]);


