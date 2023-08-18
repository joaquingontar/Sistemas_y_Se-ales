close all,clear,clc
L=2;
%ventanas
v1=boxcar(L);
v2=hamming(L);
v3=hanning(L);
N=100
%calculo de espectros
figure (1)
[X1,w1] = P1_dtft (v1,N),grid on, hold on;
figure(2)
[X2,w2] = P1_dtft (v2,N),grid on, hold on;
figure(3)
[X3,w3] = P1_dtft (v3,N),grid on, hold on;
figure (4)
plot(w1,X1,'k',w2,X2,'r',w3,X3,'b'),grid on, hold on;
