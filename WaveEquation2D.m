clc
close all
clear all

c0 = 3e1;         % speed of light or any wave
e0 = 8.854e-12;   % free space permittivity
u0 = 1.2566e-6;   % free space permeability

size=170;        % size of free space

s=size;            % s determines the position of the source in the free space

dx=0.001;        % spatial increment

dt=dx/(c0);   % time increment

%cons=c0*dt/dx; % constant term of electric and magnetic field equations
cons = 0.5;


n =500 ; % total time

% u=zeros(1,size); % initially, E at all points is taken zero
u_n=zeros(size);    %constant time next state of wave
u_p=zeros(size);    %constant time previous state of wave
u = zeros(size);    %constant time present state of wave

t0=15;   % t0 of Gaussian source 
tp=5;   % tp of Gaussian source

for k=1:n

    for i=2:size-1
    for j=2:size-1      
        u_n(i,j)= 2*u_n(i,j)-u_p(i,j)+(cons^2)*( u(i+1,j)+u(i-1,j)-4*u(i,j)+u(i,j+1)+u(i,j-1) );
    end
    end
u_p=u;   % after this iteration present state becomes previous state
u=u_n;   % next step becomes present state

u(size/2,size/2)=exp(-((k-t0)/tp)^2);  % gaussian source position selected at the centre of the matrix
%u(size/2,size/2)=sin(2*pi*0.03*i);
imagesc(u)
A(k)=getframe;
end