%% TP4
clear;clc;close;

% Temps de simulation
t = 120; % secondes

m = 1; % kg
k = 20; % Newton/m
R = 100e-3; % Ns/m

fs = 10e3; % Hz
Ts = 1/fs; % = 100e-6; % secondes
count = ceil(t/Ts)

% F0, une force de 100 N appliquée pendant 1 ms
F0 = (ones(10, 1)*100);

A = [1, Ts;
    (-k*Ts/m), (1-R*Ts/m)];
B = [0;
    (Ts/m)];
C = [1, 0;
    0, 3.6];
D = [0;
    0];

% Continu
Acontinu = [0, 1;
    (-k/m), (-R/m)];
Bcontinu = [0;
    (1/m)];
Ccontinu = [1, 0; 0, 3.6];
Dcontinu = [0; 0];


% Vecteurs
out = zeros(2, count); % Vecteur de sortie
vectE = [0; 0]; % Condition initiale : x = 0 et v = 0

for n=1:count
    F0_val = 0; % Plus d'entrée
    if (length(F0) >= n)
        F0_val = F0(n); % Entrée présente
    end

    [out(:,n), vectE] = iteration(A,B,C,D,F0_val,vectE);
end

%% Plot
clc; close;

x_out = out(1, :);
v_out = out(2, :);
time = 0:Ts:(t-Ts);

figure("WindowState","maximized"); % Ouvrir la fenêtre en maximized

subplot(211);
plot(time, x_out);
title("x / m");
subplot(212);
plot(time, v_out);
title("v / km/h");
% subplot(313);
% plot(time, x_out); hold on;
% plot(time, v_out);
% title("Système entier");
% legend("x", "v");

%% 3.2
clc; close;

% Valeures propres de A :
poles = eig(A)
fprintf("r%d = %s exp(%s)\n", 1, num2str(abs(poles(1))), num2str(angle(poles(1))));
fprintf("r%d = %s exp(%s)\n", 2, num2str(abs(poles(2))), num2str(angle(poles(2))));

% Memes valeurs que en continu
eig(Acontinu);

%% 3.4
clc; close;

[Ab, Bb, Cb, Db] = bilinear(Acontinu,Bcontinu,Ccontinu,Dcontinu,fs);

% Vecteurs
out_continu = zeros(2, count); % Vecteur de sortie
vectE = [0; 0]; % Condition initiale : x = 0 et v = 0

for n=1:count
    F0_val = 0; % Plus d'entrée
    if (length(F0) >= n)
        F0_val = F0(n); % Entrée présente
    end

    [out_continu(:,n), vectE] = iteration(Ab,Bb,Cb,Db,F0_val,vectE);
end

x_out_c = out_continu(1, :);
v_out_c = out_continu(2, :);
time = 0:Ts:(t-Ts);

figure("WindowState","maximized"); % Ouvrir la fenêtre en maximized

subplot(311);
plot(time, x_out_c, 'b', time, x_out, 'r');
title("x / m");
subplot(312);
plot(time, v_out_c, 'b', time, v_out, 'r');
title("v / km/h");

subplot(313);
diff = x_out_c - x_out;
plot(time, diff*1e3);
title("\Deltax / mm");

