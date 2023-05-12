
%% Import
clear;clc;close all;
disp("FFT analysis from csv file...");

data = readmatrix("data.csv");

% Garder que les valeurs pour t>=0
keep = data(:,1)>=0;
data = data(keep,:);

t = data(:,1);
x = data(:,2);
y = data(:,3);

clear keep data;

%% Plot des signaux

fs = 200e3;
Ts = 1/fs;
% Ts = mean(diff(t));
% Chaque point est séparé de Ts secondes

% Plot de x(t) et y(t)
plot(t, x, 'Color', "#EDB120"); hold on;
plot(t, y, 'Color', "#77AC30");
xline(0, '--'); yline(0, '--');
grid("on");
title("Signaux d'entrée et de sortie");
legend('x(t)', 'y(t)');
xlabel("Temps t en s");
ylabel("Amplitude en V");


%% Dériver pour trouver la réponse impulsionnelle
% y étant la réponse indicielle, on dérive pour trouver s étant la 
% réponse impulsionnelle

% On multiplie y par 2 pour avoir un saut unité 1 V
y = y*2;

h = diff(y);
% Correction de t
t2 = t(1:end-1);

% Plot de s(t)
figure
plot(t2, h, 'Color', "#77AC30");
grid("on");
title("Réponse impulsionnelle h(t)");
xlabel("Temps t en s");
ylabel("Amplitude en V");

%% Calcul de la FFT
clc;

H = fftshift(fft(h));
% H = fft(h);
N = length(H);
% La fft nous donne un résultat de 0 Hz à fs Hz
% Nous prenons uniquement de 0 à fe/2

% On prends de 0 à fe/2 (ou N/2)
% H = H(1: N/2+1);
% N2 = length(H);

% f = fs*(0:(N/2))'/N;
f = -fs/2:fs/N:(fs/2-1);

% Mise à 0 du bruit
H(abs(H)<1e-3) = 0;

% Valeur en dB, 20*log10(Y/X)
H_db = 20*log10(abs(H));

% Affichage du diagrammde de Bode
figure;
hf2(1) = subplot(211);
semilogx(f, H_db, 'b');
grid("on");
yline(0, '--');
xline(0, '--');
title("Diagramme de Bode de H", FontSize=14);
legend("|H(j\omega)|", FontSize=12);
ylabel("Module"+newline+"dB", "FontWeight","bold", FontSize=12);

hf2(2) = subplot(212);
semilogx(f, angle(H), 'b');
yline(0, '--');
xline(0, '--');
yline(pi, LineStyle=":");
yline(pi/2, LineStyle=":");
yline(-pi, LineStyle=":");
yline(-pi/2, LineStyle=":");
legend("angle(H(j\omega))|", FontSize=12);
ylabel("Phase"+newline+"[\phi]=rad", "FontWeight","bold", FontSize=12);
xlabel("f, [f]=Hz", "FontWeight","bold", FontSize=12);
% xlim([-fmax, fmax]*2);
ylim([-pi, pi]*1.1);

linkaxes(hf2, 'x');
