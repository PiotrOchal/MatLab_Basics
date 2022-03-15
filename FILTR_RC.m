clc;
clear;

RC = 1.5;
Ts = 1000;

t = 0:1/Ts:0.1;


A = 1/((RC/Ts) +1);
B = RC/Ts;

IN = rand(1, length(t));

WY = zeros(1,length(t));

for pom = 1:length(t)
    if pom > 1
    WY(pom) = (IN(pom) + (WY(pom-1) *B)) * A;
    else
        WY(pom) = (IN(pom) + 0 * B) * A;
    end
end

figure(1)
plot(t,IN,t,WY);
% figure(2)
% plot(t,WY);