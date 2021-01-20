function DrawTrainCurve(figure_1, it)
%This function is to draw training figure
global trainError;

figure(figure_1);
subplot(4, 2, 1);
plot(1:length(trainError(:, 1)), trainError(:, 1), 'r');
title(sprintf('TrainingVar: %f on Iter: %d', trainError(end, 1), it));
subplot(4, 2, 2)
plot(1:length(trainError(:, 2)), trainError(:, 2), 'r');
title(sprintf('TrainingSim: %f on Iter: %d', trainError(end, 2), it));
drawnow;

end

