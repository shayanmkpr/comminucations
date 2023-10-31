fs=1000;
t=linspace(-5,5,round(10*fs));
x=sinc(t).^2;
plot(t,x);