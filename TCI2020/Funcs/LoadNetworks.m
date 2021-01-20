function [depthNet, state]= LoadNetworks(isTraining)
if(~exist('isTraining', 'var') || isempty(isTraining))
    isTraining = false;
end

global param;

if (isTraining)
    netFolder = param.trainNet;
    [netName, ~, ~] = GetFolderContent(netFolder, '.mat');
    
    if (param.continue && ~isempty(netName))
        % load the existed network, if there is 
        tokens = regexp(netName{1}, 'Net-([\d]+).mat', 'tokens');
        param.startIter = str2double(cell2mat(tokens{1}));
        [depthNet, state] = loadNet([netFolder, '/', netName{1}]); 
    else
        % otherwise create network and state
        param.continue = false;
        depthNet = CreateNetParamShare(); 
        state.solverState = cell(1, numel(depthNet.params)) ;
        state.solverState(:) = {0} ;
    end
else
    % when it is for test, load pre-trained models
    netFolder = param.testNet;
    load([netFolder, '/Net-***']);
end

% the depthNet is a dagnn
if (param.useGPU)
    [depthNet, state] = DeviceMove(depthNet, state, 'gpu');
else
    [depthNet, state] = DeviceMove(depthNet, state, 'cpu');
end
