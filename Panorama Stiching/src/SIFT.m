function SIFT(img_l, img_r)

SIFT_for_single_image(img_l);
SIFT_for_single_image(img_r);

end

function SIFT_for_single_image(img)

figure;
imshow(img, []);
% F = vl_sift(I) computes the SIFT frames [1] (keypoints) F of the
% image I. I is a gray-scale image in single precision. Each column
% of F is a feature frame and has the format [X;Y;S;TH], where X,Y
% is the (fractional) center of the frame, S is the scale and TH is
% the orientation (in radians).
% 
% [F,D] = vl_sift(I) computes the SIFT descriptors [1] as well. Each
% column of D is the descriptor of the corresponding frame in F. A
% descriptor is a 128-dimensional vector of class UINT8.
[F, D] = vl_sift(im2single(rgb2gray(img)));
rand_p = randperm(size(F, 2));
rand_features = rand_p(1:50);
% h1 = vl_plotframe(F(:, rand_features));
h2 = vl_plotframe(F(:, rand_features));
% set(h1, 'color', 'r', 'linewidth', 3);
set(h2, 'color', 'y', 'linewidth', 2);
title('image SIFT features');

end