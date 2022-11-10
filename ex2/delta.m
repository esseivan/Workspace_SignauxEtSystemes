% 3.2. Signaux discrets, fonction impulsion dirac
function out=delta(n)
% Impulsion de dirac centree en x=0 de surface 1

out = zeros(size(n)); % Construit out de la meme dimension de n
out(n==0) = 1;

% for i=1:length(n)
%     if n(i) == 0
%         out(i) = 1;
%         break;
%     end
% end

end
