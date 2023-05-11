% Script: script_P1.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Mayo 2023

clear, clc, close all

% Constantes 
T = 0.001;
e = 10;
tf = 50;

% Condiciones iniciales
x1i = [1 -0.5 -1 1.5 -0.1 0.1];
x2i = [1 -5 10 -4 0 0];

color=['b', 'b', 'b', 'b', 'k', 'r'];
for i=1:length(x1i)
   [x1, x2] = function_P1(x1i(i), x2i(i), T, e, tf);
   figure (1);
        plot(x1,x2,color(i)), hold on, grid on,
        title('trayectorias superpuestas')
        xlabel('x_{1}(t)')
        ylabel('x_{2}(t)')
        plot(x1i(i),x2i(i),'k*')
end
        legend ('(1,1)','(-0.5,-5)','(-1,10)','(1.5,-4)')
   for i=1:length(x1i)
   [x1, x2] = function_P1(x1i(i), x2i(i), T, e, tf);
   figure (2)
   subplot(2,2,i), plot(x1,x2,'b')
        title(['T = ', num2str(T), ' s y ', '$\varepsilon$ = ', num2str(e)],'Interpreter','latex')
        xlabel('x_{1}(t)')
        ylabel('x_{2}(t)')
        hold on, grid on
end

