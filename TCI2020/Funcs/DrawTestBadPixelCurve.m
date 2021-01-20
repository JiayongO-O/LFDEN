function DrawTestBadPixelCurve(figure_1, it)
%This function is to draw training figure
global testBadPixel;
pause(0.1);

figure(figure_1);
subplot(4, 2, 8);
plot(1:length(testBadPixel(:, end)), testBadPixel(:, end), 'b');
title(sprintf('TestBadPixel(0.2): %f on Iter:%d', testBadPixel(end, end), it));

drawnow;

end

