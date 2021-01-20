function InitParam()

global param;
global inputView;

param.depthResolution = 100; % number of depth levels
param.numDepthFeatureChannels = param.depthResolution * 2;
param.deltaDisparity = 18; 
param.origAngRes = 7; 
param.depthBorder = 6;
param.testNet = 'TrainedNetworks';

[inputView.X, inputView.Y] = meshgrid(1:1/6:2, 1:1/6:2); % ***fullRef***
inputView.Y = inputView.Y(:); inputView.X = inputView.X(:);

%%% If you have compiled MatConvNet with GPU and CuDNN supports, then leave
%%% these parameters as is. Otherwise change them appropriately.
param.useGPU = true; 
param.gpuMethod = 'Cudnn';%'NoCudnn';%

param.height = 512;
param.width = 512;

param.patchSize = 60;
param.stride = 16;
param.numRefs = 1; % number of reference images, 1 corresponding to the central view
param.cropSizeTraining = 0; % we crop the boundaries to avoid artifacts in the training
param.batchSize = 10; % we found batch size of 10 is faster and gives the same results

param.cropHeight = param.height - 2 * param.cropSizeTraining;
param.cropWidth = param.width - 2 * param.cropSizeTraining;

param.trainingData = 'path_trainingData.png';
[~, param.trainingNames, ~] = GetFolderContent(param.trainingData, '.png');

param.testData = 'path_testData.mat';
% you can make test data with code in 3DV
[~, param.testNames, ~] = GetFolderContent(param.testData, '.mat');

param.trainNet = 'TrainingData';
param.gtDep = 'path_corresponding_GT_depth_data.mat';

param.continue = true;
param.startIter = 0;

param.testNetIter = 100;
param.printInfoIter = 5;

%%% ADAM parameters
param.solver = @solver.adam;
param.state = [];
param.lr = 0.0001;
param.solverOpts = struct('beta1', 0.9, 'beta2', 0.999, 'eps', 1e-8) ;

end
