function trainError = GetTrainError(errorFolder)

global param;

if (param.continue)
    fid = fopen([errorFolder, '/error_train.txt'], 'rt');
    prevError = cell2mat(textscan(fid, '%f   %f\n'));
    fclose(fid);
    trainError = prevError;
else
    fid = fopen([errorFolder, '/error_train.txt'], 'wt');
    fclose(fid);
    trainError = [];
end