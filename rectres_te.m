% Filename    : rectres_te.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 矩形空腔谐振器 TE 模
function [ex,ey,ez,hx,hy,hz] = rectres_te(x,y,z,m,n,p,a,b,l,omega,A,epsilon_r,mu_r)
	epsilon=8.854187817*1e-12*epsilon_r;
	mu=4*pi*1e-7*mu_r;
	kxx=m*pi/a;
	ky=n*pi/b;
	kz=p*pi/l;
	ex=A*ky*cos(kxx*x).*sin(ky*y).*sin(kz*z);
	ey=-A*kxx*sin(kxx*x).*cos(ky*y).*sin(kz*z);
	ez=0*x;
	hx=1*A/(omega*mu)*kxx*kz*sin(kxx*x).*cos(ky*y).*cos(kz*z);
	hy=1*A/(omega*mu)*ky*kz*cos(kxx*x).*sin(ky*y).*cos(kz*z);
	hz=-1*A*(kxx^2+ky^2)/(omega*mu)*cos(kxx*x).*cos(ky*y).*sin(kz*z);
	ex(isnan(ex))=0;
	ey(isnan(ey))=0;
	ez(isnan(ez))=0;
	hx(isnan(hx))=0;
	hy(isnan(hy))=0;
	hz(isnan(hz))=0;