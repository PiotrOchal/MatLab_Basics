Fp = 100;
t=0:1/Fp:0.1;

sygn = (rand(1,length(t)));

sygn_dir = ones(1,length(sygn));

Ts = 1;
for i=1:length(sygn)
    if i>1
        sygn_dir(i) = (sygn(i) - sygn(i-1))/Ts;
    else
        sygn_dir(i) = (sygn(i) - 0)/Ts;
    end
end

plot(t,sygn,t,sygn_dir),grid