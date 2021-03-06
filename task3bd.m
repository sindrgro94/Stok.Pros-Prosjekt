function ret = task3bd(t)
lambda = 3;
lambda_Var = @(time) 2+cos(time*pi/182.5);
tot = 0;
over200 = 0;
figure
hold on
simulations = 10000;
task3d1 = zeros(simulations,t*6);%event times for 3d (1 = constant lambda)
task3d2 = zeros(simulations,floor(t*6));%event times for 3d (2 = varying lambda)
for j = 1:simulations
    n = poissrnd(lambda*t);
    s = rand(1,n)*t;
    s = sort(s);
    task3d1(j,1:length(s)) = s;
    y = zeros(1,floor(t*1.5)); % (t>15)
    cnt = 0;
    for i = 1:n %Thinning
        X = rand;
        if X < lambda_Var(s(i))/lambda
            cnt = cnt+1;
            y(cnt) = s(i);
        end
    end %thinning stop
    if cnt > 200
        over200 = over200+1;
    end
    task3d2(j,1:length(y))=y;
    tot = length(y)+tot;
    %plot(y,1:length(y))
end
ProbOver200 = over200/simulations;
ret = length(y);
xlim([0,t])
title('N^b(t) for b = 1, ..., 100 and \lambda(t) = 2+cos(2\pit/180)')
xlabel('Days')
ylabel('Claims')
set(gca,'fontsize',15)
fprintf('P(N(t)>200) = %f\n',ProbOver200)
%%%%%%%%%   task 3D:
mu = -2;
sigma = 1;
alpha = 0.001;
%Calculating the discount rates:
task3d1 = exp(-alpha*task3d1);
task3d2 = exp(-alpha*task3d2);
D1 = zeros(simulations,1);
D2 = zeros(simulations,1);
for j = 1:simulations
    i = 1;
    while task3d1(j,i) ~= 1 || i == length(task3d1)+1
        D1(j) = D1(j) + exp(normrnd(mu,sigma))*task3d1(j,i);
        i = i + 1;
    end
    i = 1;
    while task3d2(j,i) ~=1 || i == length(task3d2)+1
        D2(j) = D2(j) + exp(normrnd(mu,sigma))*task3d2(j,i);
        i = i + 1;
    end
end
D1 = sort(D1);
D2 = sort(D2);
index = floor(simulations*0.95);% 95% of the simulations will have lower index
fprintf('With lambda = 3 the company must hold %f million kroner',D1(index))
fprintf(' to be 95 percent sure they have enough money to cover the claims \n \n')

fprintf('With lambda = 2 + cos(t*pi/182.5) the company must hold %f',D2(index))
fprintf(' million kroner to be 95 percent sure they have enough money')
fprintf(' to cover the claims \n \n')
end