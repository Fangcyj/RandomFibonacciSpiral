%% Fibonacci Curve
a1 = 0.618;
a2 = 1;
c = [0 -0.618];
alpha = 0 : pi/100 : pi/2;

for ii = 1 : 10
   
    if ii == 1
        
        r = a1;
        x = r * sin(alpha) + c(1);
        y = r * cos(alpha) + c(2);
        
        fill([y c(2)],[x c(1)],rand(1,3));
        hold on
        
        r_last_1 = r ;
             

    elseif ii == 2
        
        r = a2;
        c = [cos(ii*pi/2) sin(ii*pi/2)] * (r - r_last_1) + c;
        alpha = alpha + pi/2;
        x = r * sin(alpha) + c(1);
        y = r * cos(alpha) + c(2) ;
        
        
        fill([y c(2)],[x c(1)],rand(1,3));
        hold on
        r_last_2 = r ;


    else

        alpha = alpha + pi/2;
        r = r_last_1 + r_last_2;
        
        c = [cos(ii*pi/2) -sin(ii*pi/2)] * (r - r_last_2) + c;
        x = r * sin(alpha) + c(1);
        y = r * cos(alpha) + c(2);
        
        
        r_last_1 = r_last_2;
        r_last_2 = r;
    

        
        fill([y c(2)],[x c(1)],rand(1,3));
        hold on
        
    end
    
    
end
backColor = [0 0 0];set(gca, 'color', backColor);
axis off