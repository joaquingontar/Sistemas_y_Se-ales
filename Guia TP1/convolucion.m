function y = convolucion(h,u)
%CONVOLUCION Summary of this function goes here
%   Vale para vectores columna

if size(h,1) == 1
    h=h';
end
if size(u,1) == 1
    u=u';
end

fila = [h(1), zeros(1,length(u)-1)];
columna = [h; zeros(length(u)-1,1)];
M = toeplitz(columna,fila);
y = M*u;

if nargout == 0
    n = 0:1:length(y)-1;
    stem(n,y);
end

end
