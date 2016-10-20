function [P,Prob]= task3a()
    l = 3;
    %The probability for more than 200 claims before March 1st
    P = 0;
    t = 59;%days
%Fungerer ikke fordi (l*t)^i blir for stor for maskinen
%Kan heller bruke at Poisson går mot normalfordling med my = l*t og sigma=
%sqrt(l*t) evt en approksimasjon til n! her brukes begge
    for i = 0:200
        if i<=160
            P = P+exp(log(l*t)*i-l*t)/factorial(i);
        else %Stirling apprximation
            n = log(l*t*exp(1)/i)*i; 
            P = P+exp(n-l*t)/sqrt(2*pi*i);
        end
    end
P = 1-P;
%Funksjonen under er definert som P(x < X) normalfordeling 
Z = 1-normcdf(200,177,sqrt(177)); % gir en approksimasjon på hva den kommer
% til å bli

%Expected waiting time Sn = SUM(Tn)
%E[Tn] = 1/l
S = 10*1/l;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SIMULERING AV PROSESS%
tic
y = zeros(1,10000);%1000000 iterasjoner tok ca 15 min
n = 0;
for i = 1:10000
    x = 0;
    time = 0;
    cnt = 0;
while time < 59
%     Fra boka har vi at forventet ventetid mellom to hendleser er gitt ved
%     en exponentialfordeling med my = 1/lambda 
%     exprnd(1/l) gives a random value from exp.distr width E[x]= mu
    x = x+exprnd(1/l);
    if x > 59
        break
    end
    cnt = cnt+1;
end
    if cnt > 200
        n = n+1;
    end
    y(i) = cnt;
end
%time = cumsum(x);
%Nt = 1:length(x);
%plot(time,Nt)
Prob = n/length(y);
fprintf('Rikitg mengde er P = %f.\nApproksimert mengde Z = %f.\nSimulert mengde er Prob = %f\n',...
    P,Z,Prob)
toc
%Ser at simuleringen alltid gir en litt for høy sannsynlighet 
end