function [PI,myMC,Et] = MC_Simulation_AIDS(init)
n = 100; %Høyt nok til at man havner i en av de absorberene tilstandene
P = [1,    0,    0,    0;
     0.05, 0.85, 0.10, 0;
     0,    0.05, 0.65, 0.3;
     0,    0,    0,    1];
 % we want to simulate a MC of length n. Går relativt fort for n = 10^6
% initialize memory space for the chain
myMC = zeros(1,n);
time_spent = [0,0,0,0]; %Noterer antall ganger den befinner seg i hver tilstand
myMC(1)=init; %Initial state is 1
time_spent(init+1) = 1;


% sample next states CONDITIONAL on the one before
y = [0,0,0];
for i = 2:n
    x = rand(); %Random number between 0 and 1. Used to choose the neste state

    y(1) = P(myMC(i-1)+1,1);    %What x needs to be to get into state 1
    y(2)=y(1)+P(myMC(i-1)+1,2); %What x needs to be to get into state 2
    y(3)=y(2)+P(myMC(i-1)+1,3); %What x needs to be to get into state 2

    
    %Choosing next state according to current state
    if x <y(1)
        myMC(i) = 0;
        time_spent(1) = time_spent(1)+1;
        break;
    elseif y(1)<= x && x < y(2)
        myMC(i) = 1;
        time_spent(2) = time_spent(2)+1;
    elseif y(2)<= x && x < y(3)
        myMC(i) = 2;
        time_spent(3) = time_spent(3)+1;
    elseif y(3)<= x
        myMC(i) = 3;
        time_spent(4) = time_spent(4)+1;
        break;
    end
end

m = sum(time_spent);
myMC = myMC(1:m);
t = zeros(1,m);
for i = 2:m
    t(i) = t(i-1)+1;
end
Et = t(length(t));
PI = time_spent./m; %This is the distribution
%plot(t,myMC)
%axis([0 m -0.1 3.1])
     