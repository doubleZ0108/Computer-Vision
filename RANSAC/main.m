clear;
clc;

vec_x = [-2 0 2 3 4 5 6 8 10 12 13 14 16 18]';
vec_y = [0 0.9 2.0 6.5 2.9 8.8 3.95 5.03 5.97 7.1 1.2 8.2 8.5 10.1]';


%% Use linear square algorithm directly
% [k_hat, b_hat] = LinearSquare(vec_x, vec_y);

%% RANSAC
% max_iter_times = nchoosek(total, 2);
max_iter_times = 10000;
fitting_threshold = 1;
inlier_threshold = 11;

[k_hat, b_hat] = RANSAC(vec_x,vec_y, ...
                        max_iter_times, ...
                        fitting_threshold, ...
                        inlier_threshold);

%% Plot
x = -2:.1:18;
y = k_hat * x + b_hat;

plot(x,y);
hold on;
scatter(vec_x, vec_y);
title(['Bast fitting line y = ' num2str(k_hat) 'x + ' num2str(b_hat)]);