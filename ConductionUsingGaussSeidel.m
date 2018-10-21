%Tinitial = [ 10 ? ? ? 22 ];
%Ks = [0.72 0.80 6.4 0.72];
%Xs = [5 25 75 5];
% Q*(deltaX / (K*A)) = T1 - T2
% (Q/A)*(deltaX / k) = T1 - T2


%euqations
%(T1-T2)/(deltaX / K)_A = (T2-T3)/(deltaX / K)_B
%(T2-T3)/(deltaX / K)_B = (T3-T4)/(deltaX / K)_C
%(T3-T4)/(deltaX / K)_C = (T4-T5)/(deltaX / K)_D
%let (deltaX / K)_i = m_i

%(T1-T2)*m_B = (T2-T3)* m_A
%(T2-T3)*m_C = (T3-T4)* m_B
%(T3-T4)*m_D = (T4-T5)* m_C

%(m_B)T1 - (m_B)T2 = (m_A)T2 - (m_A)T3
%(m_C)T2 - (m_C)T3 = (m_B)T3 - (m_B)T4
%(m_D)T3 - (m_D)T4 = (m_C)T4 - (m_C)T5

%(m_B)T1 + (-m_A - m_B)T2 + (m_A)T3 = 0
%(m_C)T2 + (-m_B - m_C)T3 + (m_B)T4 = 0
%(m_D)T3 + (-m_C - m_D)T4 + (m_C)T5 = 0

%          (-m_A - m_B)T2 + (m_A)T3 = - (m_B)T1
%(m_C)T2 + (-m_B - m_C)T3 + (m_B)T4 = 0
%(m_D)T3 + (-m_C - m_D)T4           = - (m_C)T5

%(-m_A - m_B)T2 + (m_A)T3                          = - (m_B)T1
%(m_C)T2       + (-m_B - m_C)T3 + (m_B)T4          = 0
%                      (m_D)T3 + (-m_C - m_D)T4    = - (m_C)T5

m_A = 5/0.72;
m_B = 25/0.80;
m_C = 75/6.4;
m_D = 5/0.72;
T1 = 10;
T5 = 22;

Coff = [(-m_A - m_B) (m_A) 0; (m_C) (-m_B - m_C) (m_B); 0 (m_D) (-m_C - m_D)];
Bs = [ (- m_B * T1); 0; (- m_C * T5)];
disp(Coff)
disp(Bs)

%calling the solution:
[Sol, Solit, SolEa] = GaussSeidal(ones(3,1), Coff, Bs, 1000, 1, 1);
disp(Sol)   %   answer for T2, T3, T4 (C): 11.4369 18.0104 20.5155
disp(Solit) %   iteration number 6
disp(SolEa) %   Ea: 0.5341 0.5973 0.1951 
T2 = 11.4369;
T3 = 18.0104;
T4 = 20.5155;
AA = 30;

Q1 = (T1 - T2 ) / (m_A * 0.001 / AA); %Watts
Q2 = (T2 - T3 ) / (m_B * 0.001 / AA); %Watts
Q3 = (T3 - T4 ) / (m_C * 0.001 / AA); %Watts
Q4 = (T4 - T5 ) / (m_D * 0.001 / AA); %Watts
disp(Q1) 
disp(Q2) % double checking although they are the same
disp(Q3)
disp(Q4)

[Sol, Solit, SolEa] = GaussSeidal(ones(3,1), Coff, Bs, 1000, 1, 1.05);
disp(Sol)   %   answer for T2, T3, T4 (C): 11.4310 18.0079 20.5171
disp(Solit) %   iteration number 5
disp(SolEa) %   Ea: 0.9532 0.9213 0.2620 

firstRelax = 1;
secondRelax = 1.15;
Y1 =ones(10,1);
Y2 =ones(10,1);
for i = 1:10
    %disp(i)
    [Sol, Solit, SolEa] = GaussSeidal(ones(3,1), Coff, Bs, i, 0, firstRelax);
    S = size(SolEa);
    Y1(i) = sum (SolEa) / S(1);
    [Sol, Solit, SolEa] = GaussSeidal(ones(3,1), Coff, Bs, i, 0, secondRelax);
    S = size(SolEa);
    Y2(i) = sum(SolEa)/ S(1);
    
    %disp (Y1)
    %disp (Y2)
end

figure
plot(1:10, Y1, 1:10, Y2);

%accodring to the sum of the relative error over all paramters for the
%solution over iteration from one to ten, when we have relaxtion of 1.05,
%the solution converges faster. Also, the closer you make the relaxtion
%factor to be near 1.15, the more your solution converges faster.
