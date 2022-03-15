clc;
clear;

fp = 1000;
t = 0:1/fp:0.1;
In = length(t);

for pom=1:length(t)
    In(pom) = sin(2* pi * 1000000);
end


Out = zeros(1,length(t));

for pom = 1:length(t)
    if pom > 1
    Out(pom) = (Out(pom-1) * 2) - (In(pom-1) * 0.5);
    else
     Out(pom) = (Out(pom) * 2) - (In(pom) * 0.5);
    end
end

plot(t, Out);