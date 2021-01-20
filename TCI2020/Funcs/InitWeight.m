function weights = InitWeight(h, w, in, out, isConv)

if (~exist('isConv', 'var') || isempty(isConv))
    isConv = true;
end

if (isConv)
    sc = sqrt(3 / (h * w * in));
else
    sc = sqrt(3 / (h * w * out));
end

weights = (rand(h, w, in, out, 'single') * 2 - 1) * sc;
