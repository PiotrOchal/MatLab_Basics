clc;
clear;

fs = 1000;
Ts=1/fs;

t = 0:Ts:10;

sygnal = sin(2*pi*t)+0.2*(rand(1,length(t)));


plot(t,sygnal);

T = 0.05; %s L/R w przypadku cewki

A = 1/(1+((1/Ts)*T));
B = (1/Ts)*T;

WY = zeros(1,length(t));
% pom = zeros(1,length(t));

% WY(1) = (sygnal(1) + 0*B)*A;
% 
% for pom=2:length(t)
%     WY(pom) = (sygnal(pom) + WY(pom-1)*B)*A;
% end
% 
% plot(t,WY);