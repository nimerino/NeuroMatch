% for this to work you need to dl npy-matlab from
% https://github.com/kwikteam/npy-matlab and add it to your path
% Their function saves one file at a time; to loop over the .npy files 
% run this script 


% Get the dir and search it for npy files 
npyDir = uigetdir; 

npyFiles = dir(fullfile(npyDir,'*.npy')); 

% Loop over all files.
for k = 1:length(npyFiles)
    
  baseFileName = npyFiles(k).name;
  fprintf(1, 'Converting the file %s\n', baseFileName);
  % Use the readNPY function to open the file as a .mat.
  readNPY(baseFileName);  
  save([npyFiles(k).name, '.mat'],'ans');
  clear ans 
  
end


% FORGET THE CODE BELOW, FILEDATASTORE STORES THE ENTIRE PATH OF THE FILE 
% AS ITS NAME. VERY MESSY!!

% fds = fileDatastore('*.npy', 'ReadFcn', @importdata);
% 
% fullFileNames = fds.Files;
% 
% numFiles = length(fullFileNames);
% 
% % Loop over all files.
% 
% for k = 1 : numFiles
% 
%     fprintf('Converting the file %s\n', fullFileNames{k});
%     % Use the readNPY function to open the file as a .mat.
%     readNPY(fullFileNames{k});
%     % Save the bleeding thing
%     save(['%q', fullFileNames{k}, '.mat'],'ans') 
%     clear ans 
% end
