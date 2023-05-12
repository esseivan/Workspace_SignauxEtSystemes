%%%%% TP 3

% 3.1 Série
clear;clc;close all;

size_title = 14;
size_labels = 12;
size_legend = 12;


Te = 1e-3;
fe = 1/Te;
f0 = 2; % Hz
w = 2*pi*f0;

% on enlève 1xTe pour avoir un nombre parfait d'echantillons
t = -1:Te:1-Te;
N = length(t);

% Définition des signaux
x1r = 0;
x2r = 0;
n = 4; % Ordre, nombre de termes
f_lim = ((2*n-1)*f0)*1.1;
for counter=1:n
    k = 2*counter-1;
    l = k^2;
    x1r = x1r + 1/k*sin(k*w*t);
    x2r = x2r + 1/l*cos(k*w*t);
end

figure(1);
plot(t, x1r, 'b', t, x2r, 'r');
yline(0, '--');
xline(0, '--');
legend("x1(t)", "x2(t)", FontSize=12);

title("Signaux x1 et x2 avec n="+n, FontSize=size_title);
xlabel("t, [t]=s", "FontWeight","bold", FontSize=size_labels);
ylabel("Amplitude", "FontWeight","bold", FontSize=size_labels);

%% 3.2 Calcul SFD
clc; clear hf2 hf3;

% SFD
X1k = serieF(x1r);
X2k = serieF(x2r);
% On force le bruit à 0
% X1k(abs(X1k)<1e-9)=0;
% X2k(abs(X2k)<1e-9)=0;
for counter=1:N
    if(abs(X1k(counter))<1e-9)
        X1k(counter)=0;
    end
    if(abs(X2k(counter))<1e-9)
        X2k(counter)=0;
    end
end



% Shift Xk pour centrer en 0
X1k = fftshift(X1k);
X2k = fftshift(X2k);

% Le spectre va de -fe/2 à fe/2
% On a N echantillons => une unite est fe/N = 1kHz/2001 ~= 0.5 Hz

f = (-0.5:1/N:0.5-1/N)*fe;
if mod(N,2) == 1 % impair
    f = f + (fe/N)/2; % Si impair, il faut corriger en ajoutant/enlevant un demi pas
end

% Affichages x1
figure(2);
hf2(1) = subplot(211);
stem(f, abs(X1k), 'b', Marker='.');
yline(0, '--');
xline(0, '--');
title("Spectre de x1 pour n="+n, FontSize=size_title);
legend("|X1(j\Omega)|", FontSize=size_legend);
ylabel("Module"+newline+"Amplitude", "FontWeight","bold", FontSize=size_labels);
xlim([-f_lim, f_lim]);
ylim([0, 0.52]);
grid("on");grid("minor");

hf2(2) = subplot(212);
stem(f, angle(X1k), 'b', Marker='.');
yline(0, '--');
xline(0, '--');
yline(pi, LineStyle=":");
yline(pi/2, LineStyle=":");
yline(-pi, LineStyle=":");
yline(-pi/2, LineStyle=":");
legend("angle(X1(j\Omega))|", FontSize=size_legend);
ylabel("Phase"+newline+"[\phi]=rad", "FontWeight","bold", FontSize=size_labels);
xlabel("f, [f]=Hz", "FontWeight","bold", FontSize=size_labels);
xlim([-f_lim, f_lim]);
ylim([-pi, pi]*1.1);

linkaxes(hf2, 'x');

% Affichages x2
figure(3);
hf3(1) = subplot(211);
stem(f, abs(X2k), 'r', Marker='.');
yline(0, '--');
xline(0, '--');
title("Spectre de x2 pour n="+n, FontSize=size_title);
legend("|X2(j\Omega)|", FontSize=size_legend);
ylabel("Module"+newline+"Amplitude", "FontWeight","bold", FontSize=size_labels);
xlim([-f_lim, f_lim]);
ylim([0, 0.52]);
grid("on");grid("minor");

hf3(2) = subplot(212);
stem(f, angle(X2k), 'r', Marker='.');
yline(0, '--');
xline(0, '--');
yline(pi, LineStyle=":");
yline(pi/2, LineStyle=":");
yline(-pi, LineStyle=":");
yline(-pi/2, LineStyle=":");

legend("angle(X2(j\Omega))", FontSize=size_legend);
ylabel("Phase"+newline+"[\phi]=rad", "FontWeight","bold", FontSize=size_labels);
xlabel("f, [f]=Hz", "FontWeight","bold", FontSize=size_labels);
xlim([-f_lim, f_lim]);
ylim([-pi, pi]*1.1);

linkaxes(hf3, 'x');


%% 3.3 Utilisation de l'algo FFT
clear hf2;clc;

x1kfft = fftshift(fft(x1r)/N);
x1kfft(abs(x1kfft)<1e-9)=0;

% Affichages x1 avec notre fonction et avec fft
figure(2);
% hf2(1) = subplot(221);
% plot(f, abs(X1k), 'b');
% yline(0, '--');
% xline(0, '--');
% title("Spectre de x1 pour n="+n, FontSize=size_title);
% legend("|X1(j\Omega)|", FontSize=size_legend);
% ylabel("Module"+newline+"Amplitude", "FontWeight","bold", FontSize=size_labels);
% xlim([-f_lim, f_lim]);
% 
% hf2(2) = subplot(223);
% plot(f, angle(X1k), 'b');
% yline(0, '--');
% xline(0, '--');
% yline(pi, LineStyle=":");
% yline(pi/2, LineStyle=":");
% yline(-pi, LineStyle=":");
% yline(-pi/2, LineStyle=":");
% legend("angle(X1(j\Omega))|", FontSize=size_legend);
% ylabel("Phase"+newline+"[\phi]=rad", "FontWeight","bold", FontSize=size_labels);
% xlabel("f, [f]=Hz", "FontWeight","bold", FontSize=size_labels);
% xlim([-f_lim, f_lim]);
% ylim([-pi, pi]*1.1);

%%%
hf2(1) = subplot(211);
stem(f, abs(x1kfft), 'm', Marker='.');
yline(0, '--');
xline(0, '--');
title("Spectre de x1 avec FFT pour n="+n, FontSize=size_title);
legend("|X1(j\Omega)|", FontSize=size_legend);
ylabel("Module"+newline+"Amplitude", "FontWeight","bold", FontSize=size_labels);
xlim([-f_lim, f_lim]);
ylim([0, 0.52]);
grid("on");grid("minor");

hf2(2) = subplot(212);
stem(f, angle(x1kfft), 'm', Marker='.');
yline(0, '--');
xline(0, '--');
yline(pi, LineStyle=":");
yline(pi/2, LineStyle=":");
yline(-pi, LineStyle=":");
yline(-pi/2, LineStyle=":");
legend("angle(X1(j\Omega))|", FontSize=size_legend);
ylabel("Phase"+newline+"[\phi]=rad", "FontWeight","bold", FontSize=size_labels);
xlabel("f, [f]=Hz", "FontWeight","bold", FontSize=size_labels);
xlim([-f_lim, f_lim]);
ylim([-pi, pi]*1.1);


linkaxes(hf2, 'x');
