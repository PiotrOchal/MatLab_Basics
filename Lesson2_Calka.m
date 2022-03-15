Fp = 100;
t=0:1/Fp:0.1;

sygn = (rand(1,length(t)));

sygn_div = ones(1,length(sygn));
sygn_integral = zeros(1,length(sygn));

Ts = 1;
for i=1:length(sygn)
    if i>1
        sygn_integral(i) = sygn_integral(i-1) + sygn(i)*Ts;
        sygn_div(i) = (sygn(i) - sygn(i-1))/Ts;
    else
        sygn_div(i) = (sygn(i) - 0)/Ts;
        sygn_integral(i) = 0 + sygn(i)*Ts;
    end
end

plot(t,sygn,t,sygn_div,t,sygn_integral),grid
legend('noise','dirative','integrite')