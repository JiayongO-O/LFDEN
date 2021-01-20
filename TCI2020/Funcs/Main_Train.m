function Main_Train(depthNet, state)

global param;
global testError
global trainError;
global testRmse;
global testMae;
global testBadPixel;

figure_1 = figure('Name', 'zeroshot_logs');
testError = GetTestError(param.trainNet);
trainError = GetTrainError(param.trainNet);
testRmse = GetTestRMSE(param.trainNet);
testMae = GetTestMae(param.trainNet);
testBadPixel = GetTestBadPixel(param.trainNet);
count = 0;
it = param.startIter + 1;

% load test data
data_test1 = load(param.testData);

testIm(1).data = (data_test1.testData{1, 2});
testFt(1).data = (data_test1.testData{2, 2});
testRef(1).data = (data_test1.testData{3, 2});
testPose(1).data = (data_test1.testData{4, 2});

while (1)
    
    if (mod(it, param.printInfoIter) == 0)
        fprintf(repmat('\b', [1, count]));
        count = fprintf('Performing iteration %d', it);
    end
    
    %% main optimization
    [feat_share, images, reference, refpos] = MakeTrainPatch(param.trainingData, [], it, true); 
    [depthNet, ~, ~] = NetworkTrain(it, depthNet, images, refpos, true, feat_share, reference);
    
    % update params
    [depthNet, state] = UpdateNetDagNN(depthNet, state);
    depthNet.reset(); % delete some intermediate vars
    
    if (mod(it, param.testNetIter) == 0)
        %% save network
        [~, curNetName, ~] = GetFolderContent(param.trainNet, '.mat');

        fileName = sprintf('/Net-%06d.mat', it);
        [depthNet, state] = DeviceMove(depthNet, state, 'cpu');
        % both net and state should saved as cpu data
        depthNet_s = depthNet.saveobj();
        save([param.trainNet, fileName], 'depthNet_s', 'state');

        if (~isempty(curNetName))
            curNetName = curNetName{1};
            delete(curNetName);
        end
    
    
        %% perform validation
        countTest = fprintf('\nStarting the validation process\n');

        curError = TestDuringTraining(depthNet, testIm, testFt, testRef, testPose);
        testError = [testError; curError];

        DrawTrainCurve(figure_1, it);
        DrawTestCurve(figure_1, it);
        DrawTestMAECurve(figure_1, it);
        DrawTestRMSECurve(figure_1, it);
        DrawTestBadPixelCurve(figure_1, it);
        
        [depthNet, state] = DeviceMove(depthNet, state, 'gpu');
    end
    
    it = it + 1;
end
