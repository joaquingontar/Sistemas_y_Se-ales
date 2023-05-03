% Script: script_P1.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Mayo 2023

clear, clc, close all

% Constantes 
T = [0.001 0.1];
e = [0 1 10 50];
tf = 100;

% Implementacion del metodo
for i = 1:length(T)
    % Discretizacion
    t = 0:T(i):tf-T(i);
    % Condiciones iniciales
    x1 = [0, zeros(1,length(t)-2)];
    x2 = [1, zeros(1,length(t)-2)];
    for j = 1:length(e)
        for n = 1:length(t)-1
            % Aproximacion de Euler
            x1(n+1) = x1(n) + T(i).*x2(n);
            x2(n+1) = x2(n) + T(i).*(e(j).*((1-(x1(n)).^2).*x2(n)) - x1(n));
        end
        plotX(i,j,x1,x2,T,e,t);
    end 
end

function plotX(i,j,x1,x2,T,e,t)
    figure(i)
        subplot(2,4,j), plot(t,x1,'r')
            title(['T = ', num2str(T(i)), ' s y ', '$\varepsilon$ = ', num2str(e(j))],'Interpreter','latex')
            legend('x_{1}(t)', 'Location', 'northeast')
            xlabel('t')
            ylabel('x_{1}(t)')
            hold on, grid on
        subplot(2,4,j+4), plot(t,x2,'b')
            title(['T = ', num2str(T(i)), ' s y ', '$\varepsilon$ = ', num2str(e(j))],'Interpreter','latex')
            legend('x_{2}(t)', 'Location', 'northeast')
            xlabel('t')
            ylabel('x_{2}(t)')
            hold on, grid on
end
