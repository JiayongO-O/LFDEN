function createFlag = WriteTrainingExamples(inImgs, inFeat, ref, refPos, outputDir, writeOrder, startInd, createFlag, arraySize)

chunkSize = 10;
fileName = sprintf('%s/training.h5', outputDir);

[~, numElements] = size(refPos);

for k = 1 : numElements
    
    j = k + startInd - 1;
    
    curInImgs = inImgs(:, :, :, k);
    curInFeat = inFeat(:, :, :, k);
    curRef = ref(:, :, :, k);
    curRefPos = refPos(:, k);
    
    SaveHDF(fileName, '/IN', single(curInImgs), PadWithOne(size(curInImgs), 4), [1, 1, 1, writeOrder(j)], chunkSize, createFlag, arraySize);
    SaveHDF(fileName, '/FT', single(curInFeat), PadWithOne(size(curInFeat), 4), [1, 1, 1, writeOrder(j)], chunkSize, createFlag, arraySize);
    SaveHDF(fileName, '/GT', single(curRef), PadWithOne(size(curRef), 4), [1, 1, 1, writeOrder(j)], chunkSize, createFlag, arraySize);
    SaveHDF(fileName, '/RP', single(curRefPos), size(curRefPos), [1, writeOrder(j)], chunkSize, createFlag, arraySize);
    
    createFlag = false;
end



