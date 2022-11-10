function y = sys1(x)
%SYS1 fonction definie pour le point 3.1 de l'ExTP 2
%   y[n] = x[n] -5x[n-1] +2x[n-2]

y = zeros(size(x));

for n=1:length(x)
    % 'if' le plus correct en premier pour éviter des calculs inutiles
    if n > 2 % n-1 et n-2 disponibles
        y(n) = x(n) -5*x(n-1) +2*x(n-2);
    elseif n == 2 % Pas de n-2
        y(n) = x(n) -5*x(n-1);
    else % n=1 => Pas de n-1 et n-2
        y(n) = x(n);
    end
end

% Version avec sauvegarde des x[n-1] et x[n-2]
% x_nm1 = 0; % Valeur x[n-1]
% x_nm2 = 0; % Valeur x[n-2]
% for l=1:length(x)
%     y(l) = x(l) - 5*x_nm1 + 2*x_nm2;
%     x_nm2 = x_nm1; % x_nm1 décalé à x_nm2
%     x_nm1 = x(l); % x[n] décalé à x[n-1]
% end

end

