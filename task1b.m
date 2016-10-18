function PI = oppg1b(n,initState)
% we want to simulate a MC of length n.
P = [0.50, 0.35, 0.15;
     0.10, 0.75, 0.15;
     0.05, 0.60, 0.35];% define the transition probability matrix
myMC = zeros(1,n);% initialize memory space for the chain
myMC(1)=initState; %Initial state
time_spent = [0,0,0]; %Number of times in each state
y = [0,0];%next sample states CONDITIONAL on the one before
for i = 2:n
    x = rand(); %Random number between 0 and 1. Used to choose the next state
    y(1) = P(myMC(i-1)+1,1);    %What x needs to be to get into state 1
    y(2)=y(1)+P(myMC(i-1)+1,2); %What x needs to be to get into state 2
    if x <y(1)%Choosing next state according to current state
        myMC(i) = 0;
        time_spent(1) = time_spent(1)+1;
    elseif y(1)<= x && x< y(2)
        myMC(i) = 1;
        time_spent(2) = time_spent(2)+1;
    elseif x>=y(2)
        myMC(i) = 2;
        time_spent(3) = time_spent(3)+1;
    end
    
end
PI = time_spent./n; %This is the distribution

