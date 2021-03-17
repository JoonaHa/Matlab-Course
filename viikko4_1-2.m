syms y(x)
y(x) = piecewise(x<0,-1,x<=2,1,x<=4,-2)
 
y(x) =
 
piecewise(x < 0, -1, x <= 2, 1, x <= 4, -2)
 
t = linspace(-10,10);
figure(1)
plot(t,y(t))
y(x) = piecewise(x<0,-1,x<=2,1,x<=4,-2,0);

plot(t,y(t))                              
y(x) = piecewise(-2<x<0,-2,0<=x<3,x+2,3<=x<8,x^2,0);
plot(t,y(t))                                        
y(x) = piecewise( -2<x<0,-x,0<=x<1,sqrt(x),x==1,60,x<4,exp(x),0);  
figure(1)                                                        
plot(t,y(t))                                                     
                                                   
y(x) = piecewise(-2<x<0,-x,0<=x<1,sqrt(x),x==1,60,0);           
plot(t,y(t))                                         
y(x) = piecewise(-2<x<0,-x,0<=x<1,sqrt(x),x==1,60,x<4,exp(x),0);
plot(t,y(t))                                                    
y = @(x) (x<0).*(-1)+(0<x & x<=2).*1+(2<x & x<=4).*(-2);
figure(1)                                                       
plot(t,y(t))                                            
y = @(x) (-2<x & x<0).*(-2)+(0<=x & x<3).*(x+2)+(3<=x & x<8).*(x.^2);
plot(t,y(t))                                                         
y = @(x) (-2<x & x<0).*(-x)+(0<=x & x<1).*sqrt(x)+(x==1).*(60)+(1<x & x<4).*(exp(x));
plot(t,y(t))  
