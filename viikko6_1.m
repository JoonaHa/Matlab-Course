figure(1)
clf
patch([1 0 2],[0 1 1],[254/255 127/255 156/255])
patch([1 0 2],[0 1 1],[254/255 127/255 156/255],'EdgeColor',[3/255 190/255 111/255],'linewidth',16)
xlabel('x')
ylabel('y')
zlabel('z')
%%repmat 
x = [1 0 2];
A = repmat(x,2,3)
B = [1 0 2; 2 -3 4];
C = repmat(B,3,2)