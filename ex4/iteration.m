function [out, outVectE] = iteration(A,B,C,D,F0,vectE)
%iteration Simulation d'un système continu
%   En entrée, les matrices d'état ABCD, F0 et le vecteur d'état vectE
%   En sortie, le vecteur d'état vectE pour n+1 et le vecteur de sortie out
%   A : Matrice d'état A
%   B : Matrice d'état B
%   C : Matrice d'état C
%   D : Matrice d'état D
%   F0 : Entrée du système
%   vectE = [x, v] : Vecteur des variables d'états
%       x : distance en mètres
%       v : vitesse en mètres par seconde
%   out = [x, v] : Sortie du système
%       x : distance en mètres
%       v : vitesse en kilomètres par heure
%   outVectE = [x[n+1], v[n+1]] : Variables d'état pour la prochaine
%           itération

out = C*vectE + D*F0; % out[n]
outVectE = A*vectE + B*F0; % vectE[n+1]
end