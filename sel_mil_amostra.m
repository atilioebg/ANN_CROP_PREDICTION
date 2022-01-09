function [x] = sel_mil_amostra(AMOSTRA,NUM_AMOS)

R = size(AMOSTRA,1);


passo = R/NUM_AMOS;

pos = [1:passo:R];
pos = round(pos);

x = AMOSTRA(pos,:);

end




