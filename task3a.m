function [P,Prob, S, SimS]= task3a()
lambda = 3;
%The probability for more than 200 claims before March 1st

t = 59;%days
P = 1-poisscdf(200,lambda*t);
%Expected waiting time Sn = SUM(Tn)
%E[Tn] = 1/l
S = 10*1/lambda;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simulering
m = zeros(1,1000);
for i = 1:1000
n = poissrnd(lambda*10);
s = rand(1,n)*10;
s = sort(s);
m(i) = s(10);
end
SimS = sum(m)/length(m);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SIMULERING AV PROSESS%
% Start P(N>200)
x = 0;
cnt = 0;
for i  = 1:10000
    n = poissrnd(lambda*t);
    if n>200
        cnt = cnt+1;
    end
    x = x + n;
end
Prob = cnt/1000;
% Slutt P(N>200)
%Plot the processes Nb(t) for b = 1:100 as a funciton of time
%Start Nb(t) b = 1:100
t = 365;
hold on
for j = 1:100
    n = poissrnd(lambda*t);
    s = rand(1,n)*t;
    s = sort(s);
    plot(s,1:length(s))
end
xlim([0,t])
title('N^b(t) for b = 1, ..., 100 and \lambda(t) = 3')
xlabel('Days')
ylabel('Claims')
set(gca,'fontsize',15)

%Slutt Nb(t) b = 1:100
fprintf('Rikitg mengde er P = %f.\nSimulert mengde er Prob = %f\n',...
    P,Prob)
end