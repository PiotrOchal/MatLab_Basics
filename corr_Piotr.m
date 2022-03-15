Tm=100;
Ts=0.1;
t=0:Ts:Tm;

r1=rand(1,length(t));
r2=rand(1,length(t));

in=(-2*log(r1)).^0.5.*sin(2*pi*r2);
RC=0.1;
A=Ts/(RC+Ts);
B=RC/(Ts+RC);
fin=zeros(1,max(size(t)));
fin2=fin;
fin(1)=in(1)*A;
fin2(1)=in(1)*B;
for n=2 : max(size(in))
 fin(n)=in(n)*A+B*fin(n-1);
 fin2(n)=(-in(n-1)+in(n)+fin2(n-1))*B;
end
w=in;%gausswin(20)';%[0.5,1,0.5];
inp=zeros(1,2*length(w)+length(in));
inp(length(w)+1:length(w)+length(in))=fin(1,:);



for n=1:length(inp)-length(w)-1
    out(n)=inp(1,n:n+length(w)-1)*w';

end
tc=-Tm:Ts:Tm;
subplot(3,1,1)
    plot(t,in,t,fin,t,fin2)
subplot(3,1,2)
    plot(tc,out)
subplot(3,1,3)
    stem(abs(fft(fin2)))