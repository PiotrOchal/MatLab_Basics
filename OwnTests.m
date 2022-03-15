clc 
clear

t = 1:0.01:10;
output1 = zeros(length(t));

sygnal1 = rand(1, length(t));
sygnal2 = 2.05* cos(t);

for pom =1:length(sygnal1)
    output1(pom) = sygnal1(pom) + sygnal2(pom);
end

plot(t, output1),grid;


suma = 0;

for sum = 1:length(output1)
    suma = suma + output1(pom);
end

srednia = suma / length(sygnal1);

disp(suma);
disp(srednia);