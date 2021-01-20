function weights = InitWeight(h, w, in, out, isConv)

if (~exist('isConv', 'var') || isempty(isConv))
    isConv = true;
end

if (isConv)
    sc = sqrt(3 / (h * w * in));
%     sc = sqrt(2 / (h * w * out));
else
    sc = sqrt(3 / (h * w * out));
%     sc = sqrt(2 / (h * w * in));
end

weights = (rand(h, w, in, out, 'single') * 2 - 1) * sc;
% weights = randn(h, w, in, out, 'single') * sc ;