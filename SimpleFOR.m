n = 1:0.1:17;
s = length(n);


for pom=1:length(n)
    if pom <= 7
        s(pom) = 21*sqrt(pom) ;
    end
    if pom <= 12 && pom > 7
        s(pom) = 21*sqrt(pom) ;
    end
end

fprintf("%g  ",s);

