% 4. Exponentielle complexe
clear; close all; clc;

A = 4;
sigma = -100;
f = 200;
omega = 2*pi*f;
resolution = 100e-6;

t = -50e-3:resolution:100e-3;

z = sigma + 1j*omega;
% z' est le conjugue complexe de z
x1 = A*exp(z*t);
x2 = A*exp(t*z) + A*exp(t*(z'));

%% Plots

axes(1) = subplot(221);
plot(t, real(x1));
title("Re\{x1\}");

axes(2) = subplot(223);
plot(t, imag(x1));
title("Im\{x1\}");

axes(3) = subplot(222);
plot(t, real(x2));
title("Re\{x2\}");

axes(4) = subplot(224);
plot(t, imag(x2));
title("Im\{x2\}");

linkaxes(axes, 'x');
xlim([0 30e-3]);

% sigma represente a quelle vitesse la fonction arrive a 0
% omega represente la vitesse a laquelle est oscille
% Pour le signal x2, on additionne deux exponentielles complexes avec leur
% oscillation en anti-phase. L'oscillation finale est donc nulle. Pour leur
% amplitude differentes, leur partie reelle sont en phase, donc elles
% s'additionnent. On a donc que la partie reelle de x2 est le double de
% celle de x1.
