function [IN,OUT] = in_out(GRUPOS,G)

load amostras_coletadas

AMOSTRAS = DN_milho;
NAMOSTRAS = DN_nao_milho;

p = find(G == GRUPOS);

AM_M = AMOSTRAS(:,p);

T = size(NAMOSTRAS,2)/(size(AM_M,2) * 1335);
T = [1:T:size(NAMOSTRAS,2)];
T = round(T);

AM_NM = NAMOSTRAS(:,T);

AM = [AM_M AM_NM];

OUT = zeros(1,size(AM,2));

OUT(1,1:size(AM_M,2)) = 1;

IN = AM;

end



