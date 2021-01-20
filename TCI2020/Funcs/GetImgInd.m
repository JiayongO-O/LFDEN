function ind = GetImgInd(inPos)

global param;
ind = int32((inPos-1) * (param.origAngRes - 1) + 1);