function net = UpdateNet(net, res, iterInd)

numLayers = numel(net.layers);
global param;

%% ADAM
beta1 = param.beta1;
beta2 = param.beta2;
alpha = param.alpha;
smallNum = param.eps;

for l = numLayers : -1 : 1
    for j = 1 : numel(res(l).dzdw)
        if (iterInd == 1)
            net.layers{l}.m{j} = res(l).dzdw{j};
            net.layers{l}.v{j} = res(l).dzdw{j}.^2;
        else
            net.layers{l}.m{j} = beta1 * net.layers{l}.m{j} + (1 - beta1) * res(l).dzdw{j};
            net.layers{l}.v{j} = beta2 * net.layers{l}.v{j} + (1 - beta2) * res(l).dzdw{j}.^2;
        end
        
        mh = net.layers{l}.m{j} / (1 - beta1^iterInd);
        vh = net.layers{l}.v{j} / (1 - beta2^iterInd);
        
        net.layers{l}.weights{j} = net.layers{l}.weights{j} - alpha * mh ./ (sqrt(vh) + smallNum);
    end
end