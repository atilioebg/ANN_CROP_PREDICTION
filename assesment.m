function [V_NM,V_M,MTZ] = assesment(FILE,G)

%[V_NM,V_M,M_NM,M_M,M_G] = assesment(FILE,G)

IM = imread(FILE,'tif');

load parametros GRUPOS milho nao_milho

milho = [milho(:,3) milho(:,2)];
nao_milho = [nao_milho(:,3) nao_milho(:,2)];

p = find(G == GRUPOS);
MILHO = milho(p,:);


T = size(nao_milho,1)/(size(MILHO,1) * 50);
T = [1:T:size(nao_milho,1)];
T = round(T);
NAO_MILHO = nao_milho(T,:);


for i = 1 : size(NAO_MILHO,1)
    V_NM(i,1) = IM(NAO_MILHO(i,1),NAO_MILHO(i,2));
end;
%M_NM = mean(V_NM);


for i = 1 : size(MILHO,1)
    V_M(i,1) = IM(MILHO(i,1),MILHO(i,2));
end;
%M_M = mean(V_M);

clear p;

MTZ = zeros(256,4);
for p = 0:255
    p1 = find(V_NM< p);
    p2 = find(V_M >=p);
    
    %M_NM = size(p1,1)/size(V_NM,1);
    %M_M = size(p2,1)/size(V_M,1);
    %M_G = (size(p1,1) + size(p2,1))/(size(V_NM,1) + size(V_M,1));
    P = p + 1;
    MTZ(P,1) = size(p2,1)/size(V_M,1);
    MTZ(P,2) = size(p1,1)/size(V_NM,1);
    MTZ(P,3) = (size(p1,1) + size(p2,1))/(size(V_NM,1) + size(V_M,1));
    MTZ(P,4) = mean(MTZ(P,1:3),2);
end;   

end




