clc;
close all;
clear all;
fc=100;
fs=2500;
Ac=10;
u=0.5;
ts=1/fs;
t=-5:ts:5;
y=sinc(t).^2;
[xc,yc,xa]=ConvAm(Ac,y,u,fc,fs);
figure (1);
subplot(4,1,1);
plot(t,xa);
xlabel('t');
title('Ac(1+u*xm)');
subplot(4,1,2);
plot(t,xc);
xlabel('time');
title('Modulated_signel');
subplot(4,1,3);
plot(t,y);
xlabel('t');
title('Massage_signal');
subplot(4,1,4);
plot(t,yc);
xlabel('t');
title('carrier_signal');
Xc=fftshift(fft(xc));
F=-fs/2:fs/(length(Xc)-1):fs/2;
figure (2);
plot(F,abs(Xc));
title('modulated_frequancy');
xre=ReConvAm(xc,fs,fc);
figure(3)
d=lowpass(xre,fc,fs);
plot(t,d);
err=immse(d,xc);
disp(err);
A=zeros(2,101);
for u=-5:1:5
    [xc,yc,xa]=ConvAm(Ac,y,u,fc,fs);
    xre=ReConvAm(xc,fs,fc);
    d=lowpass(xre,fc,fs);
    err=immse(d,xc);
    A(1,u+6) = err;
    A(2,u+6) = u;
end
u1 =A(2,1:11);
A1 =A(1,1:11);
figure (4)
stem(u1,A1);
B=zeros(2,1000);
for fc=1:1:1000
    [xc,yc,xa]=ConvAm(Ac,y,u,fc,fs);
    xre=ReConvAm(xc,fs,fc);
    d=lowpass(xre,abs(fc),fs);
    err=immse(d,xc);
    B(1,fc) = err;
    B(2,fc) = fc;
end
u2 =B(2,1:1000);
B2 =B(1,1:1000);
figure(5)
stem(u2,B2);