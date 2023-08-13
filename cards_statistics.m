% CARDS STATISTICS

% Clear the command window
clc

% Extract the data for Cards_dFC_cos_s13
Cards_dFC_cos_s13 = (Cards_dFC_cos{1,1});

% Define indices for different categories of cards
max_card_index = [64 65 108 109 201 202 203];
min_card_index = [2 3 4 6 8 9 11 12 22 38 51 53 55 67 68 70 72 73 75 76 82 85 86 91 92 115 118 119 120 121 122 124 125 139 141 143 144 146 147 157 158 160 161 165 166 188 190 191 193 194 204 205 207 208];
highest_win_index = [44 45 64 65 80];
lowest_win_index = [38 188 190 191];
reward_index = 210;

rest_index = 156;
first_index = [1 6 10 14 17 19 23 25 27 29 31 34 39 47 53 60 69 72 79 84 87 93 95 98 102 107 109 112 124 135 138 141 143 145 148 156 166 170 175 177 181 184 186 188 193 199 205 213 218];
last_index = [4 8 11 15 17 21 23 25 28 30 32 37 41 52 58 67 70 77 82 85 88 93 96 100 103 108 111 118 134 136 139 141 143 147 150 163 168 171 176 178 183 185 187 192 197 203 208 211 216];
fail_index = [23 34 48 61 76 78 80 90 139 160 166 168 177 181 182 184 192];

% Extract and compute mean for rest cards
Cards_dFC_cos_s13_rest = squeeze(Cards_dFC_cos_s13(:, :, rest_index));
Cards_dFC_cos_s13_rest_mean = mean(Cards_dFC_cos_s13_rest, 3);

% Extract and compute mean for first cards
Cards_dFC_cos_s13_firsts = squeeze(Cards_dFC_cos_s13(:, :, first_index));
Cards_dFC_cos_s13_firsts_mean = mean(Cards_dFC_cos_s13_firsts, 3);

% Extract and compute mean for last cards
Cards_dFC_cos_s13_lasts = squeeze(Cards_dFC_cos_s13(:, :, last_index));
Cards_dFC_cos_s13_lasts_mean = mean(Cards_dFC_cos_s13_lasts, 3);

% Extract and compute mean for reward cards
Cards_dFC_cos_s13_reward = squeeze(Cards_dFC_cos_s13(:, :, reward_index));
Cards_dFC_cos_s13_reward_mean = mean(Cards_dFC_cos_s13_reward, 3);

% Extract and compute mean for fail cards
Cards_dFC_cos_s13_fail = squeeze(Cards_dFC_cos_s13(:, :, fail_index));
Cards_dFC_cos_s13_fail_mean = mean(Cards_dFC_cos_s13_fail, 3);

% Extract and compute mean for max card indices
Cards_dFC_cos_s
