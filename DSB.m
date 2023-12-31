fc=990;
fs=1000;
ts=1/fs;
t=-5:ts:5;
Ac=10;
u1=0.5;
u2=-0.5;
x=sinc(t).^2;
[xc1,yc1,xa1]=ConvAm(Ac,x,u1,fc,fs);
[xc2,yc2,xa2]=ConvAm(Ac,x,u2,fc,fs);
xm=xc1-xc2;
figure (1);
plot(t,xm);
xlabel('time');
title('Modulated signel');
Xm=fftshift(fft(xm));
F=-fs/2:fs/(length(Xm)-1):fs/2;
figure (2);
plot(F,abs(Xm));
title('frequance of modulated');
P=bandpower(xm);
disp(P);