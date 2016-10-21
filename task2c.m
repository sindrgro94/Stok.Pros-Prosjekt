function MC = task2c(n,p,len)
PIX = @(n,x,p) nchoosek(n,x)*p^x*(1-p)^(n-x);
prev = 20;%previous state (now start state)
%next = proposed next state
acceptedStates = 0;
MC = zeros(1,len+1);%Saves the markov chain.
MC(1) = prev;%saves the start state
for step = 1:len
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
    %since Q(next,prev)/Q(prev,next) = 1 for all next and prev
    if randNum< min(PIX(n,next,p)/PIX(n,prev,p),1)
        acceptedStates = acceptedStates + 1;
        prev = next;
    end
    MC(step+1) = next;%ended up en prev this step
end
disp(acceptedStates);
