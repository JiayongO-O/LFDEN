%% This is the main function to train and test the network
clearvars; clearvars -global; clc; close all;

addpath('Funcs');
addpath(genpath('./Lib'));

vl_setupnn();
InitParam();

[depthNet] = LoadNetworks(true);

Main_Train(depthNet);
