clear
clc
fp = 10000;
f = 0:10:fp/2;
w = 2*pi*f;

t = 0:1/fp:10;

sygnal = 2*sin(2*pi*t) + sin(2*pi*t*1170);

% [l,m]=besself(3,1000,'low');
% 
% c2d(tf(l,m),1/fp)
% 
% powyzej generowanie bessela
% [l,m]=cheby1(3,0.707,2*pi*1000,'high','s');
% 
% c2d(tf(l,m),1/fp)

[l,m]=cheby2(3,0.99,2*pi*1000,'low','s');

c2d(tf(l,m),1/fp)

[G,P] = bode(l,m,w);

figure(1);
subplot(2,1,1);
semilogx(f,G);
subplot(2,1,2);
semilogx(f,P);

A0 = 0.8656;
A1 = -1.274;
A2 = 0.8556;

B0 = -0.0185;
B1 = 0.9065;
B2 = -1.444;

sygnal_out = zeros(1,length(t));

sygnal_out(1) = 0*A2+0*A1+0*A0 - 0*B2 - 0*B1 - 0*B0;
sygnal_out(2) = (sygnal(2-1)*A2)+0*A1+0*A0 - sygnal_out(2-1)*B2 - 0*B1 - 0*B0;
sygnal_out(3) = (sygnal(3-1)*A2)+sygnal(3-2)*A1+0*A0 - sygnal_out(3-1)*B2 - sygnal_out(3-2)*B1 - 0*B0;

for pom=4:length(t)
    sygnal_out(pom) = (sygnal(pom-1)*A2)+sygnal(pom-2)*A1+sygnal(pom-3)*A0 - sygnal_out(pom-1)*B2 - sygnal_out(pom-2)*B1 - sygnal_out(pom-3)*B0;
end

figure(2);
% subplot(2,1,1);

% subplot(2,1,2);
% plot();
plot(t,sygnal,t,sygnal_out);