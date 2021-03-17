
% Sampling frequency
Fs = 1024;
% Sampling period
T = 1/Fs;
% Length of signal
L = 1024;
% Time vector
t = (0:L-1)*T;
% Algorithm purposes take a power of two length (a safety measure)
n = 2^nextpow2(L);

% Create the signal with

f = 1+3*sin(2*30*t*pi)+4*sin(2*40*t*pi)+2*sin(2*50*t*pi);
%% FFT

% Do a padding and normalize length
ffts = fft(f,n)/L;
% Double sided spectrum
P2 = abs(ffts);
% Single sided spectrum
P1 = P2(1:n/2+1);
P1(2:end-1) = 2*P1(2:end-1);
% Shift P2 so that zero is in the center
P2 = fftshift(P2);

figure(2)
df = Fs/n;
f_scale = 0:df:(Fs/2-df);
f_double = -Fs/2:df:(Fs/2-df);
subplot(221)
plot(f_double,P2)
title('Two sided FFT')
subplot(222)
plot(f_scale,P1(1:n/2))
title('One sided FFT')
subplot(223)
plot(f_double(round(7/16*end):round(9/16*end)),P2(round(7/16*end):round(9/16*end)))
title('Zoomed two sided FFT')
subplot(224)
plot(f_scale(1:end/8),P1(1:n/16))
title('Zoomed one sided FFT')

