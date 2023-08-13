
%DISCOUNT STATISTICS
%"now_higher_index": large amount > later_delay
%"later_higher_index":large amount < later_delay
%"now_high_difference_index":large amount>later_delay & max(large_amount - later_delay)
%"later_high_difference_index":large amount<later_delay & max(large_amount - later_delay)
%"now_low_difference_index":large amount>later_delay & min(large_amount - later_delay)
%"later_low_difference_index":large amount<later_delay & min(large_amount - later_delay)

% DISCOUNT STATISTICS

% Clear the command window
clc

% Extract the data for Discount_dFC_cos_s13
Discount_dFC_cos_s13 = (Discount_dFC_cos{1,9});

% Define indices for different categories of discount conditions
now_higher_index = [5 17 34 37 44 64 81 86 96 104 107 109 129 131 160 176 181 186 217 223 243];
later_higher_index = [2 7 9 12 14 19 21 24 27 29 32 39 42 47 49 52 54 56 59 61 67 69 72 74 76 79 83 88 91 93 99 101 111 114 116 119 122 124 126 134 136 139 142 144 147 149 151 158 163 165 168 170 173 179 183 188 191 193 195 198 200 202 205 208 210 212 215 220 225 227 230 233 235 238 240 245 248];
now_high_difference_index = [160];
later_high_difference_index = [139];
now_low_difference_index = [131];
later_low_difference_index = [210 227];

% Extract and compute mean for now higher discount condition
Discount_dFC_cos_s13_now_higher = squeeze(Discount_dFC_cos_s13(:, :, now_higher_index));
Discount_dFC_cos_s13_now_higher_mean = mean(Discount_dFC_cos_s13_now_higher, 3);

% Extract and compute mean for later higher discount condition
Discount_dFC_cos_s13_later_higher = squeeze(Discount_dFC_cos_s13(:, :, later_higher_index));
Discount_dFC_cos_s13_later_higher_mean = mean(Discount_dFC_cos_s13_later_higher, 3);

% Extract and compute mean for now high difference discount condition
Discount_dFC_cos_s13_now_high_difference = squeeze(Discount_dFC_cos_s13(:, :, now_high_difference_index));
Discount_dFC_cos_s13_now_high_difference_mean = mean(Discount_dFC_cos_s13_now_high_difference, 3);

% Extract and compute mean for later high difference discount condition
Discount_dFC_cos_s13_later_high_difference = squeeze(Discount_dFC_cos_s13(:, :, later_high_difference_index));
Discount_dFC_cos_s13_later_high_difference_mean = mean(Discount_dFC_cos_s13_later_high_difference, 3);

% Extract and compute mean for now low difference discount condition
Discount_dFC_cos_s13_now_low_difference = squeeze(Discount_dFC_cos_s13(:, :, now_low_difference_index));
Discount_dFC_cos_s13_now_low_difference_mean = mean(Discount_dFC_cos_s13_now_low_difference, 3);

% Extract and compute mean for later low difference discount condition
Discount_dFC_cos_s13_later_low_difference = squeeze(Discount_dFC_cos_s13(:, :, later_low_difference_index));
Discount_dFC_cos_s13_later_low_difference_mean = mean(Discount_dFC_cos_s13_later_low_difference, 3);

% Perform t-tests and print results
fprintf('Now or Later High\n');
[nownlater_13, pnownlater_13] = ttest2(Discount_dFC_cos_s13_now_higher_mean, Discount_dFC_cos_s13_later_higher_mean);
fprintf('Median of Now or Later High t-test: %.4f, Median of p-values: %.4f\n', median(nownlater_13), median(pnownlater_13));

fprintf('Big Difference Now or Later High\n');
[bigdiffnownlater_13, pbigdiffnownlater_13] = ttest2(Discount_dFC_cos_s13_now_high_difference_mean, Discount_dFC_cos_s13_later_high_difference_mean);
fprintf('Median of Big Difference Now or Later High t-test: %.4f, Median of p-values: %.4f\n', median(bigdiffnownlater_13), median(pbigdiffnownlater_13));

fprintf('Low Difference Now or Later High\n');
[lowdiffnownlater_13, plowdiffnownlater_13] = ttest2(Discount_dFC_cos_s13_now_low_difference_mean, Discount_dFC_cos_s13_later_low_difference_mean);
fprintf('Median of Low Difference Now or Later High t-test: %.4f, Median of p-values: %.4f\n', median(lowdiffnownlater_13), median(plowdiffnownlater_13));
