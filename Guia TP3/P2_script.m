clear, clc, close all
n=[0:1:100]';
x = (0.9).^n;
num= [1,-0.5,1,-7/8];
den= [1,-11/8,7/16,0];
[X,w]=P2_dtft(num,den,length(x));
