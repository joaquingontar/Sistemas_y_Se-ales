clear, clc, close all
n=[0:1:100]';
x = (0.9).^n;
[X,w]=P1_dtft(x,length(x));
