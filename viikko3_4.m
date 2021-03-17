format short 
A = [0 0 0 0 0 0 0 0 1 0;...
     0 0 1 0 1 0 1 0 1 0;...
     0 0 0 0 0 0 1 1 0 0;...
     0 0 0 0 0 1 0 1 0 0;...
     0 0 0 1 0 0 0 0 1 1;...
     0 0 0 0 0 0 0 0 0 1;...
     1 0 0 0 1 0 0 0 0 0;...
     0 0 0 0 1 1 1 0 0 0;...
     0 0 1 0 0 0 0 0 0 1;...
     0 0 1 1 0 0 0 0 0 0;...
    ];
[V,D] = eig(A);
max(abs(D))
v_eig = V(:,2);
v_eig = v_eig / sum(v_eig);
r = v_eig;
for ii = 1:100
 

  if(sum(r) > 1)
      r = r/norm(r);
  end
  
   y = A*r;
   
   if abs(r-y) <= 10^-4
     y
     ii
     return
   end
  
  
   r=y
  

    
end

ii
r_eq = r;
r_eq = r_eq/sum(r_eq)