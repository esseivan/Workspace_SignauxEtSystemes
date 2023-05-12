function h=PlotSpectre(x, Fs)

size_title = 16;
size_labels = 14;
size_legend = 13;



Xk = fftshift(fft(x));
N = length(Xk);
Xk = Xk/N;
Xk(abs(Xk)<1e-9)=0;



f = (-0.5:1/N:0.5-1/N)*Fs;
if mod(N,2) == 1 % impair
    f = f + (Fs/N)/2; % Si impair, il faut corriger en ajoutant/enlevant un demi pas
end

% Affichages x1
h=plot(f, abs(Xk), 'b');
yline(0, '--');
xline(0, '--');
title("Spectre", FontSize=size_title);
legend("|X1(j\Omega)|", FontSize=size_legend);
ylabel("Module"+newline+"Amplitude", "FontWeight","bold", FontSize=size_labels);


end