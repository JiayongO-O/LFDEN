function testError = GetTestError(errorFolder)

global param;

if (param.continue)
    fid = fopen([errorFolder, '/error_test.txt'], 'rt');
    prevError = cell2mat(textscan(fid, '%f   %f\n'));
    fclose(fid);
    testError = prevError;
else
    fid = fopen([errorFolder, '/error_test.txt'], 'wt');
    fclose(fid);
    testError = [];
end
end