function DrawTestRMSECurve(figure_1, it)
%This function is to draw test RMAE figure
global testRmse;
pause(0.1);

figure(figure_1);
subplot(4, 2, 6);
plot(1:length(testRmse(:, end)), testRmse(:, end), 'b');
title(sprintf('TestRMSE: %f on Iter:%d', testRmse(end, end), it));

drawnow;

end

