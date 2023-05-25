clear,clc,close all

%%funcion transferencia (ejercicio d)
m1 = 2;
m2 = 2;
k = 273;
b = 8;

%% matrices
A = [0,1,0,0;-k/m1,-b/m1,k/m1,0;0,0,0,1;k/m2,0,-k/m2,-b/m2];
B = [0;1/m1;0;0];
C = [0,1,0,0];
D = 0;

%% funcion
[num,den] = ss2tf(A,B,C,D);
TF = tf(num,den);

%% calculo de polos
polos= roots(den);
ceros= roots(num);

%% bode
bode(num,den), grid on
bode(num,den(1e5)),grid on
