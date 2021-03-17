S = load('train');
f = S.y;
Fs = S.Fs;
a= nextpow2(length(f));
f = f(1:2^(a-1));
L = length(f);
b = 16;
signals = zeros(L/b,b);
for iii = 1:b
    signals(:,iii) = f((iii-1)*L/b+1:(iii)*L/b);
end
for iii = 1:b
  s = signals(:,iii);
  f = Fs/2*linspace(0,1,(L/b)/2+1);
  Y = fft(s,(L/b))/L/b;
  Y = 2*abs(Y(1:(L/b)/2+1));
  figure(iii)
  plot(f, Y);
end
