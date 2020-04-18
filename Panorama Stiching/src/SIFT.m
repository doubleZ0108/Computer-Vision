function [F, D] = SIFT(img)
% SIFT scale invariant feature transform
%
% @param
% img: origin image

[F, D] = vl_sift(im2single(rgb2gray(img)));     % compute the SIFT frames and descriptors
% F: feature frame [X;Y;S;TH]
%       X,Y: center of the frame
%       S: scale
%       TH: orientation
% D: descriptor of the corresponding frame in F
%    128-dimensional vector

% pick 100 random feature points
rand_perm = randperm(size(F, 2));          % random permutation from 1~1005
rand_features_index = rand_perm(1:100);    % take the first 100 feature points
rand_features = F(:, rand_features_index); % random features

figure;
imshow(img, []);
hold on
frame = vl_plotframe(rand_features);     % random features
set(frame, 'color', 'y', 'linewidth', 2);
title('image SIFT features');

end
