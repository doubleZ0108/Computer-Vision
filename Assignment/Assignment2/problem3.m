clear
clc

syms x y k1 k2 rho1 rho2 k3
r = (x^2 + y^2)^(1/2);

xd(x,y) = x*(1+k1*r^2+k2*r^4) + 2*rho1*x*y + rho2*(r^2+2*x^2) + x*k3*r^6;
% Dxd_Dx = diff(xd(x,y),x)
% expand(Dxd_Dx) 
% Dxd_Dy = diff(xd(x,y),y);
% expand(Dxd_Dy)

yd(x,y) = y*(1+k1*r^2+k2*r^4) + 2*rho2*x*y + rho1*(r^2+2*y^2) + y*k3*r^6;
% Dyd_Dx = diff(yd(x,y),x);
% expand(Dyd_Dx)
Dyd_Dy = diff(yd(x,y),y);
expand(Dyd_Dy)
