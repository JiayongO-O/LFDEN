function output = CorrespResponse(input)

inputVar = nanvar(input, [], 3);
inputVar(isnan(inputVar)) = 0;
output = sqrt(inputVar);
end