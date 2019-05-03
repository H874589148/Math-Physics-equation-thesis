clc;
clear;           %防止多次计算时数据重叠
pi=3.1415;
v0=1.5;
l=2;
a=1;
[x,t]=meshgrid(0:0.01:2,0:0.01:0.5);
z=v0.*l.*l./pi./pi./a.*(sin(pi.*pi.*a.*t./l./l).*sin(pi.*x./l)+sin(9.*pi.*pi.*a.*t./l./l).*sin(3.*pi.*x./l));
h=surfl(x,t,z);
shading interp;