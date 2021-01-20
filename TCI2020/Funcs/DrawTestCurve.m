function DrawTestCurve(figure_2, it)
%This function is to draw test curve

global testError

figure(figure_2);
subplot(4, 2, 3);
plot(1:length(testError(:, 1)), testError(:, 1));
title(sprintf('TestVar: %f on Iter: %d', testError(end, 1), it));
subplot(4, 2, 4);
plot(1:length(testError(:, 2)), testError(:, 2));
title(sprintf('TestSim: %f on Iter: %d', testError(end, 2), it));
drawnow;

end

