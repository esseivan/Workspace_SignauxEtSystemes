% 3.1. Affichage de signaux
clear; close all; clc;


f = 6e3;
tau = 0.5e-3;
resolution = 10e-6;
t = -1:resolution:1;

x1 = 5*cos(2*pi*f*t);
x2 = 4*exp(-t/tau).*cos(2*pi*f*t);

% Plot
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

% 2)
n = -5:5;
deltaVal = delta(n+1);
stem(n, deltaVal, 'filled');
xticks(n); % afficher tous les nombres de l'axe x
xlabel('n');
title('Signaux discrets');

% 3)
hold on;
u = cumsum(deltaVal);
stem(n + 0.1, u, 'r', 'filled');

% 4)
hold on;
r = cumsum(u);
%r = [0 r(1, 1:length(r)-1)]; % Decalage a droite et supprimer le dernier element
r = cumsum(cumsum(delta(n+1 - 1))) % Decalage a droite de l'impulsion
stem(n - 0.1 , r, 'g', 'filled');
legend('\delta[n+1]', 'u[n+1]', 'r[n+1]');


%% 3.3. Signaux continus
clear; close all; clc;

% 1)
resolution = 1e-3;

% Saut unité
syms t;
u = heaviside(t - 0.5);
t = -4:resolution:4;
plot(t, eval(u))
% syms definit un parametre symbolique, non defini
% eval evalue la fonction en remplacant les parametres symboliques par leur
%   valeur

% 2)
deltaVal = diff(u);
hold on;
plot(t, eval(deltaVal));
% La valeur pour t = 0.5 n'est pas présente sur le graphe. Elle est a une
% amplitude infinie pour le graphe

% 3)
r = int(u);
hold on;
plot(t, eval(r));

% Seul l'impulsion de dirac n'est pas continue, les deux autres oui



% ###### Manière de travailler en continu : syms puis eval







