function Main_Train(depthNet)

global param;
global trainError;
global testRmse;
global testMse;

figure_1 = figure('Name', 'Unsupervised_disp_estimation');
testError = GetTestError(param.trainNet);
trainError = GetTrainError(param.trainNet);
testRmse = GetTestRMSE(param.trainNet);
testMse = GetTestMse(param.trainNet);
count = 0;
it = param.startIter + 1;

%% Start training...
while (1)
    
    if (mod(it, param.printInfoIter) == 0)
        fprintf(repmat('\b', [1, count]));
        count = fprintf('Performing iteration %d', it);
    end
    
    %% main optimization
    [images, depthFeat, reference, refPos] = ReadData(param.trainingNames{1}, [], it);
    [depthRes, ~, ~] = NetworkTrain(it, depthNet, images, refPos, true, depthFeat, reference);
    
    depthNet = UpdateNet(depthNet, depthRes, it);
    
    
    if (mod(it, param.testNetIter) == 0)
        %% save network
        [~, curNetName, ~] = GetFolderContent(param.trainNet, '.mat');

        fileName = sprintf('/Net-%06d.mat', it);
        save([param.trainNet, fileName], 'depthNet');

        if (~isempty(curNetName))
            curNetName = curNetName{1};
            delete(curNetName);
        end
    
        %% perform validation
        fprintf('\nStarting the validation process\n');
        TestError = NetworkTest(depthNet);
        testError = [testError; TestError];

        DrawTrainCurve(figure_1, it);
        DrawTestCurve(figure_1, testError, it);
        DrawTestRMSECurve(figure_1, it);
        DrawTestMSECurve(figure_1, it);

        if(mod(it, 2000) == 0)
            temp_rmse = testRmse(end, 1) * 10000;
            fileName_temp = sprintf('/Net-%06d-%4.0f.mat', it, temp_rmse);
            save(['./TrainingData/Models', fileName_temp], 'depthNet');
        end        
        
    end
    
    it = it + 1;
end