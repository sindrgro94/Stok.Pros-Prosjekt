function alpha = oppg2(n)
PIX = @(n,x,p) nchoosek(n,x)*p^x*(1-p)^(n-x);
p = 0.5;
alpha = zeros(n+1);
Q = zeros(n)
%Hele Q blir 0.5
% for i = 1:n
%     for j = 1:n
%         if Q(i,j) == 0
%             Q(i,j) = 1/2;
%         elseif abs(Q(i,j))< n
%             Q(i,j) = 1/2;
%         elseif Q(i,j)==n
%             Q(i,j) = 1/2;
%         else Q(i,j) = 0;
%         end
%     end
% end

for i = 0:n
    for j = 0:n
         alpha(i+1,j+1) = min(PIX(n,j,p)/PIX(n,i,p),1);    
    end
end
end

    