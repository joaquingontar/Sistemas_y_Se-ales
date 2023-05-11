% Script Problema 1 - Laboratorio Tesys

close all
clear, clc

% Definicion de constantes
    R = 1e+6;
    C = 1e-6;
    tau = R*C;
    T = (R*C)/20;
    A = 1;
% Generacion de la señal
    u = A*ones(ceil(5/T),1);
% Condicion inicial
    uc(1) = 0;
% Obtencion de uc mediante iteraciones
    for n = 1:1:length(u)-1
        uc(n+1) = uc(n) + (T/tau)*(u(n)-uc(n));
    end
% Graficas
    nplot = 0:1:length(uc)-1;
    stem(nplot,uc);