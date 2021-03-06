function ImageStitching(img_l, img_r, H)
% use homography matrix to stitching image
% 
% @param
% img_l: origin left image
% img_r: origin right image
% H: homography matrix for correspondence feature points

%% build TFORM struct for N-dimensional projective transformation.
tform = maketform('projective', H');
img_r_ = imtransform(img_r, tform);

%% display right image after homography 
% figure;
% imshow(img_r_);

[M_l, N_l, ~] = size(img_l);
[M_r, N_r, ~] = size(img_r);

%% border position under homography
border_M = [
    1 N_r N_r  1;
    1  1  M_r M_r;
    1  1   1   1;
];
border_M_ = zeros(3,4);
border_M_ = H * border_M;

%% normize border position
x_ = border_M_(1,:) ./ border_M_(3,:);
y_ = border_M_(2,:) ./ border_M_(3,:);

%% determine up and left
up = round(min(y_));
y_offset = 0;
if up<=0
    y_offset = -up + 1;
    up = 1;
end

left = round(min(x_));
x_offset = 0;
if left<=0
    x_offset = -left + 1;
    left = 1;
end

%% display final stitchied image
[M_, N_, ~] = size(img_r_);
imgout(up:up+M_-1, left:left+N_-1,:) = img_r_;
imgout(y_offset+1:y_offset+M_l, x_offset+1:x_offset+N_l, :) = img_l;

figure;
imshow(imgout);
title('stitched image');

end