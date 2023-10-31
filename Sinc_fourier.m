clc;
close all;
clear all;
fs=1000;
ts=1/fs;
t=-5:ts:5;
x=sinc(t).^2;
X=fftshift(fft(x));
f=-fs/2:fs/(length(X)-1):fs/2;
plot(f,abs(X));
ylabel('Magnitude');
xlabel('Frequency');


