function [rede,error,tr] = nn_construction_6(IN,OUT,NEURONS,TRP,VP,TTP,iterations)

% INPUTS:
% IN: amostras de treinamento
% OUT: verdade de campo
% NEURONS: numero de neuros na camada oculta da rede
% TRP: porcentagem das amostras que devem ser utilizadas para treinamento
% VP: porcentagem das amostras que devem ser utilizadas para validacao
% TTP: porcentagem das amostras que devem ser utilizadas para teste
% iterations: numero de iterações que o sistema deve fazer

% OUTPUTS:
% rede: rede treinada 
% error: erro (%E) da rede treinada

error = 999999999;
error_old = 999999999;
net_old = network;

IN = double(IN);
OUT = double(OUT);


inputs = IN;
targets = OUT;


count = 0;
    while count < iterations
        
        % Create a Pattern Recognition Network
        hiddenLayerSize = NEURONS;
        net = patternnet(hiddenLayerSize);
        
        % Choose Input and Output Pre/Post-Processing Functions
        % For a list of all processing functions type: help nnprocess
        net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
        net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};


        % Setup Division of Data for Training, Validation, Testing
        % For a list of all data division functions type: help nndivide
        net.divideFcn = 'dividerand';  % Divide data randomly
        net.divideMode = 'sample';  % Divide up every sample
        net.divideParam.trainRatio = TRP/100;
        net.divideParam.valRatio = VP/100;
        net.divideParam.testRatio = TTP/100;

        % For help on training function 'trainlm' type: help trainlm
        % For a list of all training functions type: help nntrain
        net.trainFcn = 'trainscg'; %'trainlm';  % Levenberg-Marquardt


        % Train the Network
        [net,tr] = train(net,inputs,targets);
        
        outputs = net(inputs);

        % Recalculate Training, Validation and Test Performance
        trainTargets = targets .* tr.trainMask{1};
        valTargets = targets  .* tr.valMask{1};
        testTargets = targets  .* tr.testMask{1};
        trainPerformance = perform(net,trainTargets,outputs);
        valPerformance = perform(net,valTargets,outputs);
        testPerformance = perform(net,testTargets,outputs);
        
        C = [trainPerformance valPerformance testPerformance];
        
        error = max(C);                    
        C = [error error_old]
        
        
        [min_error,I] = min(C);
        if I == 1
            net_old = net;
            error_old = error;
        end;        
        if I == 2
            net_old = net_old;
            error_old = error_old;
        end;
        
        
        count = count + 1        
        C = [];
    end;
    
    
    
    if count == iterations
        C = [error error_old];
        [min_error,I] = min(C);
            if I == 1
                rede = net;
                error = error;
            end;
            if I == 2 
                rede = net_old;
                error = error_old;
            end;
    end;
    
  simpleclassOutputs = sim(rede,IN);
  plotconfusion(OUT,simpleclassOutputs);    
end
