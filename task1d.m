function propToFunctional = task1d()
P = [1,    0,    0,    0; %(dead,very sick,sick,functional)
     0.05, 0.85, 0.10, 0; 
     0,    0.05, 0.65, 0.3;
     0,    0,    0,    1];
n = 100; %number of "experiments"
%initialize memory space for the chain:
absorbedState = zeros(2,n);%(absorbed state;num. steps)
changeCond = [0,0,0,0];%prob. to go to another or same state
first4 = zeros(4,1);
for ex = 1:n
    numSteps = 0;
    prevState = 1;%Always start as very sick
    while prevState ~= 0 && prevState ~= 3
        numSteps = numSteps+1;
        if ex<5
            first4(ex,numSteps) = prevState;
        end
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
    first4(ex,numSteps+1) = prevState;
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
%plot ten groups:
figure(1)
bar(absorbedInGroup./numInGroup);
xlabel('Group Number')
ylabel('Percentage in absorbing state')
legend('Dead','Functional')
set(gca,'fontsize',15)
ylim([0 1])
%plot 4 different simulations
figure(2)
title('Variability in the stochastic process')
hold on
for fig = 1:4
    subplot(2,2,fig)
    y = 0;
    for i = 1:length(first4)
        y(i) = first4(fig,i);
        if first4(fig,i) == 0 || first4(fig,i) == 3
            break
        end
    end
    plot(1:length(y),y,'*-');
    ylim([0 3])
    xlim([1 length(y)])
    set(gca,'fontsize',15)
    xlabel('Step')
    ylabel('State')
end



