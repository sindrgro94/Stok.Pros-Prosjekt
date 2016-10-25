function [P,Prob]= task3a()
lambda = 3;
%The probability for more than 200 claims before March 1st

t = 59;%days
P = 1-poisscdf(200,lambda*t);
%Funksjonen under er definert som P(x < X) normalfordeling 
Z = 1-normcdf(200,177,sqrt(177)); % gir en approksimasjon på hva den kommer
% til å bli


%Expected waiting time Sn = SUM(Tn)
%E[Tn] = 1/l
S = 10*1/lambda;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simulering
m = zeros(1,1000);
for i = 1:1000
n = poissrnd(lambda*10);
s = rand(1,n)*10;
s = sort(s);
m(i) = s(10);
end
SimS = sum(m)/length(m);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SIMULERING AV PROSESS%

y = zeros(1,10000);
cnt = 0;
for i  = 1:10000
    n = poissrnd(lambda*t);
    if n>200
        cnt = cnt+1;
    end
    y(i) = n;
end
Nt = 1:length(y);
plot(Nt,y,'xr')
ylim([0,250])
hist(y,max(y)-min(y))
Prob = cnt/length(y);
fprintf('Rikitg mengde er P = %f.\nApproksimert mengde Z = %f.\nSimulert mengde er Prob = %f\n',...
    P,Z,Prob)
end