function [contentNames, contentPaths, numContents] = GetFolderContent(folderPath, extension)

if(~exist('extension', 'var'))
    extension = [];
end

list = dir([folderPath, '/*', extension]);
contentNames = setdiff({list.name}, {'.', '..'});
contentPaths = strcat(strcat(folderPath, '/'), contentNames);
numContents = length(contentNames);
end
