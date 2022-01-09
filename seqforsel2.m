function [B1,B2,B3,BANDS,VEC,ORD] = seqforsel2(CORTA)

CORTA = CORTA - 2;

load milho
ptsm = [milho(:,3) milho(:,2)];
clear milho

load nao_milho
ptsnm = [nao_milho(:,3) nao_milho(:,2)];
clear nao_milho

PTS11 = [];
PTS21 = [];
load text_1
%TEXT = double(TEXT);
T1 = size(TEXT,3);
for PM = 1 : size(ptsm,1)
    pts1 = shiftdim(TEXT(ptsm(PM,1),ptsm(PM,2),:),1); 
    PTS11 = [PTS11;pts1];
end;
for PNM = 1 : size(ptsnm,1)
    pts2 = shiftdim(TEXT(ptsnm(PNM,1),ptsnm(PNM,2),:),1);
    PTS21 = [PTS21;pts2];
end;  
clear TEXT

PTS12 = [];
PTS22 = [];
load text_2
%TEXT = double(TEXT);
T2 = size(TEXT,3);
for PM = 1 : size(ptsm,1)
    pts1 = shiftdim(TEXT(ptsm(PM,1),ptsm(PM,2),:),1); 
    PTS12 = [PTS12;pts1];
end;
for PNM = 1 : size(ptsnm,1)
    pts2 = shiftdim(TEXT(ptsnm(PNM,1),ptsnm(PNM,2),:),1);
    PTS22 = [PTS22;pts2];
end; 
clear TEXT

PTS13 = [];
PTS23 = [];
load text_3 
%TEXT = double(TEXT);
T3 = size(TEXT,3);
for PM = 1 : size(ptsm,1)
    pts1 = shiftdim(TEXT(ptsm(PM,1),ptsm(PM,2),:),1); 
    PTS13 = [PTS13;pts1];
end;
for PNM = 1 : size(ptsnm,1)
    pts2 = shiftdim(TEXT(ptsnm(PNM,1),ptsnm(PNM,2),:),1);
    PTS23 = [PTS23;pts2];
end; 
clear TEXT

PTS1 = [PTS11 PTS12 PTS13];
PTS2 = [PTS21 PTS22 PTS23];

PTS1 = double(PTS1);
PTS2 = double(PTS2);

clear PTS11
clear PTS12
clear PTS13
clear PTS21
clear PTS22
clear PTS23

VEC = [1:size(PTS1,2)];
NFEAT = T1 + T2 + T3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if CORTA < 0
DIST = zeros(NFEAT);
    for i = 1 : (NFEAT-1)
        for j = (i+1) : NFEAT
            T = [i j];
                             
            DIST(i,j) = (1/8)*(mean(PTS1(:,T),1)-mean(PTS2(:,T),1))...
                              *inv((cov(PTS1(:,T))+cov(PTS2(:,T)))/2)...
                              *(mean(PTS1(:,T),1)-mean(PTS2(:,T),1))'+...
                              (0.5)*log((det((cov(PTS1(:,T))+cov(PTS2(:,T)...
                              ))/2)/((det(cov(PTS1(:,T)))*det(cov(PTS2(:,...
                              T))))^0.5)));
            T = [];
            if (isinf(DIST(i,j))==1)
                DIST(i,j) = 0;
            end;
            
        end;         
    end;
    [V,L] = max(DIST,[],1);
    [v,l] = max(V,[],2);
    clear v; clear V; clear DIST;
    VEC(L(l)) = 0;
    VEC(l) = 0;
    clear L; clear l;

count = 1;
ORD = [];
while (count ~= NFEAT)
         
    MEASUREMENTS = zeros(size(PTS1,2),1);
    for i = 1 : (size(PTS1,2))
        GRUPO = [];    
        V1 = VEC(i);                
        GRUPO = find (VEC == 0);        
        
        if (V1~=0)             
            T = [GRUPO i];       
                     
            MEASUREMENTS(i,1) = (1/8)*(mean(PTS1(:,T),1)-mean(PTS2(:,T),1))...
                              *inv((cov(PTS1(:,T))+cov(PTS2(:,T)))/2)...
                              *(mean(PTS1(:,T),1)-mean(PTS2(:,T),1))'+...
                              (0.5)*log((det((cov(PTS1(:,T))+cov(PTS2(:,T)...
                              ))/2)/((det(cov(PTS1(:,T)))*det(cov(PTS2(:,...
                              T))))^0.5)));
            T = [];
            if (isinf(MEASUREMENTS(i,1))== 1)
                MEASUREMENTS(i,1) = 0;
            end;
        end; 
        
    end;
    
        [v,L] = max(MEASUREMENTS,[],1);
        ORD = [ORD; L];
        VEC(L)=0;
        count = count + 1
    
end;
end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if CORTA >= -2
DIST = zeros(NFEAT);
    for i = 1 : (NFEAT-1)
        for j = (i+1) : NFEAT
            T = [i j];
                             
            DIST(i,j) = (1/8)*(mean(PTS1(:,T),1)-mean(PTS2(:,T),1))...
                              *inv((cov(PTS1(:,T))+cov(PTS2(:,T)))/2)...
                              *(mean(PTS1(:,T),1)-mean(PTS2(:,T),1))'+...
                              (0.5)*log((det((cov(PTS1(:,T))+cov(PTS2(:,T)...
                              ))/2)/((det(cov(PTS1(:,T)))*det(cov(PTS2(:,...
                              T))))^0.5)));
            T = [];
            if (isinf(DIST(i,j))==1)
                DIST(i,j) = 0;
            end;
        end;         
    end;
    [V,L] = max(DIST,[],1);
    [v,l] = max(V,[],2);
    clear v; clear V; clear DIST;
    VEC(L(l)) = 0;
    VEC(l) = 0;
    clear L; clear l;

count = 1;
ORD = [];
while (count <= (CORTA+3))
         
    MEASUREMENTS = zeros(size(PTS1,2),1);
    for i = 1 : (size(PTS1,2))
            
        V1 = VEC(i);                
        GRUPO = find (VEC == 0);        
        
        if (V1~=0)             
            T = [GRUPO i];       
                     
            MEASUREMENTS(i) = (1/8)*(mean(PTS1(:,T),1)-mean(PTS2(:,T),1))...
                              *inv((cov(PTS1(:,T))+cov(PTS2(:,T)))/2)...
                              *(mean(PTS1(:,T),1)-mean(PTS2(:,T),1))'+...
                              (0.5)*log((det((cov(PTS1(:,T))+cov(PTS2(:,T)...
                              ))/2)/((det(cov(PTS1(:,T)))*det(cov(PTS2(:,...
                              T))))^0.5)));
            T = [];
            if (isinf(MEASUREMENTS(i,1))== 1)
                MEASUREMENTS(i,1) = 0;
            end;
        end; 
        
    end;
    
        [v,L] = max(MEASUREMENTS,[],1);
        ORD = [ORD; L];
        VEC(L)=0;
        count = count + 1
    
end;
end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

BANDS = find(VEC == 0);

p1 = find(BANDS<=T1);
p2 = (find((BANDS>T1)&(BANDS<=(T1+T2))));
p3 = (find((BANDS>(T1+T2))&(BANDS<=(T1+T2+T3))));

B1 = BANDS(p1);
B2 = BANDS(p2) -(T1);
B3 = BANDS(p3) -(T1+T2);
   
end




























