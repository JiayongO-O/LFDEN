function [fullLF] = ReadLFImages(scenePath)
% If the light field images are in H*W*CH*U*V, directly get the fullLF, 
% else if the light field images are in macro-pixel format, use this function.
numImgsX = 9;
numImgsY = 9;
inputImg = im2double(imread(scenePath));
h = size(inputImg, 1) / numImgsY;
w = size(inputImg, 2) / numImgsX;
fullLF = zeros(h, w, 3, numImgsY, numImgsX);
for ax = 1 : numImgsX
    for ay = 1 : numImgsY
        fullLF(:, :, :, ay, ax) = inputImg(ay:numImgsY:end, ax:numImgsX:end, :);
    end
end
fullLF = fullLF(:, :, :, 2:8, 2:8);
fullLF = fullLF(:, :, :, end:-1:1, end:-1:1);
end

