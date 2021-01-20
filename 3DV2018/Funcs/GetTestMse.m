function testMse = GetTestMse(MseFolder)

global param;

if (param.continue)
    fid = fopen([MseFolder, '/mse_test.txt'], 'rt');
    prevMse = cell2mat(textscan(fid, '%f  %f  %f  %f  %f\n'));
    fclose(fid);
    testMse = prevMse;
else
    fid = fopen([MseFolder, '/mse_test.txt'], 'wt');
    fclose(fid);
    testMse = [];

end

