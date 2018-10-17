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
Sol = GaussSeidal(ones(3,1), Coff, Bs, 1000, 0.01);
disp(Sol) %   answer: 11.4369 18.010420.5155 with Ea: 0.0053 0.0060 0.0020 