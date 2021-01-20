function mse_error = MseError(img_GT, img_reg);

mse_error = (sum(sum((img_GT - img_reg).^2)))./numel(img_GT);

end

