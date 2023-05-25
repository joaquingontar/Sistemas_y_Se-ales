clear,clc,close all 
%inicializaciones
D = 2.5;
tspan = [0 D];
x0=[0,0,0,0];

%funcion
[T,x] = ode45('mrm',tspan,x0);

%plot
subplot(4,1,1), plot(T,x(:,1),'k'),grid on
subplot(4,1,2), plot(T,x(:,2),'k'),grid on
subplot(4,1,3), plot(T,x(:,3),'k'),grid on
subplot(4,1,4), plot(T,x(:,4),'k'),grid on

