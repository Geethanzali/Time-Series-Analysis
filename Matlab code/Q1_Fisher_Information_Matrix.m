I=zeros(4,4);
phi=zeros(4,1);

for i=4:length(u5)
    phi=[y5(i-1);y5(i-2);u5(i-1);u5(i-2)];
    summation=phi*phi';
    I=I+summation;
end
T=length(u5)-4;
I=I/T;
eig_I=eig(I);
K=cond(I);