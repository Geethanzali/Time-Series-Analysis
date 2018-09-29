M = xlsread('outputdata');
y=M(:,2);
v=randn(length(y),1);
n= length(v);
TH = [];
E = [];

%n1=1000;
theta1=zeros(n,2);
ycap1=zeros([n,1]);
e1=zeros([n,1]);
lambda1=0.8;
P=ones(2);

for i=4:n
    phi=[y(i-1);v(i-1)];
    ycap1(i,:)=theta1(i-1,:)*phi;
    e1(i)=y(i)-ycap1(i);
    theta1(i,:)=theta1(i-1,:)+transpose((phi.*e1(i))/(lambda1+phi'*phi));

end

figure(1)
plot(y)
hold on
plot(ycap1)
legend('y_{original}', 'y_{predicted}')
xlabel('time')
ylabel('output')
title('Comparision of original and predicted output')
hold off

% figure(1)
% plot(theta1)
% xlabel('time')
% ylabel('Parameter vlaues')
% legend('a', 'c')
% title('Estimated Parameters')
% 
% figure(2)
% plot(e1)
% xlabel('time')
% ylabel('Error')
% title('Predictive error')
% 
% figure(3)
% plot(xcorr(e1))
% title('Auto-Correlation plot')
