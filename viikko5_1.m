x = [1 -2 3 2 -3 4 6 1];
figure(1)
stem(x)
% A lot of points
x1 = 0:pi/90:2*pi;
% Only 21 points
x2 = 0:pi/10:2*pi;
% Only 7 points
x3 = 0:pi/3:2*pi;
figure(2)
clf
plot(x1,sin(x1),'r','linewidth',2)
hold on
stem(x2,sin(x2),'b','filled','linewidth',2)
stem(x3,sin(x3),'c','linewidth',2)
xlim([0,2*pi])
ylim([-1.1,1.1])  
