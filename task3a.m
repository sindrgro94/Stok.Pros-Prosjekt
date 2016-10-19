function [P,S]= task3a()
    l = 3;
    %The probability for more than 200 claims before March 1st
    P = 0;
    t = 59;
    X = 0;
%Fungerer ikke fordi (l*t)^i blir for stor for maskinen
%Kan heller bruke at Poisson går mot normalfordling med my = l*t og sigma
%sqrt(l*t)
    for i = 0:200
        if i<=160
            P = P+exp(log(l*t)*i-l*t)/factorial(i);
         else
            n = log(l*t*exp(1)/i)*i;
            %x = exp(log(l*t*exp(1)/i)*i)*1/sqrt(2*pi*i);
            P = P+exp(n-l*t)/sqrt(2*pi*i);
        end
    end
P = 1-P;
%Funksjonen under er definert som P(x < X) normalfordeling 
Z = 1-normcdf(200,177,sqrt(177)); % gir en approksimasjon på hva den kommer
% til bli


%Expected waiting time Sn = SUM(Tn)
%E[Tn] = 1/l
S = 10*1/l;
end