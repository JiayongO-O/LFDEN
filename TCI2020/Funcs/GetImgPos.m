function pos = GetImgPos(ind)

global param;

pos = (ind - 1) / (param.origAngRes - 1) + 1;