function abs_error_rel= AbsError(img_GT, img_reg)

img_GT = img_GT + 2;
img_reg = img_reg + 2;

[h, w] = size(img_GT);

for i = 1:h
    for j = 1:w
        temp(i, j) = abs(img_GT(i, j) - img_reg(i, j))./ abs(img_GT(i, j));
    end
end

abs_error_rel = sum(sum(temp))./(h*w);

end

