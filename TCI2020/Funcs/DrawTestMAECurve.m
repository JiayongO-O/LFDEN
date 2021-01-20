function DrawTestMAECurve(figure_1, it)
%This function is to draw test MAE figure
global testMae;
pause(0.1);

figure(figure_1);
subplot(4, 2, 5);
plot(1:length(testMae(:, end)), testMae(:, end), 'b');
title(sprintf('TestMAE: %f on Iter:%d', testMae(end, end), it));

drawnow;

end

