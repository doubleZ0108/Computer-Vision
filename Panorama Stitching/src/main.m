clear
clc

file_path = '../img/';
% file_name_l = 'mountain1.jpg'; file_name_r = 'mountain2.jpg';
% file_name_l = 'jiading1.jpg'; file_name_r = 'jiading2.jpg';

%% set up vlfeat for SIFT
SetupVlfeat();

%% match the size of two images
img_l = imread([file_path file_name_l]); img_r = imread([file_path file_name_r]);
[M, N, ~] = size(img_l);
img_r = imresize(img_r, [M, N]);

%% interest points detection using SIFT
[F_l, D_l] = SIFT(img_l);
[F_r, D_r] = SIFT(img_r);

%% matching the two sets of SIFT descriptors
[match_l, match_r] = MatchDescriptors(F_l, D_l, F_r, D_r);

%% calculate homography matrix estimation by using the correspondence pairs with RANSAC
[inlier_pos, H_best] = RANSAC_based_HomographyEstimation(match_l, match_r);

%% plotting correspondences matches 
CorrespondenceEstimation(img_l, img_r, match_l, match_r, inlier_pos);

%% stitch the transformed images
ImageStitching(img_l, img_r, H_best);