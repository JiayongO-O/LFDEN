function InitParam()

global param;
global inputView;

param.depthResolution = 100;
param.numDepthFeatureChannels = param.depthResolution * 2;
param.deltaDisparity = 18; 
param.origAngRes = 7; % original angular resolution
param.depthBorder = 6; 
param.testNet = 'TrainedNetworks';


[inputView.X, inputView.Y] = meshgrid(1:1/6:2, 1:1/6:2); 
inputView.Y = inputView.Y(:); inputView.X = inputView.X(:);

%%% If you have compiled MatConvNet with GPU and CuDNN supports, then leave
%%% these parameters as is. Otherwise change them appropriately.
param.useGPU = true; 
param.gpuMethod = 'Cudnn';%'NoCudnn';%


%%%%%%%%%%%%%%%%%% Training Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

param.height = 512;
param.width = 512;

param.patchSize = 60;
param.stride = 16;
param.numRefs = 1; 
param.cropSizeTraining = 0; 
param.batchSize = 10; 

param.cropHeight = param.height - 2 * param.cropSizeTraining;
param.cropWidth = param.width - 2 * param.cropSizeTraining;

param.trainingScenes = 'path_trainingScene';
param.trainingData = 'path_trainingData';
[~, param.trainingNames, ~] = GetFolderContent(param.trainingData, '.h5');


param.testScenes = 'path_testScene';
param.testData = 'path_testData';
[~, param.testNames, ~] = GetFolderContent(param.testData, '.h5');

param.trainNet = 'TrainingData';


param.continue = true;
param.startIter = 0;

param.testNetIter = 100;
param.printInfoIter = 5;


%%% ADAM parameters
param.alpha = 0.0001;
param.beta1 = 0.9;
param.beta2 = 0.999;
param.eps = 1e-8;