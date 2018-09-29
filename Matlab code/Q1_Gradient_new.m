%Gradient Algorithm

n=20000;
u=randn(n,1);
Gz=tf([0 2 5], [1 -0.5 -0.2], 1, 'variable', 'z^-1');
[y,t]=lsim(Gz,u);
%y=y+randn(n,1);
noise=randn(n,1);
v=zeros(n,1);
for i=2:n
    v(i,1)=v(i-1,1)+noise(i,1);
    y(i,1)=y(i,1)+v(i,1);
end

figure(1)
plot(t,y);

I=zeros(4);
for i=4:n
    phi=[y(i-1);y(i-2);u(i-1);u(i-2)];
    I=I+phi*phi';    
end
I=I/n;
eigI=eig(I);

n1=1000;
theta1=zeros(n1,4);
ycap1=zeros([n1,1]);
e1=zeros([n1,1]);
lambda1=0.8;
P=ones(4);

for i=4:n1
    phi=[y(i-1);y(i-2);u(i-1);u(i-2)];
    ycap1(i,:)=theta1(i-1,:)*phi;
    e1(i)=y(i)-ycap1(i);
    theta1(i,:)=theta1(i-1,:)+transpose((phi.*e1(i))/(lambda1+phi'*phi));
end

figure(2)
plot(t(1:n1),ycap1,t(1:n1),y(1:n1));
legend('Y_{predicted}','Y_{original}')

figure(3)
plot(t(1:n1),theta1(1:n1,:));
legend('\theta_{1}','\theta_{2}','\theta_{3}','\theta_{4}');
title('Estimated PArameters')
xlabel('Iterations')
ylabel('Parameter Values')

figure(4)
plot(t(1:n1),e1(1:n1));
title('Prediction error')
xlabel('Iterations')
ylabel('Error')
