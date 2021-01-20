function dzdx = WarpingGrad(depth, images, refPos, curFeatures, dzdx)

delta = 0.01;

depthP = depth + delta;
[warpedImages, ~] = Warpping(depthP, images, refPos, false);

grad = (warpedImages - curFeatures) ./ delta .* dzdx; % just like the definition of gradient. and use the chain theory to multiple the dzdx

indNan = isnan(grad);
grad(indNan) = 0;

dzdx = sum(grad, 3);
end