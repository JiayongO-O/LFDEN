function net = CreateNetParamShare()
% build the siamese network.
net  = dagnn.DagNN();
for i = 1: 100
    conv(i).name = ['conv_', num2str(i)];
    relu(i).name = ['relu_', num2str(i)];
    input(i).name = ['input_', num2str(i)];
    output(i).name = ['output_', num2str(i)];
    relu_out(i).name = ['reluout_', num2str(i)];
    param_name_f = 'conv_feat_f'; param_name_b = 'conv_feat_b';
    
    net.addLayer(conv(i).name, dagnn.Conv('size', single([1, 1, 49, 2]), 'pad', 0, 'stride', 1,...
    'hasBias', true), {input(i).name}, {output(i).name}, {param_name_f, param_name_b});
    net.addLayer(relu(i).name, dagnn.ReLU(), {output(i).name}, {relu_out(i).name});
    
end
net.addLayer('concat', dagnn.Concat('dim', 3), {relu_out.name}, {'cat_O'});

% build dispNet
net.addLayer('disp_conv1', dagnn.Conv('size', single([7, 7, 200, 100]), 'pad', 0, 'stride', 1,...
    'hasBias', true), {'cat_O'}, {'disp_conv1_out'}, {'disp_conv1_f', 'disp_conv1_b'});
net.addLayer('disp_relu1', dagnn.ReLU(), {'disp_conv1_out'}, {'disp_relu1_out'});

net.addLayer('disp_conv2', dagnn.Conv('size', single([5, 5, 100, 100]), 'pad', 0, 'stride', 1,...
    'hasBias', true), {'disp_relu1_out'}, {'disp_conv2_out'}, {'disp_conv2_f', 'disp_conv2_b'});
net.addLayer('disp_relu2', dagnn.ReLU(), {'disp_conv2_out'}, {'disp_relu2_out'});

net.addLayer('disp_conv3', dagnn.Conv('size', single([3, 3, 100, 50]), 'pad', 0, 'stride', 1,...
    'hasBias', true), {'disp_relu2_out'}, {'disp_conv3_out'}, {'disp_conv3_f', 'disp_conv3_b'});
net.addLayer('disp_relu3', dagnn.ReLU(), {'disp_conv3_out'}, {'disp_relu3_out'});

net.addLayer('disp_conv4', dagnn.Conv('size', single([1, 1, 50, 1]), 'pad', 0, 'stride', 1,...
    'hasBias', true), {'disp_relu3_out'}, {'disp_conv4_out'}, {'disp_conv4_f', 'disp_conv4_b'});

net.initParams();
end