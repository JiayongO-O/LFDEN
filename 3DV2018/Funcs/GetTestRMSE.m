function testRmse = GetTestRMSE(RmseFolder)

global param;

if (param.continue)
    fid = fopen([RmseFolder, '/rmse_test.txt'], 'rt');
    prevRmse = cell2mat(textscan(fid, '%f  %f  %f  %f  %f\n'));
    fclose(fid);
    testRmse = prevRmse;
else
    fid = fopen([RmseFolder, '/rmse_test.txt'], 'wt');
    fclose(fid);
    testRmse = [];



end

