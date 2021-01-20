function [depthNet, state] = loadNet(NetPath)

model = load(NetPath);
% change the struct model to dagNN model
depthNet = dagnn.DagNN.loadobj(model.depthNet_s);
state = model.state;
end

