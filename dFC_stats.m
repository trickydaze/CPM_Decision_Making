%%%%%%%%%%%%%% DFC and Metastability Measures %%%%%%%%%%%%
%%%%%%% (Note: this code adopted from  Dr. Rajanikant Panda Prof. Gustavo Deco
%%%%%%% original code)
%%%%%%% Reference papers:
%%%%%%% 1. Deco, G., Kringelbach, M. L., Jirsa, V. K., & Ritter, P. (2017). The dynamics of resting fluctuations in the brain: metastability and its dynamical cortical core. Scientific reports, 7(1), 1-14.
%%%%%%% 2. Panda, R., Thibaut, A., Lopez-Gonzalez, A., Escrichs, A., Bahri, M. A., Hillebrand, A., ... laureys, S., Annen, J. & Tewarie, P. (2021). Disruption in structural-functional network repertoire and time resolved subcortical-frontoparietal connectivity in disorders of consciousness. bioRxiv.
%%%%%%%%%%%%%%%%%%%


%Load the Data

Food_data = load('/Users/yillysaurus/Downloads/data/Food_data.mat');
Food_data=Food_data.ts_data; % Food_data = num2cell(Cards_data,[2,3])';
for i=1:size(Food_data,2)
    Food_data{i} = squeeze(Food_data{1,i});
end

Cards_data = load('/Users/yillysaurus/Downloads/data/Cards_data.mat');
Cards_data=Cards_data.ts_data; % Food_data = num2cell(Cards_data,[2,3])';
for i=1:size(Cards_data,2)
    Cards_data{i} = squeeze(Cards_data{1,i});
end

Discount_data = load('/Users/yillysaurus/Downloads/data/Discount_data.mat');
Discount_data=Discount_data.ts_data; %Discount_data = num2cell(Discount_data,[2,3])';
for i=1:size(Discount_data,2)
    Discount_data{i} = squeeze(Discount_data{1,i});
end
clear i
%% For Whole Brain Network 
TR=2 % Specify your TR in Sec

[Food_meta, Food_sync, Food_dFC, Food_dFC_cos, Food_int, Food_seg] = dynamicMetrics_2(Food_data,TR);  

[Cards_meta, Cards_sync, Cards_dFC, Cards_dFC_cos, Cards_int, Cards_seg] = dynamicMetrics_2(Cards_data,TR);  

[Discount_meta, Discount_sync, Discount_dFC, Discount_dFC_cos, Discount_int, Discount_seg] = dynamicMetrics_2(Discount_data,TR);

%% Plotting metastability of Whole Brain 

Grp_food = ones(length(Food_data),1); 
Grp_cards = 2*(ones(length(Cards_data),1));
Grp_discount = 3*(ones(length(Discount_data),1));


Grp_foodcards = [Grp_food; Grp_cards]; 
Grp_cardsdiscount = [Grp_cards; Grp_discount]; 
Grp_fooddiscount = [Grp_food; Grp_discount]; 

Grp_meta_foodcards = [Food_meta; Cards_meta];
Grp_meta_cardsdiscount = [Cards_meta, Discount_meta];
Grp_meta_fooddiscount = [Food_meta;  Discount_meta];

% Food x Cards 
figure; notBoxPlot(Grp_foodcards,Grp,0.6,'patch',ones(length(Grp_foodcards),1));
title('Whole brain metastability (0.01-0.09Hz) between Food and Cards', 'FontSize', 14);
ylabel('metastability', 'FontSize', 12);
xticklabels({'Baseline','Hypnosis'})
set(gca,'FontSize', 20, 'FontName','Calibri', 'FontWeight', 'bold')


    figure(); plot(Food_meta, 'b-o', 'LineWidth',3,'MarkerSize',12); hold on; plot(Cards_meta, 'r--*', 'LineWidth',3,'MarkerSize',12)
    title('Whole Brain Metastability'); ylabel('Metastability'); xlabel('No of Subjects')
    set(gca,'FontWeight','bold','FontName', 'Arial','fontsize',18)
    legend('Baseline','Hypnosis')

    [p,h,~,t]=ttest(mean(Food_meta,2), mean(Cards_meta,2),0.05)    

% Cards x Discount 

figure; notBoxPlot(Grp_meta_cardsdiscount,Grp,0.5,'patch',ones(length(Grp_meta_cardsdiscount),1));
title('Whole brain metastability (0.01-0.09Hz) between Food and Discount', 'FontSize', 14);
ylabel('metastability', 'FontSize', 12);
xticklabels({'Baseline','Hypnosis'})
set(gca,'FontSize', 20, 'FontName','Calibri', 'FontWeight', 'bold')


    figure(); plot(Cards_meta, 'b-o', 'LineWidth',3,'MarkerSize',12); hold on; plot(Discount_meta, 'r--*', 'LineWidth',3,'MarkerSize',12)
    title('Whole Brain Metastability'); ylabel('Metastability'); xlabel('No of Subjects')
    set(gca,'FontWeight','bold','FontName', 'Arial','fontsize',18)
    legend('Baseline','Hypnosis')



    [p,h,~,t]=ttest(mean(Cards_meta,2), mean(Discount_meta,2),0.05)    


% Food x Discount 
figure; notBoxPlot(Grp_meta_fooddiscount,Grp,0.5,'patch',ones(length(Grp_meta_fooddiscount),1));
title('Whole brain metastability (0.01-0.09Hz) between Food and Discount', 'FontSize', 14);
ylabel('metastability', 'FontSize', 12);
xticklabels({'Baseline','Hypnosis'})
set(gca,'FontSize', 20, 'FontName','Calibri', 'FontWeight', 'bold')


    figure(); plot(Food_meta, 'b-o', 'LineWidth',3,'MarkerSize',12); hold on; plot(Discount_meta, 'r--*', 'LineWidth',3,'MarkerSize',12)
    title('Whole Brain Metastability'); ylabel('Metastability'); xlabel('No of Subjects')
    set(gca,'FontWeight','bold','FontName', 'Arial','fontsize',18)
    legend('Baseline','Hypnosis')

    [p,h,~,t]=ttest(mean(Food_meta,2), mean(Discount_meta,2),0.05)    

    
    
%% Plotting Integration Whole Brain
Grp_int= [mean(Cards_int,2); mean(Discount_int,2)];
figure; notBoxPlot(Grp_int,Grp,0.5,'patch',ones(length(Grp_meta),1));
title('Whole brain Integration (0.01-0.09Hz)', 'FontSize', 14);
ylabel('Integration', 'FontSize', 12);
xticklabels({'Baseline','Hypnosis'})
set(gca,'FontSize', 20, 'FontName','Calibri', 'FontWeight', 'bold')


    figure(); plot(mean(Cards_int,2), 'b-o', 'LineWidth',3,'MarkerSize',12); hold on; plot(mean(Discount_int,2), 'r--*', 'LineWidth',3,'MarkerSize',12)
    title('Whole Brain Integration'); ylabel('Metastability'); xlabel('No of Subjects')
    set(gca,'FontWeight','bold','FontName', 'Arial','fontsize',18)
    legend('Baseline','Hypnosis')
   
    
    [p,h,~,t]=ttest(Food_int,Discount_int,0.05)
    


%% Plot the mean connectivity 
% Food
for i=1:size(Food_dFC,2)
Food_dFC_all(i,:,:) = mean(abs(Food_dFC  {1,i}),3);
Food_dFC_all1(i,:,:) = mean((Food_dFC_cos  {1,i}),3);
Food_dFC_all1_median(i,:,:) = median((Food_dFC_cos  {1,i}),3);
end

% Cards
for i=1:size(Cards_dFC,2)
Cards_dFC_all(i,:,:) = mean(abs(Cards_dFC {1,i}),3);
Cards_dFC_all1(i,:,:) = mean((Cards_dFC_cos  {1,i}),3);
Cards_dFC_all1_median(i,:,:) = median((Cards_dFC_cos {1,i}),3);
end

% Discount
for i=1:size(Discount_dFC,2)
Discount_dFC_all(i,:,:) = mean(abs(Discount_dFC  {1,i}),3);
Discount_dFC_all1(i,:,:) = mean((Discount_dFC_cos  {1,i}),3);
Discount_dFC_all1_median(i,:,:) = median((Discount_dFC_cos  {1,i}),3);
end


%% Mean DFC of Tasks

figure;imagesc(squeeze(median(Food_dFC_all1,1)));caxis([-0.63 0.63])
title ('a. Mean dFC of Food Task')
%xlabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
ylabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
set(gca,'FontSize',14, 'FontName','Calibri', 'FontWeight', 'bold')

figure;
imagesc(squeeze(median(Cards_dFC_all1,1)));colorbar;caxis([-0.63 0.63])
title ('b. Mean dFC of Cards Task')
xlabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
%ylabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
set(gca,'FontSize',14, 'FontName','Calibri', 'FontWeight', 'bold')

figure;
imagesc(squeeze(median(Discount_dFC_all1,1)));colorbar;caxis([-0.63 0.63])
title ('c. Mean DFC of Discount Task')
%xlabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
%ylabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
set(gca,'FontSize',14, 'FontName','Calibri', 'FontWeight', 'bold')

%% Creating ROIs for Glass Brain Plotting 
% Food
Food_dFC_all1_gp =squeeze(mean(Food_dFC_all1)); 
Food_dFC_all1_gp_mean= mean(Food_dFC_all1_gp);

Food_dFC_all1_roi =squeeze(median(Food_dFC_all1,2)); 
[Food_dFC_h, Food_dFC_p,s, Food_dFC_s] =ttest(Food_dFC_all1_roi, mean(mean(Food_dFC_all1_roi)),0.05); 
Food_dFC_t = Food_dFC_s.tstat;
plot(Food_dFC_t.*Food_dFC_h)


Cards_dFC_all1_gp =squeeze(mean(Cards_dFC_all1)); 
Cards_dFC_all1_gp_mean= mean(Cards_dFC_all1_gp);

Cards_dFC_all1_roi =squeeze(median(Cards_dFC_all1,2)); 
[Cards_dFC_h, Cards_dFC_p,s, Cards_dFC_s] =ttest(Cards_dFC_all1_roi, mean(mean(Cards_dFC_all1_roi)),0.05); 
Cards_dFC_t = Cards_dFC_s.tstat;
plot(Cards_dFC_t.*Cards_dFC_h)



Discount_dFC_all1_gp =squeeze(mean(Discount_dFC_all1)); 
Discount_dFC_all1_gp_mean= mean(Discount_dFC_all1_gp);

Discount_dFC_all1_roi =squeeze(median(Discount_dFC_all1,2)); 
[Discount_dFC_h, Discount_dFC_p,s, Discount_dFC_s] =ttest(Discount_dFC_all1_roi, mean(mean(Discount_dFC_all1_roi)) - std(std(Discount_dFC_all1_roi)),0.05); 
Discount_dFC_t = Discount_dFC_s.tstat;
plot(Discount_dFC_t.*Discount_dFC_h)

create_shennifti(Food_dFC_t,'Food_dFC_t2.nii',0)
create_shennifti(Cards_dFC_t,'Cards_dFC_t2.nii',0)
create_shennifti(Discount_dFC_t,'Discount_dFC_t2.nii',0)
%save food_dFC_all1_mean_median.mat Food_dFC_all1 Food_dFC_all1_median 
%% Creating Significant Matrix for Glass Brain connectivity Plotting 
% Food
Food_dFC_all1_gp =squeeze(mean(Food_dFC_all1)); 
Food_dFC_all1_gp_mean= mean(Food_dFC_all1_gp);

Food_dFC_all1_roi =squeeze(median(Food_dFC_all1,2)); 
[Food_dFC_mh, Food_dFC_mp,s, Food_dFC_ms] =ttest(abs(Food_dFC_all1), mean(mean(mean(abs(Food_dFC_all1)))),0.00001); 
Food_dFC_mt = Food_dFC_ms.tstat;
Food_dFC_mt = squeeze(Food_dFC_mt);
Food_dFC_mh = squeeze(Food_dFC_mh);
Food_dFC_smt = Food_dFC_mt.*Food_dFC_mh;
imagesc(Food_dFC_smt)
writematrix(Food_dFC_smt,'Food_dFC_smt.txt');
type Food_dFC_smt.txt

Cards_dFC_all1_gp =squeeze(mean(Cards_dFC_all1)); 
Cards_dFC_all1_gp_mean= mean(Cards_dFC_all1_gp);

Cards_dFC_all1_roi =squeeze(median(Cards_dFC_all1,2)); 
[Cards_dFC_mh, Cards_dFC_mp,s, Cards_dFC_ms] =ttest(abs(Cards_dFC_all1), mean(mean(mean(abs(Cards_dFC_all1)))),0.00001); 
Cards_dFC_mt = Cards_dFC_ms.tstat;
Cards_dFC_mt = squeeze(Cards_dFC_mt);
Cards_dFC_mh = squeeze(Cards_dFC_mh);
Cards_dFC_smt = Cards_dFC_mt.*Cards_dFC_mh;
imagesc(Cards_dFC_smt)
writematrix(Cards_dFC_smt,'Cards_dFC_smt.txt');
type Cards_dFC_smt.txt

Discount_dFC_all1_gp =squeeze(mean(Discount_dFC_all1)); 
Discount_dFC_all1_gp_mean= mean(Discount_dFC_all1_gp);

Discount_dFC_all1_roi =squeeze(median(Discount_dFC_all1,2)); 
[Discount_dFC_mh, Discount_dFC_mp,s, Discount_dFC_ms] =ttest(abs(Discount_dFC_all1), mean(mean(mean(abs(Discount_dFC_all1)))),0.00001); 
Discount_dFC_mt = Discount_dFC_ms.tstat;
Discount_dFC_mt = squeeze(Discount_dFC_mt);
Discount_dFC_mh = squeeze(Discount_dFC_mh);
Discount_dFC_smt = Discount_dFC_mt.*Discount_dFC_mh;
imagesc(Food_dFC_smt)
writematrix(Discount_dFC_smt,'Discount_dFC_smt.txt');
type Discount_dFC_smt.txt





