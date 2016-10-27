function ret = task3bd(t)
lambda = 3;
lambda_Var = @(time) 2+cos(time*pi/182.5);
tot = 0;
over200 = 0;
figure
hold on
simulations = 10000;
task3d1 = zeros(simulations,t*5);%event times for 1d
task3d2 = zeros(simulations,floor(t*3));%event times for 1d
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
%Calculating the discount rates:
task3d1 = exp(-alpha*task3d1);
task3d2 = exp(-alpha*task3d2);
D1 = zeros(simulations,1);
D2 = zeros(simulations,1); 
for j = 1:simulations
    i = 1;
    while task3d1(j,i) ~= 1
        D1(j) = D1(j) + exp(normrnd(mu,sigma))*task3d1(j,i);
        D2(j) = D2(j) + exp(normrnd(mu,sigma))*task3d2(j,i);
        i = i + 1;
    end
end

end