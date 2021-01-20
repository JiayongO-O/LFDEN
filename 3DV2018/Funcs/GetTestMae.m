function testMae = GetTestMae(MaeFolder)

global param;

if (param.continue)
    fid = fopen([MaeFolder, '/mae_test.txt'], 'rt');
    prevMae = cell2mat(textscan(fid, '%f  %f  %f  %f  %f\n'));
    fclose(fid);
    testMae = prevMae;
else
    fid = fopen([MaeFolder, '/mae_test.txt'], 'wt');
    fclose(fid);
    testMae = [];

end

