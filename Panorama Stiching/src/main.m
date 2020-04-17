clear
clc

SetupVlfeat();

file_path = '../img/';
file_name_l = 'mountain1.jpg'; file_name_r = 'mountain2.jpg';

img_l = imread([file_path file_name_l]); img_r = imread([file_path file_name_r]);

[M, N, dummy] = size(img_l);
img_r = imresize(img_r, [M, N]);  % match the size of two images

SIFT(img_l, img_r);