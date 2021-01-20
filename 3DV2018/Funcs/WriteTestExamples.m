function WriteTestExamples(inImgs,inFeat, ref, refPos, outputDir)

chunkSize = 10;
fileName = sprintf('%s.h5', outputDir);

SaveHDF(fileName, '/IN', single(inImgs), PadWithOne(size(inImgs), 4), [1, 1, 1, 1], chunkSize, true);
SaveHDF(fileName, '/FT', single(inFeat), PadWithOne(size(inFeat), 4), [1, 1, 1, 1], chunkSize, true);
SaveHDF(fileName, '/GT', single(ref), PadWithOne(size(ref), 4), [1, 1, 1, 1], chunkSize, true);
SaveHDF(fileName, '/RP', single(refPos), size(refPos), [1, 1], chunkSize, true);
end


