function [depthNet] = CreateNet()
depthNet.layers = {} ;
depthNet.layers{end+1} = struct('type', 'conv', 'weights', {{InitWeight(7,7,200,100), zeros(1,100,'single')}}, 'stride', 1, 'pad', 0);

depthNet.layers{end+1} = struct('type', 'relu');
depthNet.layers{end+1} = struct('type', 'conv', 'weights', {{InitWeight(5,5,100,100), zeros(1,100,'single')}}, 'stride', 1, 'pad', 0);

depthNet.layers{end+1} = struct('type', 'relu');
depthNet.layers{end+1} = struct('type', 'conv', 'weights', {{InitWeight(3,3,100,50),  zeros(1,50,'single')}},  'stride', 1, 'pad', 0);

depthNet.layers{end+1} = struct('type', 'relu');
depthNet.layers{end+1} = struct('type', 'conv', 'weights', {{InitWeight(1,1,50,1),    zeros(1,1,'single')}},   'stride', 1, 'pad', 0);

depthNet = InitLayers(depthNet); 
end