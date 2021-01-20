function badPixel = BadPixel(img_GT, img_reg)

threshold = 0.2;

abs_error = abs(img_GT(:) - img_reg(:));

count = 0;
for i = 1:numel(abs_error)
    if (abs_error(i)> threshold)
        count = count + 1;
    end
end

badPixel = count/numel(abs_error);

end

