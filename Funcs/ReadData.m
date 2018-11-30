function [images, features, reference, refPos] = ReadData(fileName, isTraining, it)


global param;
batchSize = param.batchSize;
depthBorder = param.depthBorder;
useGPU = param.useGPU;

if (~exist('isTraining', 'var') || isempty(isTraining))
    isTraining = true;
end

fileInfo = h5info(fileName);
numItems = length(fileInfo.Datasets);
maxNumPatches = fileInfo.Datasets(1).Dataspace.Size(end);
numImages = floor(maxNumPatches / batchSize) * batchSize;

if (isTraining)
    startInd = mod((it-1) * batchSize, numImages) + 1;
else
    startInd = 1;
    batchSize = 1;
end

features = []; reference = []; images = []; refPos = [];

for i = 1 : numItems
    
    dataName = fileInfo.Datasets(i).Name;
    
    switch dataName
        
        case 'FT'
            s = fileInfo.Datasets(i).Dataspace.Size;
            features = h5read(fileName, '/FT', [1, 1, 1, startInd], [s(1), s(2), s(3), batchSize]);
            features = single(features);
            if (useGPU)
                features = gpuArray(features);
            end
        
        case 'GT'
            s = fileInfo.Datasets(i).Dataspace.Size;
            reference = h5read(fileName, '/GT', [1, 1, 1, startInd], [s(1), s(2), s(3), batchSize]);
            reference = single(CropImg(reference, depthBorder));
            if (useGPU)
                reference = gpuArray(reference);
            end
            
        case 'IN'
            s = fileInfo.Datasets(i).Dataspace.Size;
            images = h5read(fileName, '/IN', [1, 1, 1, startInd], [s(1), s(2), s(3), batchSize]);
            if (useGPU)
                images = gpuArray(images);
            end
            
        case 'RP'
            refPos = h5read(fileName, '/RP', [1, startInd], [2, batchSize]);
            refPos = single(refPos);
            if (useGPU)
                refPos = gpuArray(refPos);
            end
            
    end
end


    
