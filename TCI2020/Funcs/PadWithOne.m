function output = PadWithOne(input, finalLength)

output = [input, ones(1, finalLength - length(input))];