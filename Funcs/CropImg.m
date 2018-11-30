function output = CropImg(input, pad)

output = input(pad+1:end-pad, pad+1:end-pad, :, :, :, :, :, :);
end