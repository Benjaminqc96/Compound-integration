clear 
close all
clc
syms x
fu=input('Ingrese una funcion a aproximar: ');
a=input('Ingrese limite inferior: ');
b=input('Ingrese limite superior: ');
n=input('Cuantas subdivisiones quiere?: ');
rt=reglatrap(a,b,fu,n);
rs=reglasimp(a,b,fu,n);
rs3=reglatres8vos(a,b,fu,n);
exac=double(int(fu,a,b));
error1=double(abs((rt-exac)));
error2=double(abs((rs-exac)));
error3=double(abs((rs3-exac)));
fprintf('Error por metodo de trapecio: %f\n ',error1)
fprintf('Error por metodo de 1/3: %f\n ',error2)
fprintf('Error por metodo de 3/8: %f\n ',error3)