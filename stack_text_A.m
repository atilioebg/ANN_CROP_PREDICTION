function [text] = stack_text_A(FILE,NIMG)

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
end
    
    
  