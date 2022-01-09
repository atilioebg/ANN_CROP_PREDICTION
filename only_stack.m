function [MULTI] = only_stack(FILE,NIMG)

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
clear ndvi
clear evi