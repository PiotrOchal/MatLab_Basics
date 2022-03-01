clc
clear

t = 0:0.001:100;
output = zeros(1,length(t));

sygnal1 = rand(1,length(t) );
sygnal2 = 2.05 * cos(t);

for pom=1:length(sygnal1)

        sygnal1(pom) = sygnal1(pom) + sygnal2(pom);
end

means = mean(sygnal1);
suma = 0;

for pom=1:length(sygnal1)

        suma = suma + sygnal1(pom);
end

srednia = suma / length(sygnal1);

odch = 0;
suma_odch = 0;

for pom=1:length(sygnal1)

        suma_odch = suma_odch + ((srednia - sygnal1(pom))^2);
end

suma_odch = suma_odch / (length(sygnal1) - 1);

suma_odch = sqrt(suma_odch);



odchylonko = std(sygnal1);

disp(suma_odch);


plot(t,sygnal1),grid

disp(srednia);

figure(2)

hist(sygnal1,50);




















