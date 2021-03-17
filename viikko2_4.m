A = [0 1 1 0 1;0 0 0 1 1;0 1 0 1 0;1 0 0 0 0;0 0 1 1 0];
r = [1;0;0;0;0];
for iii = 1:5
  y = A*r;
  sum_y = sum(y);
  if sum_y>1
    y(:) = y(:)/sum_y;
  end
  r = y
end
eig(A)

