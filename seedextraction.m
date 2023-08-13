

sf = 1/2; %change TR
cH = 0.1;
cL = 0.01;



% loading ROIs
roiname = dir(['/Users/yillysaurus/Downloads/atlas2/matfile/shen214_*.mat'])
roi_files = [];
roi_coordinate=[];
roi_coordinates_all=[]; 

for roii=1:length(roiname)
    roi_files = strvcat(roi_files, ['/Users/yillysaurus/Downloads/atlas2/matfile/' roiname(roii).name]);
end


%% calculating correlation matrix for each subject

subjfolder = dir('/Users/yillysaurus/Downloads/data/sub*');

%% subji = 1:1:length(subjfolder)
for subji = 1:1:length(subjfolder)
image_files=[];
  fprintf('processing subject %d ... ',subji);
    
    for imagei = 1:248 % No of Dynamics
        image_files= strvcat(image_files,['/Users/yillysaurus/Downloads/data/' subjfolder(subji).name '/func1/Food_bold.nii,' num2str(imagei)]);
    end

    %%
    m1=248;
    rois = maroi('load_cell', roi_files);  % make maroi ROI objects
    mY = get_marsy(rois{:}, image_files, 'mean');  % extract data into marsy data object
    
    
    y_roi = summary_data(mY); % get summary time course(s)


    for roii = 1:size(y_roi,2)
        i=+1
        y_roi_filtered(:,roii) = fmri_banpass_filter(y_roi(:,roii),sf,cH,cL);
    end
%%    
y_roi_filtered_1= y_roi_filtered
    save(['/Users/yillysaurus/Downloads/data/' subjfolder(subji).name '/func1/' subjfolder(subji).name '.mat'], 'y_roi_filtered', 'y_roi');
    fprintf('done! \n')
end

