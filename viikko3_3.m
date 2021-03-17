A = [0 1 1 0 1;0 0 0 1 1;0 1 0 1 0;1 0 0 0 0;0 0 1 1 0];
r = [0;0;0;1;0];
format long
for iii = 1:60
    y = A*r;
    sum_y = sum(y);
    if sum_y>1
        y(:) = y(:)/sum_y;
    end
    if norm(r-y) <=10^-6
        y
        iii
        return
    end
    r = y;
end

