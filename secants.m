function [ x ] = secants( f,x0,x1,toll,iter)
    
    if(nargin < 5)
        iter = 1000;
    end
    if(nargin < 4)
        toll = 1e-6;
    end
    
    xold = x0;
    fold = f(xold);
    x = x1;
    
    d = toll+1;
    
    for ii = 1:iter
        if abs(d) < toll || isnan(x)
            break;
        end
        fx = f(x);
        d = -(x-xold)/(fx-fold)*fx;
        fold = fx;
        xold = x;
        x = x + d;
    end
    
    if ii >= iter
       disp('Secant algorithm do not converge in all iterations') 
    end
    
    if isnan(x)
       disp('Secant algorithm reaches nan') 
    end
    
    %print(ii)
    %disp(['error from first guesses = ', num2str(abs(x-x0)), ' and ',  num2str(abs(x-x1))])
end

