function [fullLF, inputLF] = ReadLFImages(scenePath)
% This function is used to read in the 8*8 sub-aperture light field images.
numImgsX = 8;
numImgsY = 8;
inputImg = im2double(imread(scenePath));
h = size(inputImg, 1) / numImgsY;
w = size(inputImg, 2) / numImgsX;
fullLF = zeros(h, w, 3, numImgsY, numImgsX);
for ax = 1 : numImgsX
    for ay = 1 : numImgsY
        fullLF(:, :, :, ay, ax) = inputImg(ay:numImgsY:end, ax:numImgsX:end, :);
    end
end
inputLF = fullLF(:, :, :, [1, 8], [1, 8]);

end

