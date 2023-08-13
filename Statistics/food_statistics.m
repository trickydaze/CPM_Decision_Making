% FOOD STATISTICS

% Clear the command window
clc

% Extract the data for Food_dFC_cos_s13
Food_dFC_cos_s13 = (Food_dFC_cos{1,9});

% Define indices for loved, hated, long observation, and short observation foods
loved_food_index = [6 10 12 23 33 36 38 44 48 51 53 56 58 61 68 72 74 76 83 85 88 90 93 95 99 101 103 105 110 112 115 119 122 124 127 130 132 136 138 141 147 151 155 157 160 163 166 168 172];
hated_food_index = [15 21 27 31 63 79 143 149];
long_observation_index = [6 15 18 21 23 27 38 44 48 63 79 143 151 168 172];
short_observation_index = [12 31 58 76 97 99 101 103 105 107 115 122 132 138 141];

% Extract and compute mean for loved foods
Food_dFC_cos_s13_love = squeeze(Food_dFC_cos_s13(:, :, loved_food_index));
Food_dFC_cos_s13_love_mean = mean(Food_dFC_cos_s13_love, 3);

% Extract and compute mean for hated foods
Food_dFC_cos_s13_hate = squeeze(Food_dFC_cos_s13(:, :, hated_food_index));
Food_dFC_cos_s13_hate_mean = mean(Food_dFC_cos_s13_hate, 3);

% Extract and compute mean for long observation foods
Food_dFC_cos_s13_long = squeeze(Food_dFC_cos_s13(:, :, long_observation_index));
Food_dFC_cos_s13_long_mean = mean(Food_dFC_cos_s13_long, 3);

% Extract and compute mean for short observation foods
Food_dFC_cos_s13_short = squeeze(Food_dFC_cos_s13(:, :, short_observation_index));
Food_dFC_cos_s13_short_mean = mean(Food_dFC_cos_s13_short, 3);

% Perform t-tests and print results
fprintf('Love and Hate\n');
[lovenhate_13, plovenhate_13] = ttest2(Food_dFC_cos_s13_love_mean, Food_dFC_cos_s13_hate_mean);
fprintf('Median of Love and Hate t-test: %.4f, Median of p-values: %.4f\n', median(lovenhate_13), median(plovenhate_13));

fprintf('Long and Short\n');
[longnshort_13, plongnshort_13] = ttest2(Food_dFC_cos_s13_long_mean, Food_dFC_cos_s13_short_mean);
fprintf('Median of Long and Short t-test: %.4f, Median of p-values: %.4f\n', median(longnshort_13), median(plongnshort_13));

fprintf('Hate and Short\n');
[hatenshort_13, phatenshort_13] = ttest2(Food_dFC_cos_s13_hate_mean, Food_dFC_cos_s13_short_mean);
fprintf('Median of Hate and Short t-test: %.4f, Median of p-values: %.4f\n', median(hatenshort_13), median(phatenshort_13));

fprintf('Love and Long\n');
[lovenlong_13, plovenlong_13] = ttest2(Food_dFC_cos_s13_love_mean, Food_dFC_cos_s13_long_mean);
fprintf('Median of Love and Long t-test: %.4f, Median of p-values: %.4f\n', median(lovenlong_13), median(plovenlong_13));

fprintf('Love and Short\n');
[lovenshort_13, plovenshort_13] = ttest2(Food_dFC_cos_s13_love_mean, Food_dFC_cos_s13_short_mean);
fprintf('Median of Love and Short t-test: %.4f, Median of p-values: %.4f\n', median(lovenshort_13), median(plovenshort_13));

fprintf('Hate and Long\n');
[hatenlong_13, phatenlong_13] = ttest2(Food_dFC_cos_s13_hate_mean, Food_dFC_cos_s13_long_mean);
fprintf('Median of Hate and Long t-test: %.4f, Median of p-values: %.4f\n', median(hatenlong_13), median(phatenlong_13));
