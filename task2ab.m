function [Q,alpha,P] = task2ab(n,p)
PIX = @(n,x,p) nchoosek(n,x)*p^x*(1-p)^(n-x);
alpha = zeros(n+1);
P = zeros(n+1);
Q = zeros(n+1);
for diag = 1:n+1
    if diag == 1
        Q(diag,diag) = 1/2;
        Q(diag,diag+1) = 1/2;
    elseif diag == n+1
        Q(diag,diag) = 1/2;
        Q(diag,diag-1) = 1/2;
    else
        Q(diag,diag-1) = 1/2;
        Q(diag,diag+1) = 1/2;
    end
end

for i = 0:n
    for j = 0:n
        if Q(i+1,j+1)~= 0
         alpha(i+1,j+1) = min(PIX(n,j,p)/PIX(n,i,p),1);
        end
    end
end

for i = 0:n
    temp = 0;
    for j = 0:n
        if i~=j
            P(i+1,j+1) = Q(i+1,j+1)*alpha(i+1,j+1);
        else
            for k = 0:n
                if i ~= k
                    temp = temp+Q(i+1,k+1)*(1-alpha(i+1,k+1));
                else temp = temp+Q(i+1,i+1);
                end
            end
            P(i+1,j+1) = temp;
        end

    end
end




    