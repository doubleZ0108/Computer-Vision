function [rows, cols, radiuses] = LoGDetector(img, sigma0, total_num, scale_ratio, threshold)
% LoG detector for scale invariant point detection
%
% @param
% img: origin image
% sigma0: initial sigma for Laplacian of Gaussian filter
% total_num: number of scale-spatial space
% scale_ratio: ratio of adjacent scale-spatial space
% threshold: non-maxima suppression threshold

img = im2double(rgb2gray(img));
[M, N] = size(img);

%% calculate scale spatial space using different LoG filter
scale_spatial_space = zeros(M, N, total_num);
for i = 1:total_num
    sigma = sigma0 * scale_ratio^(i-1);
    
    filter_size = 2 * ceil(3 * sigma) + 1;    % increase pattern size as sigma
    LoG_filter = (sigma ^ 2) * fspecial('log', filter_size, sigma);     % create LoG filter with specific pattern size and sigma
    img_log_filtered = imfilter(img, LoG_filter, 'replicate');   % implement LoG filter
                                                                 % replicate - avoid false blob detection at the outer pixels
    
    scale_spatial_space(:, :, i) = img_log_filtered;
end

%% find local maximum in image(space) scale
scale_spatial_space = scale_spatial_space .^ 2;     % increase the difference
max_values = zeros(M, N, total_num);
for i = 1:total_num
    max_values(:, :, i) = ordfilt2(scale_spatial_space(:, :, i), 5^2, ones(5,5));   % ascending order for scale spatial space
                                                                                    % domain is 5*5
                                                                                    % take 5^2th as output pixel
end

%% find local maximum in sigma scale
blobs = zeros(M, N, total_num);
for i = 1:M
    for j = 1:N
        blobs(i, j, :) = max(max_values(i, j, :));
    end
end

%% non-maxima suppression
for i = 1:M
    for j = 1:N
        if blobs(i, j, :) < threshold
            blobs(i, j, :) = 0;
        end
    end
end
blobs = blobs .* (blobs == scale_spatial_space);

%% record information from (x,y,sigma) space
rows = [];
cols = [];
radiuses = [];
for i=1:total_num
    [row, col] = find(blobs(:, :, i));
    rows = [rows; row];
    cols = [cols; col];
    temp_redius = sigma0 * scale_ratio.^(i-1) * sqrt(2);    % usually, the ratio between adjacent is set to sqrt(2)
    radius = repmat(temp_redius, [size(row,1),1]);          % copy rows times
    radiuses = [radiuses; radius];
end

end