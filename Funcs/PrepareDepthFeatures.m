function featuresStack = PrepareDepthFeatures(inputLF, deltaY, deltaX)

global param;
depthResolution = param.depthResolution;
deltaDisparity = param.deltaDisparity;

[height, width, ~, angHeight, angWidth] = size(inputLF);
grayLF = zeros(height, width, angHeight, angWidth);

for i = 1 : angHeight
    for j = 1 : angWidth
       grayLF(:, :, i, j) = rgb2gray(inputLF(:, :, :, i, j)); 
    end
end

defocusStack = zeros(height, width, depthResolution);
correspStack = zeros(height, width, depthResolution);
featuresStack = zeros(height, width, 2*depthResolution, 'single');

delta = 2 * deltaDisparity / (depthResolution - 1);

indDepth = 1;
count = 0;

for curDepth = - deltaDisparity : delta : deltaDisparity

    if (mod(indDepth, 10) == 0)
        fprintf(repmat('\b', [1, count]));
    end
    
    shearedLF = zeros(height, width, angHeight * angWidth);
    [X, Y] = meshgrid(1:width, 1:height);
    
    indView = 1;
    for iax = 1 : angWidth
        for iay = 1 : angHeight
            curY = Y + curDepth * deltaY(indView);
            curX = X + curDepth * deltaX(indView); 
            shearedLF(:, :, indView) = interp2(X, Y, grayLF(:, :, iay, iax), curX, curY, 'cubic', nan);
            indView = indView + 1;
        end
    end
    
    defocusStack(:, :, indDepth) = DefocusResponse(shearedLF);
    correspStack(:, :, indDepth) = CorrespResponse(shearedLF);
    
    if (mod(indDepth, 10) == 0)
        count = fprintf('%d %%', indDepth/depthResolution*100);
    end
    
    indDepth = indDepth + 1;
    
end

featuresStack(:, :, 1:depthResolution) = single(defocusStack);
featuresStack(:, :, depthResolution+1:2*depthResolution) = single(correspStack);
end
