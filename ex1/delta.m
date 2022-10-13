% 3.2. Signaux discrets, fonction impulsion dirac
function out=delta(n)
% Impulsion de dirac centree en x=0 de surface 1

out = zeros(size(n));
out(n==0) = 1;

end
