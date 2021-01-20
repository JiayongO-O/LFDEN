function [inImgs, inFeat, ref, refPos] = ComputeTestExamples(curFullLF)

global inputView;

[height, width, ~, ~, ~] = size(curFullLF);

inImgs = reshape(curFullLF, height, width, []);

curRefInd.Y = 4; 
curRefInd.X = 4;
curRefPos.Y = GetImgPos(curRefInd.Y); curRefPos.X = GetImgPos(curRefInd.X);
    
fprintf('Working on reference (4, 4): ');

ref = curFullLF(:, :, :, curRefInd.Y, curRefInd.X);

deltaViewY = inputView.Y - curRefPos.Y; 
deltaViewX = inputView.X - curRefPos.X;

inFeat = PrepareDepthFeatures(curFullLF, deltaViewY, deltaViewX);

refPos = [curRefPos.Y; curRefPos.X];

fprintf(repmat('\b', 1, 5));
fprintf('Done\n');

end



