function [MULTI,EVI,NDVI] = stack3(FILE,NIMG)

%%%============= FAZ O STACK DAS IMAGENS EM 3 GRUPOS E SALVA ===========%%%

FILE = num2str(FILE);

if NIMG <= 4

    MULTI = [];
    EVI   = [];
    NDVI  = [];
    for i = 1 : NIMG
    
        brnm = [FILE(i,:) '_brnm.tif'];
        evi  = [FILE(i,:) '_evi.tif'];
        ndvi = [FILE(i,:) '_ndvi.tif'];
    
        IM1 = imread(brnm,'tif');
        IM2 = imread(evi ,'tif');
        IM3 = imread(ndvi,'tif');
    
        MULTI = cat(3,MULTI,IM1);
        EVI = cat(3,EVI,IM2);
        NDVI = cat(3,NDVI,IM3);

        clear IM1;
        clear IM2;
        clear IM3;
    
        clear brnm;
        clear evi;
        clear ndvi;
    end;
    save data_1 MULTI EVI NDVI
end;

%****************
if (NIMG>4) && (NIMG <= 8)
    
    MULTI = [];
    EVI   = [];
    NDVI  = [];
    for i = 1 : 4
    
        brnm = [FILE(i,:) '_brnm.tif'];
        evi  = [FILE(i,:) '_evi.tif'];
        ndvi = [FILE(i,:) '_ndvi.tif'];
    
        IM1 = imread(brnm,'tif');
        IM2 = imread(evi ,'tif');
        IM3 = imread(ndvi,'tif');
    
        MULTI = cat(3,MULTI,IM1);
        EVI = cat(3,EVI,IM2);
        NDVI = cat(3,NDVI,IM3);

        clear IM1;
        clear IM2;
        clear IM3;
    
        clear brnm;
        clear evi;
        clear ndvi;
    end;
    save data_1 MULTI EVI NDVI


    MULTI = [];
    EVI   = [];
    NDVI  = [];
    for i = 5 : NIMG
    
        brnm = [FILE(i,:) '_brnm.tif'];
        evi  = [FILE(i,:) '_evi.tif'];
        ndvi = [FILE(i,:) '_ndvi.tif'];
    
        IM1 = imread(brnm,'tif');
        IM2 = imread(evi ,'tif');
        IM3 = imread(ndvi,'tif');
    
        MULTI = cat(3,MULTI,IM1);
        EVI = cat(3,EVI,IM2);
        NDVI = cat(3,NDVI,IM3);

        clear IM1;
        clear IM2;
        clear IM3;
    
        clear brnm;
        clear evi;
        clear ndvi;
    end;
    save data_2 MULTI EVI NDVI
end;
%******************
if (NIMG>8) && (NIMG <= 13)

    MULTI = [];
    EVI   = [];
    NDVI  = [];
    for i = 1 : 4
    
        brnm = [FILE(i,:) '_brnm.tif'];
        evi  = [FILE(i,:) '_evi.tif'];
        ndvi = [FILE(i,:) '_ndvi.tif'];
    
        IM1 = imread(brnm,'tif');
        IM2 = imread(evi ,'tif');
        IM3 = imread(ndvi,'tif');
    
        MULTI = cat(3,MULTI,IM1);
        EVI = cat(3,EVI,IM2);
        NDVI = cat(3,NDVI,IM3);

        clear IM1;
        clear IM2;
        clear IM3;
    
        clear brnm;
        clear evi;
        clear ndvi;
    end;
    save data_1 MULTI EVI NDVI

    MULTI = [];
    EVI   = [];
    NDVI  = [];
    for i = 5 : 8
    
        brnm = [FILE(i,:) '_brnm.tif'];
        evi  = [FILE(i,:) '_evi.tif'];
        ndvi = [FILE(i,:) '_ndvi.tif'];
    
        IM1 = imread(brnm,'tif');
        IM2 = imread(evi ,'tif');
        IM3 = imread(ndvi,'tif');
    
        MULTI = cat(3,MULTI,IM1);
        EVI = cat(3,EVI,IM2);
        NDVI = cat(3,NDVI,IM3);

        clear IM1;
        clear IM2;
        clear IM3;
    
        clear brnm;
        clear evi;
        clear ndvi;
    end;
    save data_2 MULTI EVI NDVI


    MULTI = [];
    EVI   = [];
    NDVI  = [];
    for i = 9 : NIMG;
    
        brnm = [FILE(i,:) '_brnm.tif'];
        evi  = [FILE(i,:) '_evi.tif'];
        ndvi = [FILE(i,:) '_ndvi.tif'];
    
        IM1 = imread(brnm,'tif');
        IM2 = imread(evi ,'tif');
        IM3 = imread(ndvi,'tif');
    
        MULTI = cat(3,MULTI,IM1);
        EVI = cat(3,EVI,IM2);
        NDVI = cat(3,NDVI,IM3);

        clear IM1;
        clear IM2;
        clear IM3;
    
        clear brnm;
        clear evi;
        clear ndvi;
    end;
    save data_3 MULTI EVI NDVI
end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%        BACKGROUND      %%%%%%%%%%%%%%%%%%%%%%%%%
background = find(MULTI(:,:,1)<=0);
save background background
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear MULTI;
clear EVI;
clear NDVI;

%%%=====================================================================%%%
%%%%%%%%%%%%%%%%%%%%%%%% CALCULO GRADIENTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%=====================================================================%%%
if (NIMG<=4)
    load data_1.mat
    M1 = MULTI;
    clear MULTI;
    clear EVI;
    clear NDVI;
end;
    
if (NIMG>4) && (NIMG<=8)
    load data_1.mat
    M1 = MULTI;
    clear MULTI;
    clear EVI;
    clear NDVI;
    
    load data_2.mat
    M2 = MULTI;
    clear MULTI;
    clear EVI;
    clear NDVI;
end;

if (NIMG>8) && (NIMG<=13)
    
    load data_1.mat
    M1 = MULTI;
    clear MULTI;
    clear EVI;
    clear NDVI;
    
    load data_2.mat
    M2 = MULTI;
    clear MULTI;
    clear EVI;
    clear NDVI;
    
    load data_3.mat
    M3 = MULTI;
    clear MULTI;
    clear EVI;
    clear NDVI;
end;

if (NIMG<=4)
    M = cat(3,M1);
    clear M1;
    clear M2;
    clear M3;
end;

if (NIMG>4) && (NIMG<=8)
    M = cat(3,M1,M2);
    clear M1;
    clear M2;
    clear M3;
end;

if (NIMG>8) && (NIMG<=13)
    M = cat(3,M1,M2,M3);
    clear M1;
    clear M2;
    clear M3;
end;
    

GRAD = [];
    for i = 1 : (size(M,3)-4)
        G = M(:,:,(i+4))-M(:,:,i);
        GRAD = cat(3,GRAD,G);
    end;
    
    
if (NIMG<=4)
    TE = (NIMG-1)*4;
    GRAD1 = GRAD(:,:,1:TE);    
    clear GRAD;
    clear M;
    clear G;
    clear TE;
    save GRAD1 GRAD1
    clear i
    clear GRAD1;
    clear GRAD2;
    clear GRAD3;    
end;

if (NIMG>4) && (NIMG<=8)
    TE = (NIMG-1)*4;
    GRAD1 = GRAD(:,:,1:16);
    GRAD2 = GRAD(:,:,17:TE);    
    clear GRAD;
    clear M;
    clear G;
    clear TE;
    save GRAD1 GRAD1
    save GRAD2 GRAD2
    clear i
    clear GRAD1;
    clear GRAD2;
    clear GRAD3;   
end;

if (NIMG>8) && (NIMG<=13)
    TE = (NIMG-1)*4;
    GRAD1 = GRAD(:,:,1:16);
    GRAD2 = GRAD(:,:,17:32);
    GRAD3 = GRAD(:,:,33:TE);
    clear TE;
    clear GRAD;
    clear M;
    clear G;
    save GRAD1 GRAD1
    save GRAD2 GRAD2
    save GRAD3 GRAD3
    clear i
    clear GRAD1;
    clear GRAD2;
    clear GRAD3; 
end;
%%%=====================================================================%%%
%%%%%%%%%%%%%%%%%%%% DIVIDE IMAGEM EM 4 QUADRANTES %%%%%%%%%%%%%%%%%%%%%%%%
%%%=====================================================================%%%
load data_1
load GRAD1

   
    IM_D1M   = MULTI;
    IM_D1E   = EVI;
    IM_D1N   = NDVI;
    IM_D1G   = GRAD1;
    
    clear EVI;
    clear NDVI;
    clear MULTI;
    clear GRAD1;  
    
    L = size(IM_D1M,1);
    C = size(IM_D1M,2);

    X1 = ceil(L/2);
    X2 = X1 + 1;
    Y1 = ceil(C/2);
    Y2 = Y1 + 1;

    IM1_P1M = IM_D1M(1 :X1 ,1 :Y1, :);
    IM1_P2M = IM_D1M(1 :X1 ,Y2:end,:);
    IM1_P3M = IM_D1M(X2:end,1 :Y1, :);
    IM1_P4M = IM_D1M(X2:end,Y2:end,:);
    
    IM1_P1E = IM_D1E(1 :X1 ,1 :Y1, :);
    IM1_P2E = IM_D1E(1 :X1 ,Y2:end,:);
    IM1_P3E = IM_D1E(X2:end,1 :Y1, :);
    IM1_P4E = IM_D1E(X2:end,Y2:end,:);
    
    IM1_P1N = IM_D1N(1 :X1 ,1 :Y1, :);
    IM1_P2N = IM_D1N(1 :X1 ,Y2:end,:);
    IM1_P3N = IM_D1N(X2:end,1 :Y1, :);
    IM1_P4N = IM_D1N(X2:end,Y2:end,:);
    
    IM1_P1G = IM_D1G(1 :X1 ,1 :Y1, :);
    IM1_P2G = IM_D1G(1 :X1 ,Y2:end,:);
    IM1_P3G = IM_D1G(X2:end,1 :Y1, :);
    IM1_P4G = IM_D1G(X2:end,Y2:end,:);
    

    save IM1_P1 IM1_P1M IM1_P1E IM1_P1N IM1_P1G  
    save IM1_P2 IM1_P2M IM1_P2E IM1_P2N IM1_P2G  
    save IM1_P3 IM1_P3M IM1_P3E IM1_P3N IM1_P3G 
    save IM1_P4 IM1_P4M IM1_P4E IM1_P4N IM1_P4G

    clear IM_D1M;
    clear IM_D1E;
    clear IM_D1N;
    clear IM_D1G;    
    clear L;
    clear C;
    clear X1;
    clear X2
    clear Y1;
    clear Y2;
    clear IM1_P1M;
    clear IM1_P1E;
    clear IM1_P1N;
    clear IM1_P1G;
    clear IM1_P2M;
    clear IM1_P2E;
    clear IM1_P2N;
    clear IM1_P2G;
    clear IM1_P3M;
    clear IM1_P3E;
    clear IM1_P3N;
    clear IM1_P3G;
    clear IM1_P4M;
    clear IM1_P4E;
    clear IM1_P4N;
    clear IM1_P4G;
    
if (NIMG>4)     
load data_2
load GRAD2

   
    IM_D2M   = MULTI;
    IM_D2E   = EVI;
    IM_D2N   = NDVI;
    IM_D2G   = GRAD2;
    
    clear EVI;
    clear NDVI;
    clear MULTI;
    clear GRAD2;  
    
    L = size(IM_D2M,1);
    C = size(IM_D2M,2);

    X1 = ceil(L/2);
    X2 = X1 + 1;
    Y1 = ceil(C/2);
    Y2 = Y1 + 1;

    IM2_P1M = IM_D2M(1 :X1 ,1 :Y1, :);
    IM2_P2M = IM_D2M(1 :X1 ,Y2:end,:);
    IM2_P3M = IM_D2M(X2:end,1 :Y1, :);
    IM2_P4M = IM_D2M(X2:end,Y2:end,:);
    
    IM2_P1E = IM_D2E(1 :X1 ,1 :Y1, :);
    IM2_P2E = IM_D2E(1 :X1 ,Y2:end,:);
    IM2_P3E = IM_D2E(X2:end,1 :Y1, :);
    IM2_P4E = IM_D2E(X2:end,Y2:end,:);
    
    IM2_P1N = IM_D2N(1 :X1 ,1 :Y1, :);
    IM2_P2N = IM_D2N(1 :X1 ,Y2:end,:);
    IM2_P3N = IM_D2N(X2:end,1 :Y1, :);
    IM2_P4N = IM_D2N(X2:end,Y2:end,:);
    
    IM2_P1G = IM_D2G(1 :X1 ,1 :Y1, :);
    IM2_P2G = IM_D2G(1 :X1 ,Y2:end,:);
    IM2_P3G = IM_D2G(X2:end,1 :Y1, :);
    IM2_P4G = IM_D2G(X2:end,Y2:end,:);
    

    save IM2_P1 IM2_P1M IM2_P1E IM2_P1N IM2_P1G  
    save IM2_P2 IM2_P2M IM2_P2E IM2_P2N IM2_P2G  
    save IM2_P3 IM2_P3M IM2_P3E IM2_P3N IM2_P3G 
    save IM2_P4 IM2_P4M IM2_P4E IM2_P4N IM2_P4G

    clear IM_D2M;
    clear IM_D2E;
    clear IM_D2N;
    clear IM_D2G;    
    clear L;
    clear C;
    clear X1;
    clear X2
    clear Y1;
    clear Y2;
    clear IM2_P1M;
    clear IM2_P1E;
    clear IM2_P1N;
    clear IM2_P1G;
    clear IM2_P2M;
    clear IM2_P2E;
    clear IM2_P2N;
    clear IM2_P2G;
    clear IM2_P3M;
    clear IM2_P3E;
    clear IM2_P3N;
    clear IM2_P3G;
    clear IM2_P4M;
    clear IM2_P4E;
    clear IM2_P4N;
    clear IM2_P4G;
end;

if (NIMG>8) 
load data_3
load GRAD3
     
    IM_D3M   = MULTI;
    IM_D3E   = EVI;
    IM_D3N   = NDVI;
    IM_D3G   = GRAD3;
    
    clear EVI;
    clear NDVI;
    clear MULTI;
    clear GRAD3;  
    
    L = size(IM_D3M,1);
    C = size(IM_D3M,2);

    X1 = ceil(L/2);
    X2 = X1 + 1;
    Y1 = ceil(C/2);
    Y2 = Y1 + 1;

    IM3_P1M = IM_D3M(1 :X1 ,1 :Y1, :);
    IM3_P2M = IM_D3M(1 :X1 ,Y2:end,:);
    IM3_P3M = IM_D3M(X2:end,1 :Y1, :);
    IM3_P4M = IM_D3M(X2:end,Y2:end,:);
    
    IM3_P1E = IM_D3E(1 :X1 ,1 :Y1, :);
    IM3_P2E = IM_D3E(1 :X1 ,Y2:end,:);
    IM3_P3E = IM_D3E(X2:end,1 :Y1, :);
    IM3_P4E = IM_D3E(X2:end,Y2:end,:);
    
    IM3_P1N = IM_D3N(1 :X1 ,1 :Y1, :);
    IM3_P2N = IM_D3N(1 :X1 ,Y2:end,:);
    IM3_P3N = IM_D3N(X2:end,1 :Y1, :);
    IM3_P4N = IM_D3N(X2:end,Y2:end,:);
    
    IM3_P1G = IM_D3G(1 :X1 ,1 :Y1, :);
    IM3_P2G = IM_D3G(1 :X1 ,Y2:end,:);
    IM3_P3G = IM_D3G(X2:end,1 :Y1, :);
    IM3_P4G = IM_D3G(X2:end,Y2:end,:);
    
       

    save IM3_P1 IM3_P1M IM3_P1E IM3_P1N IM3_P1G  
    save IM3_P2 IM3_P2M IM3_P2E IM3_P2N IM3_P2G  
    save IM3_P3 IM3_P3M IM3_P3E IM3_P3N IM3_P3G 
    save IM3_P4 IM3_P4M IM3_P4E IM3_P4N IM3_P4G

    clear IM_D3M;
    clear IM_D3E;
    clear IM_D3N;
    clear IM_D3G;    
    clear L;
    clear C;
    clear X1;
    clear X2
    clear Y1;
    clear Y2;
    clear IM3_P1M;
    clear IM3_P1E;
    clear IM3_P1N;
    clear IM3_P1G;
    clear IM3_P2M;
    clear IM3_P2E;
    clear IM3_P2N;
    clear IM3_P2G;
    clear IM3_P3M;
    clear IM3_P3E;
    clear IM3_P3N;
    clear IM3_P3G;
    clear IM3_P4M;
    clear IM3_P4E;
    clear IM3_P4N;
    clear IM3_P4G; 
end;

     
load IM1_P1
if NIMG>4
    load IM2_P1
end;
if NIMG>8
    load IM3_P1
end;

if NIMG<=4
P1 =   cat(3,IM1_P1M,IM1_P1E,IM1_P1N,IM1_P1G); 
end;
if (NIMG>4) && (NIMG<=8)
P1 =   cat(3,IM1_P1M,IM2_P1M,IM1_P1E,IM2_P1E,IM1_P1N,IM2_P1N,IM1_P1G,IM2_P1G); 
end;
if (NIMG>8)
P1 =   cat(3,IM1_P1M,IM2_P1M,IM1_P1E,IM2_P1E,IM3_P1E,IM1_P1N,IM2_P1N,IM3_P1N,IM1_P1G,IM2_P1G); 
end;
clear IM1_P1M;
clear IM2_P1M;
clear IM3_P1M;
clear IM1_P1E;
clear IM2_P1E;
clear IM3_P1E;
clear IM1_P1N;
clear IM2_P1N;
clear IM3_P1N;
clear IM1_P1G;
clear IM2_P1G;
clear IM3_P1G;
save P1 P1
clear P1


if NIMG<=4
end;
if (NIMG>4) && (NIMG<=8)

end;
if (NIMG>8)

end;


load IM1_P2
if NIMG>4
    load IM2_P2  
end;
if NIMG>8
    load IM3_P2
end;

if NIMG<=4
    P2 =   cat(3,IM1_P2M,IM1_P2E,IM1_P2N,IM1_P2G); 
end;
if (NIMG>4) && (NIMG<=8)
    P2 =   cat(3,IM1_P2M,IM2_P2M,IM1_P2E,IM2_P2E,IM1_P2N,IM2_P2N,IM1_P2G,IM2_P2G); 
end;
if (NIMG>8)
    P2 =   cat(3,IM1_P2M,IM2_P2M,IM1_P2E,IM2_P2E,IM3_P2E,IM1_P2N,IM2_P2N,IM3_P2N,IM1_P2G,IM2_P2G); 
end;  
clear IM1_P2M;
clear IM2_P2M;
clear IM3_P2M;
clear IM1_P2E;
clear IM2_P2E;
clear IM3_P2E;
clear IM1_P2N;
clear IM2_P2N;
clear IM3_P2N;
clear IM1_P2G;
clear IM2_P2G;
clear IM3_P2G;
save P2 P2
clear P2


load IM1_P3
if NIMG>4
    load IM2_P3  
end;
if NIMG>8
    load IM3_P3
end;
if NIMG<=4
    P3 =   cat(3,IM1_P3M,IM1_P3E,IM1_P3N,IM1_P3G);
end;
if (NIMG>4) && (NIMG<=8)
    P3 =   cat(3,IM1_P3M,IM2_P3M,IM1_P3E,IM2_P3E,IM1_P3N,IM2_P3N,IM1_P3G,IM2_P3G);
end;
if (NIMG>8)
    P3 =   cat(3,IM1_P3M,IM2_P3M,IM1_P3E,IM2_P3E,IM3_P3E,IM1_P3N,IM2_P3N,IM3_P3N,IM1_P3G,IM2_P3G);
end;  
clear IM1_P3M;
clear IM2_P3M;
clear IM3_P3M;
clear IM1_P3E;
clear IM2_P3E;
clear IM3_P3E;
clear IM1_P3N;
clear IM2_P3N;
clear IM3_P3N;
clear IM1_P3G;
clear IM2_P3G;
clear IM3_P3G;
save P3 P3
clear P3


load IM1_P4
if NIMG>4
    load IM2_P4  
end;
if NIMG>8
    load IM3_P4
end;
if NIMG<=4
   P4 =   cat(3,IM1_P4M,IM1_P4E,IM1_P4N,IM1_P4G); 
end;
if (NIMG>4) && (NIMG<=8)
   P4 =   cat(3,IM1_P4M,IM2_P4M,IM1_P4E,IM2_P4E,IM1_P4N,IM2_P4N,IM1_P4G,IM2_P4G); 
end;
if (NIMG>8)
   P4 =   cat(3,IM1_P4M,IM2_P4M,IM1_P4E,IM2_P4E,IM3_P4E,IM1_P4N,IM2_P4N,IM3_P4N,IM1_P4G,IM2_P4G); 
end;    
clear IM1_P4M;
clear IM2_P4M;
clear IM3_P4M;
clear IM1_P4E;
clear IM2_P4E;
clear IM3_P4E;
clear IM1_P4N;
clear IM2_P4N;
clear IM3_P4N;
clear IM1_P4G;
clear IM2_P4G;
clear IM3_P4G;
save P4 P4
clear P4

%%%=====================================================================%%%
%%%%%%%%%%%%%%%%%%%%%%% REARRANJANDO IMAGEM  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%=====================================================================%%%

load P1.mat
LIN_P1 = size(P1,1);
P1 = shiftdim(P1,2);
P1R = [];
    for i = 1 : size(P1,3)
        P1R = [P1R P1(:,:,i)];
    end;
    clear P1;
save P1_REAMOSTRADA_CG P1R LIN_P1;
clear P1R
clear LIN_P1

load P2.mat
LIN_P2 = size(P2,1);
P2 = shiftdim(P2,2);
P2R = [];
    for i = 1 : size(P2,3)
        P2R = [P2R P2(:,:,i)];
    end;
    clear P2;
save P2_REAMOSTRADA_CG P2R LIN_P2;
clear P2R
clear LIN_P2

load P3.mat
LIN_P3 = size(P3,1);
P3 = shiftdim(P3,2);
P3R = [];
    for i = 1 : size(P3,3)
        P3R = [P3R P3(:,:,i)];
    end;
    clear P3;
save P3_REAMOSTRADA_CG P3R LIN_P3;
clear P3R
clear LIN_P3

load P4.mat
LIN_P4 = size(P4,1);
P4 = shiftdim(P4,2);
P4R = [];
    for i = 1 : size(P4,3)
        P4R = [P4R P4(:,:,i)];
    end;
    clear P4;
save P4_REAMOSTRADA_CG P4R LIN_P4;
clear P4R
clear LIN_P4

clear i;


whos

end
    
    
  