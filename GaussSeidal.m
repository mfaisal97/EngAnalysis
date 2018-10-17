function [ X ] = GaussSeidal( XInitial, coefficients, Bs, MaxIterNum, Ea )

%GAUSSSEIDAL General Implementation of the Gauss-Seidal Calculation

Augmented  = [XInitial; XInitial];
[paramsNum, LiterallyOne] = size(XInitial);

for iter = 1 : MaxIterNum

    for i = 1 : paramsNum
        Augmented(i) = sum(coefficients(i,:).*transpose(Augmented(1:paramsNum))) -  coefficients(i,i).* Augmented(i);
        Augmented(i) = (Bs(i) - Augmented(i)) / coefficients(i,i);
    end
    
    EAcalculated = abs ((Augmented(1:paramsNum) - Augmented( paramsNum + 1 : 2*paramsNum)) ./ Augmented(1:paramsNum));  
    
    if (sum(EAcalculated > (ones(paramsNum,1) .* Ea )) == 0)
        X = Augmented(1: paramsNum);
        break
    end
    
    Augmented = [Augmented(1:paramsNum);Augmented(1:paramsNum)];
        
end

end