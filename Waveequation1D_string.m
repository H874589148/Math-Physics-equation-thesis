clc;
clear;         %防止多次计算时数据重叠
pi=3.1415;
u0=1.5;
w=1;
l=10;
a=1;
[x,t]=meshgrid(0:0.1:10,0:0.1:10);
z=u0.*cos(w.*(x-l)./a).*sin(w.*t)./cos(w.*l./a);
h=surfl(x,t,z);
shading interp;