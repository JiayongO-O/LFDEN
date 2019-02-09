function PrepareTrainingData()

global param;

sceneFolder = param.trainingScenes;
outputFolder = param.trainingData;

[sceneNames, scenePaths, numScenes] = GetFolderContent(sceneFolder, '.png');

numPatches = GetNumPatches();
numTotalPatches = numPatches * param.numRefs * numScenes;
writeOrder = randperm(numTotalPatches);
firstBatch = true;
MakeDir(outputFolder);

for ns = 1 : numScenes
    
    fprintf('**********************************\n');
    fprintf('Working on the "%s" dataset (%d of %d)\n', sceneNames{ns}(1:end-4), ns, numScenes);
    
    fprintf('Loading input light field ...');
    % Here mind the input data formate and decide to choose ReadLFImages or ReadLFImages_MAT
    [curFullLF] = ReadLFImages(scenePaths{ns}); 

    fprintf(repmat('\b', 1, 3));
    fprintf('Done\n');
    fprintf('**********************************\n');    
    
    fprintf('\nPreparing training examples\n');
    fprintf('------------------------------\n');
    [pInImg, pInFeat, pRef, refPos] = ComputeTrainingExamples(curFullLF);
    
    fprintf('\nWriting training examples\n\n');
    firstBatch = WriteTrainingExamples(pInImg, pInFeat, pRef, refPos, outputFolder, writeOrder, (ns-1) * numPatches * param.numRefs + 1, firstBatch, numTotalPatches);
    
end
