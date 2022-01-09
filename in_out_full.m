function [IN,OUT] = in_out_full(G)

load amostras_coletadas

AMOSTRAS = DN_milho;
NAMOSTRAS = DN_nao_milho;


AM = [AMOSTRAS NAMOSTRAS];

OUT = zeros(1,size(AM,2));

OUT(1,1:size(AMOSTRAS,2)) = 1;

IN = AM;

end



