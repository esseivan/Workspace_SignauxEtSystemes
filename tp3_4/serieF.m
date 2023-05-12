function Xk=serieF(x)
N = length(x);
Xk = zeros(1, N);
for k=1:N
    for n=1:N
        Xk(k) = Xk(k) + x(n)*exp(-1j*(k-1)*2*pi/N*(n-1));
    end
end
Xk = Xk/N;
end