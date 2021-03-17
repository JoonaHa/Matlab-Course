f = @(x) [ (x+4).* (-4<=x & x <= 0) + (4-x) .* (0 < x & x < 4)];
x =linspace(-4,4,1000);
plot(x,f(x))

N = 30;
nvec = [-N:N];


coefs = zeros(size(nvec));
for iii = 1:length(nvec)
   n        = nvec(iii);
   fii_n    = exp((-1i*n*x)/L);
   coefs(iii) = (8/1000)*sum(f(x).*conj(fii_n)); 
end