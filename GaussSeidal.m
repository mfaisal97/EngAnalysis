function [ X ] = GaussSeidal( XInitial, coefficients, Bs, MaxIterNum, Ea )

%GAUSSSEIDAL General Implementation of the Gauss-Seidal Calculation

disp(XInitial(:))
disp(coefficients(:,:))
disp(Bs(:))
disp(MaxIterNum)
disp(Ea)

Augmented  = [XInitial; XInitial];
disp(Augmented(:))
[paramsNum, tr] = size(XInitial);

for iter = 1 : MaxIterNum
    
    indstart = paramsNum* mod(iter,2) + 1;
    indend = paramsNum* ( mod(iter,2)+ 1 );
    
    disp(indstart)
    disp(Augmented)
    disp(indend)
    
    for i = indstart : indend
        disp(i)
        disp(coefficients(i - indstart +1,:))
        disp(Augmented(indstart:indend))
        disp(transpose(Augmented(indstart:indend)))
        disp(coefficients(i - indstart +1,:).*transpose(Augmented(indstart:indend)))
        Augmented(i) = sum(coefficients(i - indstart +1,:).*transpose(Augmented(indstart:indend))) -  coefficients(i - indstart +1,i - indstart +1).* Augmented(i);
        Augmented(i) = (Bs(i - indstart +1) - Augmented(i)) / coefficients(i - indstart +1,i - indstart +1);
        disp(Augmented(i))
    end
    
    EAcalculated = abs ((Augmented(1:paramsNum) - Augmented( paramsNum + 1 : 2*paramsNum)) ./ Augmented(indstart:indend));  
    
    disp(Augmented)
    disp(EAcalculated)
    disp(EAcalculated > (ones(paramsNum,1) .* Ea))
    disp(sum(EAcalculated > (ones(paramsNum,1) .* Ea )))
    if (sum(EAcalculated > (ones(paramsNum,1) .* Ea )) == 0)
        X = Augmented(indstart: indend);
        break
    end
    
    Augmented = [Augmented(indstart:indend);Augmented(indstart:indend)];
        
end

end

