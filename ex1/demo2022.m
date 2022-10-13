% Efface les variables; ferme les graphes; efface la console
clear; close all; clc; 

a = [1 2 3];
b = [2 3 4];

c = b.*a;

fe = 1e3;
t = 0:1/fe:1;

x=t.^2;
y=t.^3;

axes(1) = subplot(2,1,1);
plot(t, x);
xlabel('t (s)');
ylabel('x_1 (t)');
title('t^2');
grid on;


axes(2) = subplot(2,1,2);
plot(t, y, 'r');
xlabel('t (s)');
ylabel('y_1 (t)');
title('t^3');
grid on;

linkaxes(axes, 'x');
xlim([0 0.5]);


