function [X,w] = P2_dtft(num,den,N)
    %N numero de frecuencia
    %X: vector obtenido
    %w: vector contenido las frecuencias
    
    k=0:1:N-1;
    w=(2*k'*pi/N);
    
    Z=exp(j*w);
    num_e =polyval(num,Z);
    den_e =polyval(den,Z);
    X=num_e./den_e;
    
    subplot(3,1,1),plot(w,abs(X));
    subplot(3,1,2),plot(w,unwrap(angle(X)));
    subplot(3,1,3),plot(w,abs(X).^2);
    %unwrap te lo lleva a variable continua
end