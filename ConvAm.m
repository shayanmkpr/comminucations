function [xc,yc,xa]= ConvAm(Ac,Y,u,fc,fs)
ts=1/fs;
t=-5:ts:5;
yc=cos(2*pi*fc*t);
xa=Ac*(1+u*Y);
xc=xa.*yc;
end