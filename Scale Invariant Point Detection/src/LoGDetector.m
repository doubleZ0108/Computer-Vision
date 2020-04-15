function [rows, cols, radiuses] = LoGDetector(img, sigma0, total_num, scale_factor, threshold)

img = im2double(rgb2gray(img));
[M, N] = size(img);

scale_space = zeros(M, N, total_num);
for i = 1:total_num
    sigma = sigma0 * scale_factor^(i-1);
    
    filter_size = 2 * ceil(3 * sigma) + 1;    % 模版尺寸
    LoG_filter = (sigma ^ 2) * fspecial('log', filter_size, sigma);
    img_log_filtered = imfilter(img, LoG_filter, 'replicate');   % replicate - avoid false blob detection at the outer pixels
    scale_space(:, :, i) = img_log_filtered;
end

% find local maximum
scale_space = scale_space .^ 2;     % ???
max_values = zeros(M, N, total_num);
for i = 1:total_num
    max_values(:, :, i) = ordfilt2(scale_space(:, :, i), 5^2, ones(5,5));   % 对图像A中大小为domain矩阵大小内的非零像素值进行升序排序，取第order个值作为输出像素值
end

blobs = zeros(M, N, total_num);
for i = 1:M
    for j = 1:N
        maxpixel = max(max_values(i,j,:));
        % non-maxima suppression
        if maxpixel >= threshold
            blobs(i, j, :) = maxpixel;
        end
    end
end
blobs = blobs .* (blobs == scale_space);

% record information
rows = [];
cols = [];
radiuses = [];
for i=1:total_num
    [row, col] = find(blobs(:, :, i));
    rows = [rows; row];
    cols = [cols; col];
    temp_redius = sigma0 * scale_factor.^(i-1) * sqrt(2);
    radius = repmat(temp_redius, [size(row,1),1]);
    radiuses = [radiuses; radius];
end

end