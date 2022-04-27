clear
clc
fp = 10000;
f = 0:10:fp/2;
w = 2*pi*f;

t = 0:1/fp:10;

sygnal = 2*sin(2*pi*t) + sin(2*pi*t*1167);
% czestotliwosc 1167Hz bo ten gówno filter wycina tylko troszke ta
% czestotliwosc...

% [l,m]=besself(3,1000,'low');
% 
% c2d(tf(l,m),1/fp)
% 
% powyzej generowanie bessela
% [l,m]=cheby1(3,0.707,2*pi*1000,'high','s');
% 
% c2d(tf(l,m),1/fp)

rzad_filtru = 3;

[l,m]=cheby2(rzad_filtru,0.99,2*pi*1000,'low','s');

c2d(tf(l,m),1/fp)
lz=cell2mat(ans.Numerator)
mz=cell2mat(ans.Denominator)

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
%hmm jakby sie tu tego pozbyc kuwa? :( to sie da rozkmnic alem leniwy kapke
%:( jakies rutynki porobic, moze tylko jakos gupia petla zalezna od rzedu
%filtru nwm nwm nwm
% sygnal_out(1) = 0*A2+0*A1+0*A0 - 0*B2 - 0*B1 - 0*B0;
% sygnal_out(2) = (sygnal(2-1)*A2)+0*A1+0*A0 - sygnal_out(2-1)*B2 - 0*B1 - 0*B0;
% sygnal_out(3) = (sygnal(3-1)*A2)+sygnal(3-2)*A1+0*A0 - sygnal_out(3-1)*B2 - sygnal_out(3-2)*B1 - 0*B0;
% 



for pom=1:length(t)
 try
 sygnal_out(pom) = (sygnal(pom-1)*A2)+sygnal(pom-2)*A1+sygnal(pom-3)*A0 - sygnal_out(pom-1)*B2 - sygnal_out(pom-2)*B1 - sygnal_out(pom-3)*B0;
 
     catch
     disp('hello')
     sygnal_out(pom) = 0;
     %nwm nie chce mi sie jakby to skutecznie rozkminic - no to juz chyba
     %zadziabie ale no, nwm nwm
     if pom == 1
        sygnal_out(1) = 0*A2+0*A1+0*A0 - 0*B2 - 0*B1 - 0*B0;
     elseif pom == 2
        sygnal_out(2) = (sygnal(2-1)*A2)+0*A1+0*A0 - sygnal_out(2-1)*B2 - 0*B1 - 0*B0;
     elseif pom == 3
      sygnal_out(3) = (sygnal(3-1)*A2)+sygnal(3-2)*A1+0*A0 - sygnal_out(3-1)*B2 - sygnal_out(3-2)*B1 - 0*B0;
     else
%          ME = MException('MyComponent:noSuchVariable', ...
%         'Variable %s not found',str);
%         throw(ME)
        disp('hello')
     end
 end
end

% disp('hello');

out_pjotera=filter(lz,mz,sygnal);
figure(2);
plot(t,sygnal,t,sygnal_out,t,out_pjotera);
figure(3);
plot(t,abs(fft(sygnal)),t,abs(fft(sygnal_out)),t,abs(fft(out_pjotera)));
