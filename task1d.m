function propToFunctional = task1d()
P = [1,    0,    0,    0; %The Markov chain
     0.05, 0.85, 0.10, 0; %(dead,very sick,sick,functional)
     0,    0.05, 0.65, 0.3;
     0,    0,    0,    1];
n = 100; %number of "experiments"
%initialize memory space for the chain:
absorbedState = zeros(2,n);%(absorbed state;num. steps)
changeCond = [0,0,0,0];%prob. to go to another or same state
for ex = 1:n
    numSteps = 0;
    prevState = 1;%Always start as very sick
    while prevState ~= 0 && prevState ~= 3
        numSteps = numSteps+1;
        x = rand(); %Random number between 0 and 1. Used to choose the next state
        changeCond(1) = P(prevState+1,1);
        changeCond(2) = P(prevState+1,2);
        changeCond(3) = P(prevState+1,3);
        changeCond(4) = P(prevState+1,4);
        %Choosing next state according to current state
        if x < changeCond(1)
            prevState = 0;
        elseif x < changeCond(2)+changeCond(1)
            prevState = 1;
        elseif x < changeCond(3)+changeCond(2)+changeCond(1)
            prevState = 2;
        else
            prevState = 3;
        end
    end
    absorbedState(1,ex) = prevState;
    absorbedState(2,ex) = numSteps;
end
propToFunctional = sum(absorbedState(1,:)==3)/n;
numInGroup = n/10;
absorbedInGroup = zeros(10,2);%(dead;functional)
for group = 1:10
   absorbedInGroup(group,1) = ...
       sum(absorbedState(1,(group-1)*numInGroup+1:group*numInGroup)==0);
   absorbedInGroup(group,2) = ...
       sum(absorbedState(1,(group-1)*numInGroup+1:group*numInGroup)==3);
end
figure
bar(absorbedInGroup./numInGroup);
xlabel('Group Number')
ylabel('Percentage in absorbing state')
legend('Dead','Functional')



