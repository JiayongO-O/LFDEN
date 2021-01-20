clearvars; clearvars -global; clc; close all;

addpath('Funcs');
addpath(genpath('./Libraries'));

%vl_compilenn('enableGPU', true, 'cudaMethod', 'nvcc', 'enableCudnn', true);
vl_setupnn();
InitParam();

[depthNet, state] = LoadNetworks(true);

Main_Train(depthNet, state);