clc;
clear;
mu=0.01; tau=100; L=1; M=100; N=2000; x=linspace(0,L,M)';
v=sqrt(tau/mu); dx=x(2)-x(1); dt=dx/v; p=(v*dt/dx)^2;

% Slide 26/34 modified with example data (from instruction)
s= -2*x.^2 + 0.8*x + 0.92;  % Original: x.^2.*(L-x); 
g=sin(2*pi*x);              % Original: zeros(M,1); 
h=zeros(1,N) + 0.8;         % Original: just zeros
r=zeros(1,N) - 0.28;        % Original: just zeros

% Code unchanged
f(:,1)=s;
f(1,2)=p*(f(2,1)- f(1,1)-dx*h(1)) + f(1,1) +dt*g(1);
f(2:M-1,2)=p/2*(f(3:M,1)-2*f(2:M-1,1)+ f(1:M-2,1))+f(2:M-1,1)+dt*g(2:M-1);
f(M,2)=r(2);
for n=2:N-1
    f(1,n+1)=2*p*(f(2,n)-f(1,n)- dx*h(n) )+2*f(1,n)-f(1,n-1);
    f(2:M-1,n+1)=p*(f(3:M,n)-2*f(2:M-1,n)+f(1:M-2,n))+2*f(2:M-1,n)-f(2:M-1,n-1);
    f(M,n+1)=r(n+1);
end

% Visualize
h = surf(f);
set(h,'LineStyle','none')
