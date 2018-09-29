%Recursive Least Squares method
M = xlsread('outputdata');
y5=M(:,2);
v=randn(length(y5),1);

t= length(v);
theta=zeros(2,1);
p=eye(length(theta)) * 1000;
TH=[];
E=[];
y_pred = zeros(t, 1)

for i=3:t
    phi=[y5(i-1) v(i-1)]';
    y_pred(i) = phi' * theta;
    e=y5(i)-phi'*theta;
    lambda=0.8;
    theta=theta+(p*phi*e/(lambda+phi'*p*phi));
    p=(p-(p*phi*phi'*p)/(lambda+phi'*p*phi))/lambda;
    TH=[TH;theta'];
    E=[E;e];    
end

figure(1)
plot(TH);
title('Estimated parameters')
legend('theta1', 'theta2')
xlabel('time')
ylabel('Parameter values')

figure(2)
plot(E);
title('Prediction Error')
xlabel('time')
ylabel('Error')

figure(3)
plot(xcorr(E))
title('Auto-correlation plot')

figure(4)
plot(y_pred)
hold on
plot(y)
legend('y_{original}', 'y_{predicted}')
xlabel('time')
ylabel('output')
title('Comparision of original and predicted output')
hold off
