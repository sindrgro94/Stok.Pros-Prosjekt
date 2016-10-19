function plot2d()
n = 20;
p = 0.3;
len = 5000;
[MC,states] = task2c(n,p,len);
stateCount = zeros(1,n+1);
for state= 0:n
    stateCount(state+1) = sum(states == state);
end
stateCount = stateCount/sum(stateCount);
mean = sum(states)/len;
variance = 0;
for step = 1:5000
    variance = variance + (states(step)-mean)^2;
end
variance = variance/(len-1);
%Plot steps from MCMC together with the binomial distribution
x = 0:n;
y = zeros(1,n+1);
for i = 1:n+1
    y(i) = nchoosek(n,x(i))*p^x(i)*(1-p)^(n-x(i));
end
figure(1)
hold on
bar(0:n,stateCount);
plot(x,y,'*');