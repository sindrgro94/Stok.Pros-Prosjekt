function [P,Prob, S, SimS]= task3a()
%The probability for more than 200 claims before March 1st
lambda = 3;
t = 59;%days
P = 1-poisscdf(200,lambda*t);%Exact P(N(t)>200)
%Expected waiting time Sn = SUM(Tn)
%E[Tn] = 1/l
S = 10*1/lambda;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simulation of expected waiting time
iterations = 100000;
m = zeros(1,iterations);
for i = 1:iterations
n = poissrnd(lambda*15);
s = rand(1,n)*15;
s = sort(s);
m(i) = s(10);
end
SimS = sum(m)/iterations;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simulations of Poisson process and estimation of P(N(t)>200)

x = 0; %Keeps track of all events through all the simulations. Used to estimate expected waiting time
over200 = 0;%Increases by 1 if in the given time it occurs over 200 events
iterations = 100;
for i  = 1:iterations
    n = poissrnd(lambda*t);
    if n>200
        over200 = over200+1;
    end
    x = x + n;
end
Prob = over200/iterations; %P(N(t)>200)
my = x/iterations; %E[N(t)]
fprintf('Estimert antall innkaseringer for %i dager er %3.2f \n',t,my)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot the processes Nb(t) for b = 1:100 as a funciton of time
t = 365;
hold on
for j = 1:100
    n = poissrnd(lambda*t);
    s = rand(1,n)*t;
    s = sort(s);
    plot(s,1:length(s),'r')
end
xlim([0,t])
title('N^b(t) for b = 1, ..., 100 and \lambda(t) = 3')
xlabel('Days')
ylabel('Claims')
set(gca,'fontsize',15)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Rikitg sannsynlighet er P = %f.\nEstimert sannsynlighet er Prob = %f\n',P,Prob)
end