function [PM,media] = roda_rede2(NET,FILENAME)

load P1_REAMOSTRADA_CG
[PART_1]=rede(P1R,NET,LIN_P1);
clear LIN_P1
clear P1R

load P2_REAMOSTRADA_CG
[PART_2]=rede(P2R,NET,LIN_P2);
clear LIN_P2
clear P2R

load P3_REAMOSTRADA_CG
[PART_3]=rede(P3R,NET,LIN_P3);
clear LIN_P3
clear P3R

load P4_REAMOSTRADA_CG
[PART_4]=rede(P4R,NET,LIN_P4);
clear LIN_P4
clear P4R


P12 = [PART_1 PART_2];
clear PART_1;
clear PART_2;

P34 = [PART_3 PART_4];
clear PART_3;
clear PART_4;

C2 = [P12; P34];
clear P12;
clear P34;

load background.mat
C2(background) = 0;

load pontos_milho.mat
PM = [];
for i = 1:size(pontos_milho,1);
    PM = [PM; C2(pontos_milho(i,3),pontos_milho(i,2))];
end;

media = mean(PM);
PM = PM*255;

filename = [FILENAME '.tif'];
imwrite(C2,filename,'tif');
end