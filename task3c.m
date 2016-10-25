function task3c()
lambda1 = 3;
days = 365;
mu = -2;
sigma = 1;
simN1 = poissrnd(lambda1*days);%numb of claims simulated with lambda=3
simN2 = task3b(days);%num of claims simulated with lambda=2+cos(t*pi/182.5)
simTotClaims1 = sum(exp(normrnd(mu,sigma,1,N1)));%total claims with lambda1
simTotClaims2 = sum(exp(normrnd(mu,sigma,1,N2)));%total claims with lambda2
expectedN1 = lambda1*days;
expectedTotClaims1 = exp(-3/2)*lambda1*days;
fprintf('Expected total claim amount with?\lambda = 3: %f\n',...
    expectedTotClaims1)
fprintf('Simulated total claim amount with \lambda = 3: %f\n',...
    simTotClaims1)
