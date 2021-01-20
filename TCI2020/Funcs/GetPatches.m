function patches = GetPatches(input, patchSize, stride)

[height, width, depth] = size(input);

numPatches = (floor((width-patchSize)/stride)+1)*(floor((height-patchSize)/stride)+1);
patches = zeros(patchSize, patchSize, depth, numPatches);

count = 0;
for iX = 1 : stride : width - patchSize + 1
    for iY = 1 : stride : height - patchSize + 1
        count = count + 1;
        patches(:, :, :, count) = input(iY:iY+patchSize-1, iX:iX+patchSize-1, :);
    end
end