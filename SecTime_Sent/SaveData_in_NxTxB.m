
% find all the files in the directory
clc
clear
close all
cd /Users/yillysaurus/Downloads/data/   % specify the folder wher fMRI ROI regressed signals are there
folders_name = dir('sub*');
NumberOfSubj = length(folders_name);  
%% total number of subject in a group
NumberOfTimePoint = 248;                    % total number of time points/dynamics in the fMRI data
NumberOfROIs = 214;                         % total number of ROIs time series 
ts_data=cell(1,NumberOfSubj);

for i = 1 : length(folders_name)
    fold_name= folders_name(i).name;
    cd(fold_name);
    cd('func3')
    files_name =  dir('*.mat');  
    data=load(files_name.name);             % load the fMRI time series data
    data= data.y_roi';
                                             % store all the subject fMRI time series data in a variable
    ts_data{1,i}= data; 
    cd ..
    cd ..
end 
save Discount_data ts_data folders_name
