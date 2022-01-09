function [text] = stack_text(FILE,NIMG)

%%%============= FAZ O STACK DAS IMAGENS EM 3 GRUPOS E SALVA ===========%%%

FILE = num2str(FILE);

if NIMG <= 4
    TEXT = [];
    for i = 1 : NIMG    
        text = [FILE(i,:) '_text.tif'];            
        IM1 = imread(text,'tif');            
        TEXT = cat(3,TEXT,IM1);        
        clear IM1;  
        clear text;        
    end;
    save text_1 TEXT
end;

%****************
if (NIMG>4) && (NIMG <= 8)
    
    TEXT = [];    
    for i = 1 : 4    
        text = [FILE(i,:) '_text.tif'];            
        IM1 = imread(text,'tif');            
        TEXT = cat(3,TEXT,IM1);        
        clear IM1;  
        clear text;        
    end;
    save text_1 TEXT

    TEXT = [];
    for i = 5 : NIMG
    
        text = [FILE(i,:) '_text.tif'];
        IM1 = imread(text,'tif');
        TEXT = cat(3,TEXT,IM1);
        clear IM1;
        clear text;
    end;
    save text_2 TEXT
end;
%******************
if (NIMG>8) && (NIMG <= 13)

    TEXT = [];    
    for i = 1 : 4    
        text = [FILE(i,:) '_text.tif'];            
        IM1 = imread(text,'tif');            
        TEXT = cat(3,TEXT,IM1);        
        clear IM1;  
        clear text;        
    end;
    save text_1 TEXT

    TEXT = [];
    for i = 5 : 8
    
        text = [FILE(i,:) '_text.tif'];
        IM1 = imread(text,'tif');
        TEXT = cat(3,TEXT,IM1);
        clear IM1;
        clear text;
    end;
    save text_2 TEXT

    TEXT = [];    
    for i = 9 : NIMG;    
        text = [FILE(i,:) '_text.tif'];        
        IM1 = imread(text,'tif');            
        TEXT = cat(3,TEXT,IM1);        
        clear IM1;        
        clear text;        
    end;
    save text_3 TEXT
end;
%%%=====================================================================%%%
%%%%%%%%%%%%%%%%%%%% DIVIDE IMAGEM EM 4 QUADRANTES %%%%%%%%%%%%%%%%%%%%%%%%
%%%=====================================================================%%%
load text_1

    IM_D1T   = TEXT;        
    L = size(IM_D1T,1);
    C = size(IM_D1T,2);
    
    X1 = ceil(L/2);
    X2 = X1 + 1;
    Y1 = ceil(C/2);
    Y2 = Y1 + 1;

    IM1_P1T = IM_D1T(1 :X1 ,1 :Y1, :);
    IM1_P2T = IM_D1T(1 :X1 ,Y2:end,:);
    IM1_P3T = IM_D1T(X2:end,1 :Y1, :);
    IM1_P4T = IM_D1T(X2:end,Y2:end,:);
    
    save IM1_P1T IM1_P1T  
    save IM1_P2T IM1_P2T  
    save IM1_P3T IM1_P3T 
    save IM1_P4T IM1_P4T

    clear IM_D1T;
    clear L;
    clear C;
    clear X1;
    clear X2
    clear Y1;
    clear Y2;
    clear IM1_P1T;
    clear IM1_P2T;
    clear IM1_P3T;    
    clear IM1_P4T;
    
    
if (NIMG>4)     
load text_2

    IM_D2T   = TEXT;        
    L = size(IM_D2T,1);
    C = size(IM_D2T,2);
    
    X1 = ceil(L/2);
    X2 = X1 + 1;
    Y1 = ceil(C/2);
    Y2 = Y1 + 1;

    IM2_P1T = IM_D2T(1 :X1 ,1 :Y1, :);
    IM2_P2T = IM_D2T(1 :X1 ,Y2:end,:);
    IM2_P3T = IM_D2T(X2:end,1 :Y1, :);
    IM2_P4T = IM_D2T(X2:end,Y2:end,:);
    
    save IM2_P1T IM2_P1T  
    save IM2_P2T IM2_P2T  
    save IM2_P3T IM2_P3T 
    save IM2_P4T IM2_P4T

    clear IM_D2T;
    clear L;
    clear C;
    clear X1;
    clear X2
    clear Y1;
    clear Y2;
    clear IM2_P1T;
    clear IM2_P2T;
    clear IM2_P3T;    
    clear IM2_P4T;
end;

if (NIMG>8) 
load text_3

    IM_D3T   = TEXT;        
    L = size(IM_D3T,1);
    C = size(IM_D3T,2);
    
    X1 = ceil(L/2);
    X2 = X1 + 1;
    Y1 = ceil(C/2);
    Y2 = Y1 + 1;

    IM3_P1T = IM_D3T(1 :X1 ,1 :Y1, :);
    IM3_P2T = IM_D3T(1 :X1 ,Y2:end,:);
    IM3_P3T = IM_D3T(X2:end,1 :Y1, :);
    IM3_P4T = IM_D3T(X2:end,Y2:end,:);
    
    save IM3_P1T IM3_P1T  
    save IM3_P2T IM3_P2T  
    save IM3_P3T IM3_P3T 
    save IM3_P4T IM3_P4T

    clear IM_D3T;
    clear L;
    clear C;
    clear X1;
    clear X2
    clear Y1;
    clear Y2;
    clear IM3_P1T;
    clear IM3_P2T;
    clear IM3_P3T;    
    clear IM3_P4T;
end;
%%%=====================================================================%%%
%%%=====================================================================%%%
     
load P1
load IM1_P1T
if NIMG>4
    load IM2_P1T
end;
if NIMG>8
    load IM3_P1T
end;
if NIMG<=4
P1 =   cat(3,P1,IM1_P1T); 
end;
if (NIMG>4) && (NIMG<=8)
P1 =   cat(3,P1,IM1_P1T,IM2_P1T);  
end;
if (NIMG>8)
P1 =   cat(3,P1,IM1_P1T,IM2_P1T,IM3_P1T); 
end;
clear IM1_P1T;
clear IM2_P1T;
clear IM3_P1T;
save P1 P1
clear P1


load P2
load IM1_P2T
if NIMG>4
    load IM2_P2T
end;
if NIMG>8
    load IM3_P2T
end;
if NIMG<=4
P2 =   cat(3,P2,IM1_P2T); 
end;
if (NIMG>4) && (NIMG<=8)
P2 =   cat(3,P2,IM1_P2T,IM2_P2T);  
end;
if (NIMG>8)
P2 =   cat(3,P2,IM1_P2T,IM2_P2T,IM3_P2T); 
end;
clear IM1_P2T;
clear IM2_P2T;
clear IM3_P2T;
save P2 P2
clear P2



load P3
load IM1_P3T
if NIMG>4
    load IM2_P3T
end;
if NIMG>8
    load IM3_P3T
end;
if NIMG<=4
P3 =   cat(3,P3,IM1_P3T); 
end;
if (NIMG>4) && (NIMG<=8)
P3 =   cat(3,P3,IM1_P3T,IM2_P3T);  
end;
if (NIMG>8)
P3 =   cat(3,P3,IM1_P3T,IM2_P3T,IM3_P3T); 
end;
clear IM1_P3T;
clear IM2_P3T;
clear IM3_P3T;
save P3 P3
clear P3


load P4
load IM1_P4T
if NIMG>4
    load IM2_P4T
end;
if NIMG>8
    load IM3_P4T
end;
if NIMG<=4
P4 =   cat(3,P4,IM1_P4T); 
end;
if (NIMG>4) && (NIMG<=8)
P4 =   cat(3,P4,IM1_P4T,IM2_P4T);  
end;
if (NIMG>8)
P4 =   cat(3,P4,IM1_P4T,IM2_P4T,IM3_P4T); 
end;
clear IM1_P4T;
clear IM2_P4T;
clear IM3_P4T;
save P4 P4
clear P4


end
    
    
  