% 3.2. Signaux discrets, fonction impulsion dirac
function out=delta(n)
% Impulsion de dirac centree en x=0 de surface 1

out = n.*0; % out de meme taille que n
for i=1:length(n)
    if n(i) == 0
        out(i) = 1;
        break;
    end
end

end
