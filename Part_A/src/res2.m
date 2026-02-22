function res2()
f0=1e9; 
N=201; 
f = 0:(3*f0/N):(3*f0); 
res = zeros(N,1); 
resDB=zeros(N,1); 
swr= zeros(N,1); 
for i=1:N+1 
 res(i)=(Circ2(50,f(i))); 
 resDB(i)=20*log10(res(i)); 
 if(resDB(i)<-60) 
 resDB(i)=-60; 
end 
end
for i=1:N+1 
 swr(i)=(((1+res(i))/(1-res(i)))); 
 if(swr(i)>10) 
 swr(i)=10; 
end
 
end
plot(f,swr); 
xlabel('Frequency'); 
ylabel('SWR') ; 
figure; 
plot(f,resDB); 
xlabel('Frequency'); 
ylabel('|Γin| (DB)') ; 
end
