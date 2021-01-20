function error = NetworkTest(depthNet)

global param;
global testRmse;
global testMse;

sceneNames = param.testNames;
[~, GT_names_des, ~] = GetFolderContent('./GT_depth_512', '.mat');

fid = fopen([param.trainNet, '/error_test.txt'], 'at');
fid_rmse = fopen([param.trainNet, '/rmse_test.txt'], 'at');
fid_mse = fopen([param.trainNet, '/mse_test.txt'], 'at');

numScenes = length(sceneNames);
error = 0;

mse_error = zeros(numScenes); rmse_error = zeros(numScenes);

for k = 1 : numScenes
    
    % read test data
    [images, depthFeatures, reference, refPos] = ReadData(sceneNames{k}, false);
    
    % evaluate the network to get the depth on test, and accumulate error
    [~, curError, depth] = NetworkTrain(0, depthNet, images, refPos, true, depthFeatures, reference, true);
    
    [mse_error(k), rmse_error(k)] = DepthMetrics(GT_names_des{k}, depth);
    
     error = error + curError / numScenes;
end

fprintf(fid, '%8f   %8f\n', error(1), error(2));

fclose(fid); 
error = gather(error);

mse_aver = mean(mse_error);
fprintf(fid_mse, '%f  %f  %f  %f  %f\n', mse_error(1), mse_error(2), mse_error(3), mse_error(4), mse_aver);
fclose(fid_mse);
testMse = [testMse; mse_error];

rmse_aver = mean(rmse_error);
fprintf(fid_rmse, '%f  %f  %f  %f  %f\n', rmse_error(1), rmse_error(2), rmse_error(3), rmse_error(4), rmse_aver);
fclose(fid_rmse);
testRmse = [testRmse; rmse_error];

end