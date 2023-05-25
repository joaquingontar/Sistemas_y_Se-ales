
function dx=mrm(t,x)
%funcion que calcula la EDO
m1=2;
m2=2;
K=273;
b=8;
if t<0.2
    F=1.48;
else
    F=0;
end
dx = [
    x(2);
    (K/m1)*(x(3)-x(1))-(b/m1)*x(2)+(F/m1);
    x(4);
    -(K/m2)*(x(3)-x(1))-(b/m2)*x(4)
];

