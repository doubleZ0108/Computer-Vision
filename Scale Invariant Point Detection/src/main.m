clear;
clc;

file_path = '../img/';
file_name = 'butterfly.jpg';

sigma0 = 2.5;
total_num = 5;
scale_factor = 2;
threshold = 0.005;

img = imread([file_path file_name]);
[rows, cols, radiuses] = LoGDetector(img, sigma0, total_num, scale_factor, threshold);

FeaturePointsVisualization(img, rows, cols, radiuses, 'r');