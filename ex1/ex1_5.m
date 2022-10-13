% 5. Application - Modulation AM
clear; close all; clc;

resolution = 5e-6;
t = 0:resolution:5;

x1 = 0.4*cos(2*pi*250*t)+0.2*cos(2*pi*500*t+1); % porteuse
x2 = 0.05*cos(2*pi*10000*t); % donnees

x = x2.*(x1+1);

%% Plot

axes(1) = subplot(211);
plot(t, x1)
hold on;
plot(t, x2)
legend('x1','x2');

axes(2) = subplot(212);
plot(t, x)
legend('x');
ylabel('x (t)');
xlabel('t (s)');

linkaxes(axes, 'x');
xlim([0 10e-3]);


% La courbe exterieure de x est similaire a celle de x1