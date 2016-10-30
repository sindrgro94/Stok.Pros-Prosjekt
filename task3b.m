function ret= task3b(t)
lambda = 3; %maximum value of lambda
lambda_Var = @(time) 2+cos(time*pi/182.5);
iterations = 1000;
over200 = 0; %Increases by 1 if in the given time it occurs over 200 events
tot = 0;
hold on
for j = 1:iterations
    n = poissrnd(lambda*t);
    s = rand(1,n)*t;
    s = sort(s);
    y = zeros(1,floor(t*1.5));
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
tot = tot+cnt;
plot(y,1:length(y))
end
xlim([0,t])
title('N^b(t) for b = 1, ..., 100 and \lambda(t) = 2+cos(\pit/180)')
xlabel('Days')
ylabel('Claims')
set(gca,'fontsize',15)

ProbOver200 = over200/iterations;%P(N(t)>200)
ret = tot/iterations; % average number of events after thinning 
end