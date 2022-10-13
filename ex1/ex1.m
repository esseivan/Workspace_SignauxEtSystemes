% 3.1. Affichage de signaux
clear; close all; clc;


f = 6e3;
tau = 0.5e-3;
resolution = 10e-6;
t = -1:resolution:1;

x1 = 5*cos(2*pi*f*t);
x2 = 4*exp(-t/tau).*cos(2*pi*f*t);

%% Plot
facteur_echelle = 1e3;

axes(1) = subplot(2,1,1);
plot(facteur_echelle*t, x1, 'b', 'LineWidth', 1.5);
set(axes(1), 'FontSize', 16); % Taille font des labels sur les axes
ylabel('x_1(t)','FontSize',24);
ylim([-6 6]);
grid on;


axes(2) = subplot(212);
plot(facteur_echelle*t, x2, 'r', 'LineWidth', 1.5);
set(axes(2), 'FontSize', 16); % Taille font des labels sur les axes
ylabel('x_2(t)','FontSize',24);
ylim([-10 10]);
grid
grid on;

xlabel('t [ms]','FontSize', 24);
linkaxes(axes, 'x')
xlim([-0.5 1.5]);

%% 3.2. Signaux discrets, fonction principale
clear; close all; clc;

n = -5:5;
imp = delta(n);
n;
