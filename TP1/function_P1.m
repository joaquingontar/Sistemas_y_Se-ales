function [x1, x2] = function_P1(x1i, x2i, T, e, tf)
    
    % Discretizacion
    t = 0:T:tf-T;
    
    % Condiciones iniciales
    x1(1) = x1i;
    x2(1) = x2i;
    
    % Aproximacion de Euler
    for n = 1:length(t)-1
        x1(n+1) = x1(n) + T.*x2(n);
        x2(n+1) = x2(n) + T.*(e.*((1-(x1(n)).^2).*x2(n)) - x1(n));
    end
    return
end
