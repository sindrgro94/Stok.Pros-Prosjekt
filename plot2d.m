function plot2d()
n = 20;
p = 0.3;
len = 5000;
MC = task2c(n,p,len);
%plot the Markov chain
figure(1)
plot(1:len+1,MC)
title('Markov chain')
xlabel('Step')
ylabel('State')
xlim([0 len+1])
set(gca,'fontsize',15)
cut = 1;
while MC(cut)>11
    cut = cut + 1;
end
newMC = MC(cut:len+1);
len = length(newMC);
stateCount = zeros(1,n+1);
for state= 0:n
    stateCount(state+1) = sum(newMC == state);
end
stateCount = stateCount/sum(stateCount);
mean = sum(newMC)/len;
variance = 0;
for step = 1:len
    variance = variance + (newMC(step)-mean)^2;
end
variance = variance/(len-1);
%Plot steps from MCMC together with the binomial distribution
MCMC = figure(2);
hold on
bar(0:n,stateCount);
plot(0:n,binopdf(0:n,n,p),'*r');
title('Markov chain Monte Carlo');
xlabel('State');
ylabel('Probability');
set(gca,'fontsize',15)
fprintf('Theoretical variance: %f\n',n*p*(1-p));
fprintf('Estimated variance: %f\n\n',variance);
fprintf('Theoretical expected value: %f\n',n*p);
fprintf('Estimated expected value: %f\n',mean);
