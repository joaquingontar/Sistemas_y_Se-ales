function rxy = correlacion(x,y)
%CORRELACION Summary of this function goes here
%   Detailed explanation goes here

if size(y,1)
    y=y';
end

yinv = flipud(y);
rxy = convolucion(x,yinv);

n = -lenght(y)+1 : 1 : lenght(y)-1;

end
