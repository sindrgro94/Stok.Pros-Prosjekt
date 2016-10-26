function ret= task3b(t)
%Want to use thinning
lambda = 3;
lambda_Var = @(time) 2+cos(time*pi/182.5);
tot = 0;
hold on
for j = 1:1000
    n = poissrnd(lambda*t);
    s = rand(1,n)*t;
    s = sort(s);
    y = zeros(1,50);
    cnt = 0;
for i = 1:n
    X = rand;
    if X < lambda_Var(s(i))/lambda
        cnt = cnt+1;
        y(cnt) = s(i);
    end
end
tot = length(y)+tot;
plot(y,[1:length(y)])
end
ret = length(y);
end