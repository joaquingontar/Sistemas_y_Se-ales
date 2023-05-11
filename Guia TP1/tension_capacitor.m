function tension_capacitor(uc0,u)
% tension_capacitor

% Ejemplo:
%   tension_capacitor(0,ones(100,1));
%   tension_capacitor(10,ones(100,1));
  
% Definicion de constantes
    R = 1e+6;
    C = 1e-6;
    tau = R*C;
    T = (R*C)/20;
% Condicion inicial
    uc(1) = uc0;
% Obtencion de uc mediante iteraciones
    for n = 1:1:length(u)-1
        uc(n+1) = uc(n) + (T/tau)*(u(n)-uc(n));
    end
% Graficas
    nplot = 0:1:length(uc)-1;
    stem(nplot,uc);
end

