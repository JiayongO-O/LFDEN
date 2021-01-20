function [net, state] = UpdateNetDagNN(net, state)

global param;

% update for every params
for p  = 1: numel(net.params)
    
    parDer = net.params(p).der ;
    [net.params(p).value, state.solverState{p}] = ...
        param.solver(net.params(p).value, state.solverState{p}, ...
        parDer, param.solverOpts, param.lr);
end

end