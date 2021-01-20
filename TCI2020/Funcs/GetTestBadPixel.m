function testBadPixel = GetTestBadPixel(BadPixelFolder)

global param;

if (param.continue)
    fid = fopen([BadPixelFolder, '/badPixel_test.txt'], 'rt');
    prevBadPixel = cell2mat(textscan(fid, '%f\n'));
    fclose(fid);
    testBadPixel = prevBadPixel;
else
    fid = fopen([BadPixelFolder, '/badPixel_test.txt'], 'wt');
    fclose(fid);
    testBadPixel = [];

end
end

