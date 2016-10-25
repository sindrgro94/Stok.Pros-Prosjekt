function [P,Prob]= task3a()
    l = 3;
    %The probability for more than 200 claims before March 1st
    P = 0;
    t = 59;%days
P = 1-poisscdf(200,l*t);
%Funksjonen under er definert som P(x < X) normalfordeling 
Z = 1-normcdf(200,177,sqrt(177)); % gir en approksimasjon på hva den kommer
% til å bli

%Expected waiting time Sn = SUM(Tn)
%E[Tn] = 1/l
S = 10*1/l;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SIMULERING AV PROSESS%

y = zeros(1,1000000);
cnt = 0;
for i  = 1:1000000
    n = poissrnd(l*t);
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