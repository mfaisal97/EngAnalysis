function [ X, it, EA ] = GaussSeidal( XInitial, coefficients, Bs, MaxIterNum, Ea, relax)

%GAUSSSEIDAL General Implementation of the Gauss-Seidal Calculation

Augmented  = [XInitial; XInitial];
[paramsNum, LiterallyOne] = size(XInitial);
X = "Ea Error";
it = MaxIterNum;
EA = 100;

for iter = 1 : MaxIterNum

    for i = 1 : paramsNum
        multi_sum = sum(coefficients(i,:).*transpose(Augmented(1:paramsNum))) -  coefficients(i,i).* Augmented(i);
        Augmented(i) = relax * (Bs(i) - multi_sum) / coefficients(i,i) + Augmented(i) * (1 - relax);
    end
    
    EAcalculated = abs ((Augmented(1:paramsNum) - Augmented( paramsNum + 1 : 2*paramsNum)) ./ Augmented(1:paramsNum));  
    %disp(EAcalculated)
    
    if (sum(EAcalculated > (ones(paramsNum,1) .* (Ea / 100) )) == 0)
        X = Augmented(1: paramsNum);
        it = iter;
        EA = EAcalculated.*100;
        break
    end
    
    Augmented = [Augmented(1:paramsNum);Augmented(1:paramsNum)];
        
end

end