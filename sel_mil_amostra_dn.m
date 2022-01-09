function [x] = sel_mil_amostra(AMOSTRA,NUM_AMOS,DN)

if (strcmp(DN,'no') == 1)
    
    R = size(AMOSTRA,1);
    passo = R/NUM_AMOS;
    pos = [1:passo:R];
    pos = round(pos);
    x = AMOSTRA(pos,:);
    
end;

if (strcmp(DN,'yes') == 1)
    
    R = size(AMOSTRA,2);
    passo = R/NUM_AMOS;
    pos = [1:passo:R];
    pos = round(pos);
    x = AMOSTRA(:,pos);
    
end;

end




