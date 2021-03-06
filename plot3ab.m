function plot3ab(time,N)
%%%%%%%%%%%%%%%%%%%%%%
%Lagrer nye figurer hver gang
%%%%%%%%%%%%%%%%%%%%%%
lambda = 3;
format long
h = figure();
hold on
for j = 1:N
    n = poissrnd(lambda*time);
    s = rand(1,n)*time;
    s = sort(s);
    plot(s,1:length(s))
end
xlim([0,time])
title('N^b(t) for b = 1, ..., 100 and \lambda(t) = 3')
xlabel('Days')
ylabel('Claims')
set(gca,'fontsize',15)
saveTightFigure(h,'3A-2')
print(gcf,'3A-1.pdf','-dpdf','-painters','-r300'); %<-- a high quality pdf
hold off

lambda_Var = @(time) 2+cos(time*pi/182.5);
h = figure();
hold on
for j = 1:100
    n = poissrnd(lambda*time);
    s = rand(1,n)*time;
    s = sort(s);
    y = zeros(1,floor(time*1.5)); % Fungerer kunn for st�rre t
    cnt = 0;
for i = 1:n %Thinning
    X = rand;
    if X < lambda_Var(s(i))/lambda
        cnt = cnt+1;
        y(cnt) = s(i);
    end
end %thinning stop
plot(y,1:length(y))
end
xlim([0,time])
title('N^b(t) for b = 1, ..., 100 and \lambda(t) = 2+cos(\pit/182.5)')
xlabel('Days')
ylabel('Claims')
set(gca,'fontsize',15)
saveTightFigure(h,'3B-2')
end