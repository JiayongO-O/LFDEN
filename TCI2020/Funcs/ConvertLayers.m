function net = ConvertLayers(net, destination)

switch destination
  case 'gpu', moveop = @(x) gpuArray(x) ;
  case 'cpu', moveop = @(x) gather(x) ;
  otherwise, error('Unknown destination ''%s''.', destination) ;
end

for i = 1 : numel(net.layers)
    if (strcmp(net.layers{i}.type, 'conv'))
        numWeights = numel(net.layers{i}.weights);
        for j = 1 : numWeights            
            if (~isempty(net.layers{i}.m))
                net.layers{i}.m{j} = moveop(net.layers{i}.m{j});
            end
            
            if (~isempty(net.layers{i}.v))
                net.layers{i}.v{j} = moveop(net.layers{i}.v{j});
            end
        end
    end
end