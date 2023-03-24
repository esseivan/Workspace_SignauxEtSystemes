
clear; close all; clc;

resolution = 1e-9;

% PWM
syms t;
pwm = heaviside(t) - heaviside(t - 100e-6);

% Sinus
sinus = sin(2*pi*t/100e-6)

% Result
res = pwm*sinus;

t = 0:resolution:500e-6;
plot(t, eval(pwm)); hold on;
plot(t, eval(sinus));
plot(t, eval(res));
xlim([0, 500e-6]);

fftres = fft(eval(pwm));

%%
% 2)
deltaVal = diff(pwm);
hold on;
plot(t, eval(deltaVal));
% La valeur pour t = 0.5 n'est pas présente sur le graphe. Elle est a une
% amplitude infinie pour le graphe

% 3)
r = int(pwm);
hold on;
plot(t, eval(r));
