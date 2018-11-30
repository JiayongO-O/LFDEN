%% This is the function to prepare the training and test data
clearvars; clearvars -global; clc; close all;

addpath('Funcs');

InitParam();

PrepareTestData();
PrepareTrainingData();
fprintf('\n--------------------*******--------------------\n');
fprintf('===========Data Generation Complete!!!============\n')