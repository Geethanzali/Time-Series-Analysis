clear all
clc

f=xlsread('DOW Data.xlsx');
x1=f(:,1);
x2=f(:,2);
x3=f(:,3);
y=f(:,end);

[m,n]=size(f);
p=8;
phi=zeros(4*p,m-p);

for i=1:m
    if i<=p
        continue
    end
    u1=[x1(i-8);x1(i-7);x1(i-6);x1(i-5);x1(i-4);x1(i-3);x1(i-2);x1(i-1)];
    u2=[x2(i-8);x2(i-7);x2(i-6);x2(i-5);x2(i-4);x2(i-3);x2(i-2);x2(i-1)];
    u3=[x3(i-8);x3(i-7);x3(i-6);x3(i-5);x3(i-4);x3(i-3);x3(i-2);x3(i-1)];
    Y=[y(i-8);y(i-7);y(i-6);y(i-5);y(i-4);y(i-3);y(i-2);y(i-1)];
    
    %u1=[x1(i-3) x1(i-2) x1(i-1)];
    %u2=[x2(i-3) x2(i-2) x2(i-1)];
    %u3=[x3(i-3) x3(i-2) x3(i-1)];
    %Y=[y(i-3) y(i-2) y(i-1)];
        
    phi(:,i-p)=[u1;u2;u3;Y];
end

for i=1:p
    y_actual(i)=y(i,1);
end

theta=zeros(1,4*p);
P=eye(length(theta))*1000;
lambda=0.8;
E=[];
the=[];
Y_pred=[];
Y_act=[];

for i=1:m-p
    y_pred(i)=theta*phi(:,i);
    Y_pred=[Y_pred y_pred(i)];
    the=[the;theta];
    e(i)=y(i+p,1)-y_pred(i);
    Y_act=[Y_act,y(i+p,1)];
    theta=theta+transpose((phi(:,i).*e(i))/(lambda+phi(:,i)'*phi(:,i)));
    E=[E;e(i)];
end

y_pred=[y_actual y_pred]';
y_act=[y_actual Y_act]';

ca=[];
cash=1000000;

for i= 3:size(y_pred)
    if y_pred(i)>y_pred(i-1)
       cash=cash*(y_act(i)/y_pred(i));
    else
        cash=cash;
        
    end
    ca=[ca,cash];
end

figure(1)
plot(E)
title('Prediction Error')
xlabel('Time')
ylabel('Error')
figure(2)
plot(the)
title('Parameters')
xlabel('Time')
ylabel('Parameters value')
legend('\theta_{1}','\theta_{2}','\theta_{3}','\theta_{4}','\theta_{5}','\theta_{6}','\theta_{7}','\theta_{8}','location','southwest');
figure(3)
plot(ca)
title('Cash Growth')
xlabel('Time')
ylabel('Growth of Portfolio')
figure(4)
plot(Y_pred);
hold on
plot(Y_act);
legend('Y_{prediction}','Y_{actual}','location','southeast')
xlabel('Time, t');
ylabel('Close');
title('Output profile w.r.t t');
hold off