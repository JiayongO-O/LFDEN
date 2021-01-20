function mae_out = MaeError(img_GT, img_reg)

mae_out = (sum(abs(img_GT(:) - img_reg(:))))./numel(img_GT);

end

