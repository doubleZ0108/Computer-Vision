clear;
clc;

file_path = '../img/';
file_name = 'butterfly.jpg';
% file_name = 'butterfly@large.jpg';

sigma0 = 1;
total_num = 5;
scale_ratio = 2;
threshold = 0.005;

img = imread([file_path file_name]);

%% LoG detector for scale invariant point detection
[rows, cols, radiuses] = LoGDetector(img, sigma0, total_num, scale_ratio, threshold);

%% Visualize for feature points detected by LoGDetector
FeaturePointsVisualization(img, rows, cols, radiuses);
