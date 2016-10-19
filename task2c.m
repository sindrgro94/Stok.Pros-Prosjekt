function [MC,states] = task2c(n,p,length)
PIX = @(n,x,p) nchoosek(n,x)*p^x*(1-p)^(n-x);
MC = zeros(n+1);%Saves the probability for transitions in the markov chain.
prev = 0;%previous state (now start state)
%next = proposed next state
states = zeros(1,n+1);%list of states we have visited
acceptedStates = 0;
for step = 1:length
    %proposing a new step:
    randNum = rand();
    if prev == 0
        if randNum<1/2
            next = prev;
        else
            next = prev+1;
        end
    elseif prev == n
        if randNum<1/2
            next = prev;
        else
            next = prev-1;
        end
    else
        if randNum<1/2
            next = prev+1;
        else
            next = prev-1;
        end
    end
    %accept or deny the new step:
    randNum = rand();
    alpha = min(PIX(n,next,p)/PIX(n,prev,p),1);
    %since Q(next,prev)/Q(prev,next) = 1 for all next and prev
    if randNum<alpha
        acceptedStates = acceptedStates + 1;
        MC(prev+1,next+1) = alpha*1/2; %Q=1/2 for all transitions
        prev = next;
    end
    states(step) = prev;
end
%uncertain here:
%fill inn the prob to stay in the state in the Markov chain:
for row = 1:n+1
    Pstay = 1;
    for col = 1:n+1
        if row ~= col
            Pstay = Pstay - MC(row,col);
        end
    end
    MC(row,row) = Pstay;
end
disp(acceptedStates);
