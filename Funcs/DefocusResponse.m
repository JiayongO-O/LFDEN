function output = DefocusResponse(input)

curMean = nanmean(input, 3);
curMean(isnan(curMean)) = 0;
output = curMean;

end