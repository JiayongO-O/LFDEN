function DrawTestMSECurve(figure_1, it)
%This function is to draw training figure
global testMse;
pause(0.1);

figure(figure_1);
subplot(3, 2, 6);
plot(1:length(testMse(:, end)), testMse(:, end), 'b');
title(sprintf('TestMSE: %f on Iter:%d', testMse(end, end), it));

drawnow;

end

