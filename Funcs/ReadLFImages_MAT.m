function [fullLF] = ReadLFImages_MAT(scenePath)
% If the light field images are in .mat format, use this function, 
% else if the light field images are in macro-pixel format, use ReadLFImages.
% MIND THE DIMENSION AND FORMATE OF THE INPUT DATA!!!

load(scenePath); %the loaded data has field name 'lf_data', it should be U*V*H*W*CH
fullLF = permute(lf_data, [3,4,5,1,2]);
fullLF = fullLF(:, :, :, 2:8, 2:8);
fullLF = fullLF(:, :, :, end:-1:1, :);

end
