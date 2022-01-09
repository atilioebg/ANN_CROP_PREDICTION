function [C2]=rede(IM,NET,LIN)
A = [];

resto = mod(size(IM,2),10000);
redondo = size(IM,2) - resto;

for i = 1:10000:redondo
    j = i+9999;
    a = NET(double(IM(:,i:j)));
    A = [A a];
end;

R = redondo + 1;
a = NET(double(IM(:,R:size(IM,2))));
A = [A a];

C = [];
for i = LIN:LIN:size(A,2);
    j = i - (LIN-1);
    C = cat(3,C, A(1,j:i));
end;
C2 = shiftdim(C,1);

end