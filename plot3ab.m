function plot3ab(time,N)
lambda = 3;
hold on
for j = 1:N
    n = poissrnd(lambda*time);
    s = rand(1,n)*time;
    s = sort(s);
    plot(s,1:length(s),'r')
end