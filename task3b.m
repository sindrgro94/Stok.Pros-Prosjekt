function ret= task3b(t)
%Want to use thinning
lambda = 3;
lambda_Var = @(time) 2+cos(time*pi/182.5);
n = poissrnd(lambda*t);
s = rand(1,n)*t;
s = sort(s);
y = zeros(1,5);
cnt = 0;
for i = 1:n
    X = rand;
    if X < lambda_Var(s(i))/lambda
        cnt = cnt+1;
        y(cnt) = s(i);
    end
end
ret = length(y);
hold on
plot(y,[1:length(y)],'ob')
plot(s,[1:length(s)],'xr')

end