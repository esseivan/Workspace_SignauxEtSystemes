function out = sys3(x, N)
%sys3 Moyenne glissante de x pour N valeurs
% N : entre 1 et infini

out = zeros(size(x));

% On passe les N premières valeurs et les (N-1) dernières
for l=N:(length(x)-N+1)
    out(l) = sum(x(l-N+1:l))/N;
end

end