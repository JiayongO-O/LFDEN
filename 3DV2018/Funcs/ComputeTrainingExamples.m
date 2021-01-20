function [pInImgs, pInFeat, pRef, refPos] = ComputeTrainingExamples(curFullLF)

global param;
global inputView;
cropSize = param.cropSizeTraining;
numRefs = param.numRefs;
patchSize = param.patchSize;
stride = param.stride;
origAngRes = param.origAngRes;

[height, width, ~, ~, ~] = size(curFullLF);
inImgs = reshape(curFullLF, height, width, []);
inImgs = CropImg(inImgs, cropSize);
pInImgs = GetPatches(inImgs, patchSize, stride);
pInImgs = repmat(pInImgs, [1, 1, 1, numRefs]);

refInds = 25; % mind the central view for 7*7 LF

numPatches = GetNumPatches();
pInFeat = zeros(patchSize, patchSize, param.numDepthFeatureChannels, numPatches * numRefs);
pRef = zeros(patchSize, patchSize, 3, numPatches * numRefs);
refPos = zeros(2, numPatches * numRefs);

for ri = 1 : numRefs
    
    fprintf('Working on random reference %d of %d: ', ri, numRefs);
    
    [curRefInd.Y, curRefInd.X] = ind2sub([origAngRes, origAngRes], refInds(ri)); 
    curRefPos.Y = GetImgPos(curRefInd.Y); curRefPos.X = GetImgPos(curRefInd.X); 
    
    wInds = (ri-1) * numPatches + 1 : ri * numPatches; 
    
    ref = curFullLF(:, :, :, curRefInd.Y, curRefInd.X);
    ref = CropImg(ref, cropSize);
    pRef(:, :, :, wInds) = GetPatches(ref, patchSize, stride);
    
    deltaViewY = inputView.Y - curRefPos.Y;
    deltaViewX = inputView.X - curRefPos.X; 

    inFeat = PrepareDepthFeatures(curFullLF, deltaViewY, deltaViewX);
    inFeat = CropImg(inFeat, cropSize);
    pInFeat(:, :, :, wInds) = GetPatches(inFeat, patchSize, stride);
    
    refPos(1, wInds) = repmat(curRefPos.Y, [1, numPatches]);
    refPos(2, wInds) = repmat(curRefPos.X, [1, numPatches]);
    
    fprintf(repmat('\b', 1, 5));
    fprintf('Done\n');
end



