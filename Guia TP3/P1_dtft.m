function [X,w] = P1_dtft (x,N)
%N numero de frecuencia
%x: vector de longitud
%X: vector obtenido
%w: vector contenido las frecuencias
L=length(x);
n=[0:1:L-1]';
k=[0:1:N-1];
w=(2*k'*pi/N);
X=exp(-i*w*n')*x;
subplot(3,1,1),plot(w,abs(X));
subplot(3,1,2),plot(w,unwrap(angle(X)));
subplot(3,1,3),plot(w,abs(X).^2);
%unwrap te lo lleva a variable continua
end