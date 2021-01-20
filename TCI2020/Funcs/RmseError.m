function rmse_error = RmseError(img_GT, img_reg)

rmse_error = sqrt((sum(sum((img_GT - img_reg).^2)))./(numel(img_GT)));

end

