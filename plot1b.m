%plot1b - (Want to show how the initial state loses it's influence)
clear all
numSteps = [10 100 1000];
stateCount = zeros(3,3,3);
%(initial state,percentage in each state, number of steps)
for steps = 1:3
    for initState=1:3
        stateCount(initState,:,steps) = transpose(oppg1b(numSteps(steps),initState-1));
    end
end
figure(1)
titles = {'Steps=10','Steps=100','Steps=1000','Stationary distribution'};
for steps = 1:4
    subplot(2,2,steps);
    if steps <= 3
        bar(0:2,squeeze(stateCount(:,:,steps)));
        title(titles{steps});
    else
        theoretical = [0.150 0.6615 0.1875;0.150 0.6615 0.1875;0.150 0.6615 0.1875];
        bar(0:2,theoretical);
        title(titles{steps},'fontsize',15);
    end
   xlabel('Initial state');
   ylabel('% of time in state')
   set(gca,'fontsize',15)
end
legend('State = 0','State = 1','State = 2');
