function [AMOS] = col_amos2(amostras,NIMG)
% NIMG = 1 para 9 imagens, 3 para 11 imagens e 5 para 13 imagens
L1 = size(amostras,1);

amostras = [amostras(:,3) amostras(:,2)];

load data_1.mat
load GRAD1
load text_1
text_1=uint16(TEXT);
AM1 = [];
AE1 = [];
AN1 = [];
AG1 = [];
AT1 = [];


for i = 1 : L1    
    
    am1 = MULTI(amostras(i,1),amostras(i,2),:);
    am1 = shiftdim(am1,2);
    AM1 = [AM1 am1];
    
    ae1 = EVI(amostras(i,1),amostras(i,2),:);
    ae1 = shiftdim(ae1,2);
    AE1 = [AE1 ae1];
    
    an1 = NDVI(amostras(i,1),amostras(i,2),:);
    an1 = shiftdim(an1,2);
    AN1 = [AN1 an1];    
    
    ag1 = GRAD1(amostras(i,1),amostras(i,2),:);
    ag1 = shiftdim(ag1,2);
    AG1 = [AG1 ag1]; 
    
    at1 = text_1(amostras(i,1),amostras(i,2),:);
    at1 = shiftdim(at1,2);
    AT1 = [AT1 at1]; 
    
end;
clear MULTI;
clear EVI;
clear NDVI;
clear an1;
clear ae1;
clear an1;
clear GRAD1;
clear ag1;
clear at1;
clear text_1;


if NIMG>4
    load data_2.mat
    load GRAD2
    load text_2
    text_2=uint16(TEXT);
    AM2 = [];
    AE2 = [];
    AN2 = [];
    AG2 = [];
    AT2 = [];
    for i = 1 : L1
    
        am2 = MULTI(amostras(i,1),amostras(i,2),:);
        am2 = shiftdim(am2,2);
        AM2 = [AM2 am2];
    
        ae2 = EVI(amostras(i,1),amostras(i,2),:);
        ae2 = shiftdim(ae2,2);
        AE2 = [AE2 ae2];
    
        an2 = NDVI(amostras(i,1),amostras(i,2),:);
        an2 = shiftdim(an2,2);
        AN2 = [AN2 an2];    
    
        ag2 = GRAD2(amostras(i,1),amostras(i,2),:);
        ag2 = shiftdim(ag2,2);
        AG2 = [AG2 ag2];
        
        at2 = text_2(amostras(i,1),amostras(i,2),:);
        at2 = shiftdim(at2,2);
        AT2 = [AT2 at2]; 
    end;
    clear MULTI;
    clear EVI;
    clear NDVI;
    clear am2;
    clear ae2;
    clear an2;
    clear GRAD2;
    clear ag2;
    clear at2;
    clear text_2;
end;

if NIMG > 8
    load data_3.mat
    load GRAD3
    clear MULTI;
    load text_3
    text_3=uint16(TEXT);
    %EVI = EVI(:,:,1:NIMG);
    %NDVI = NDVI(:,:,1:NIMG);

    AE3 = [];
    AN3 = [];
    AG3 = [];
    AT3 = [];
    for i = 1 : L1    
   
        ae3 = EVI(amostras(i,1),amostras(i,2),:);
        ae3 = shiftdim(ae3,2);
        AE3 = [AE3 ae3];
    
        an3 = NDVI(amostras(i,1),amostras(i,2),:);
        an3 = shiftdim(an3,2);
        AN3 = [AN3 an3];
    
        ag3 = GRAD3(amostras(i,1),amostras(i,2),:);
        ag3 = shiftdim(ag3,2);
        AG3 = [AG3 ag3];
        
        at3 = text_3(amostras(i,1),amostras(i,2),:);
        at3 = shiftdim(at3,2);
        AT3 = [AT3 at3]; 
    
    end;
    clear MULTI;
    clear EVI;
    clear NDVI;
    clear am3;
    clear ae3;
    clear an3;
    clear GRAD3;
    clear ag3;
    clear at3;
    clear text_3;
end;

if NIMG<=4
    AM = [AM1];
    AN = [AN1];
    AE = [AE1];
    AG = [AG1];
    AT = [AT1];
end;

if (NIMG>4) && (NIMG<=8)
    AM = [AM1;AM2];
    AN = [AN1;AN2];
    AE = [AE1;AE2];
    AG = [AG1;AG2];
    AT = [AT1;AT2];
end;

if (NIMG>8)
    AM = [AM1;AM2];
    AN = [AN1;AN2;AN3];
    AE = [AE1;AE2;AE3];
    AG = [AG1;AG2];
    AT = [AT1;AT2;AT3];
end;

    AMOS = [AM;AE;AN;AG;AT];
end