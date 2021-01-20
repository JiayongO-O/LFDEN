function net = InitLayers(net)

for i = 1 : numel(net.layers)
    if (strcmp(net.layers{i}.type, 'conv'))
        numWeights = numel(net.layers{i}.weights);
        net.layers{i}.m = cell(1, numWeights);
        net.layers{i}.v = cell(1, numWeights);
    end
end