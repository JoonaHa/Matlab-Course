t = -2:0.1:2;
[X,Y] = meshgrid(t);

F = X.*exp(-X.^2-Y.^2);

figure()
subplot(121)
surf(X,Y,F)
subplot(122)
mesh(X,Y,F)

F2 = log(X.^2+Y.^2);
figure(3)
surf(X,Y,F2)
%subplot(121)