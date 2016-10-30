function MC = task2c(n,p,len)
PIX = @(n,x,p) nchoosek(n,x)*p^x*(1-p)^(n-x);%binomial distribution function
prev = n;%previous state (Starting in the (n-1)th state
%next = proposed next state
acceptedStates = 0;
MC = zeros(1,len+1);%Prealocating Markov Chain
MC(1) = prev;%Initiates first state
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
                                                                                %Trenger vi dette?
    if randNum< min(PIX(n,next,p)/PIX(n,prev,p),1)
        acceptedStates = acceptedStates + 1;
        prev = next;
    end
    MC(step+1) = prev;%ended up en prev this step
end
disp(acceptedStates/len);
end