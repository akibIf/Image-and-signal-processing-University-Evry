% CORRELATION

clear;
N=400;
M=1000;
bet=1;
nu1=0.05; nu2=0.1;

S1=sin(2*pi*nu1*(1:N)); S2=sin(2*pi*nu2*(1:N));
    
R=zeros(N);
for n=1:M
    a1=rand-0.5; a2=0.5*(rand-0.5);
    W=sqrt(bet)*randn(1,N);
    X=a1*S1+a2*S2;
    Y=X+W;
    
    R=R+Y'*Y;
    
end
 R=R/M; 
 
 [U,L,V]=svd(R);
 
 l=diag(L);
 figure(1);
 bar(l);
 betes=mean(l(3:N))
 
 H=(1-betes/l(1))*U(:,1)*U(:,1)'+(1-betes/l(2))*U(:,2)*U(:,2)';
 
 Xes=H*Y';
 
 figure(2);
 plot(X); hold on; plot(Y, 'g'); plot(Xes,'r'); hold off
 

    