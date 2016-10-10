function Markov_chain_realizations;

%% Set Markov transition matrix
alpha=0.9;
beta=0.5;
P=[alpha 1-alpha;1-beta beta];

%% - Simulate chain
n=100; % length of Markov chain
x(1)=1;
for i=1:n-1,
    % Draw random uniform number
    u=rand;
    if (x(i)==0)
       % Set state at next time from line in P
       if (u<alpha)
           x(i+1)=0;
       else
           x(i+1)=1;
       end

    else
       if (u<(1-beta))
           x(i+1)=0;
       else
           x(i+1)=1;
       end
    end
end

% Plot realization of Markov chain
figure(1);
clf;
plot(x,'k*-');
axis([0 n -0.1 1.1])

disp('Two-step transitions')
P*P

disp('100-step transitions')
P^100