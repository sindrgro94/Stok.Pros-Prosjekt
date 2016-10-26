function ret= task3b(t)
lambda = 3;
lambda_Var = @(time) 2+cos(time*pi/182.5);
tot = 0;
over200 = 0;
hold on
for j = 1:10000
    n = poissrnd(lambda*t);
    s = rand(1,n)*t;
    s = sort(s);
    y = zeros(1,floor(t*2)); % Fungerer kunn for større t
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
tot = length(y)+tot;
plot(y,1:length(y))
end
ProbOver200 = over200/10000; % 1000 fra forløkken
ret = length(y);
xlim([0,t])
title('N^b(t) for b = 1, ..., 100 and \lambda(t) = 2+cos(2\pit/180)')
xlabel('Days')
ylabel('Claims')
set(gca,'fontsize',15)


fprintf('P(N(t)>200) = %f\n',ProbOver200)

end