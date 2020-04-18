function [inlier_pos, H_best] = RANSAC_based_HomographyEstimation(match_l, match_r)
% estimate homograpyh matrix based on RANSAC
%
% @param
% match_l: coordinates of the matches point in left image
% match_r: coordinates of the matches point in right image
%
% @return
% inlier_pos: position of inliers feature points
% H_best: best homography matrix for correspondence feature points

% choose hyperparameters
% e = 0.4;
% p = 0.99;
% s = 6;
% N = ceil(log(1-p) / log(1-(1-e)^s));    % number of iterations
N = 10;
threshold = 10;

% initial
match_num = size(match_l, 2);
inlier_num_max = 0;
inlier_num = 0;
H_best = zeros(3,3);

% iterations
for i=1:N
    % randomly select 4 points
    [~,sample_index] = datasample(match_l(1,:), 4);
    l = match_l(:, sample_index)';   % 4 random points from left image features to perform H matrix
    r = match_r(:, sample_index)';  % corresponding 4 matches from the right image
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    l1 = l(1,:); l2 = l(2,:); l3 = l(3,:); l4 = l(4,:);
    r1 = r(1,:); r2 = r(2,:); r3 = r(3,:); r4 = r(4,:);
    % Direct Linear Transformation
    M = [
           r1(1) r1(2)  1    0     0     0  -r1(1)*l1(1) -r1(2)*l1(1) -l1(1);
            0     0     0   r1(1) r1(2)  1  -r1(1)*l1(2) -r1(2)*l1(2) -l1(2);
           r2(1) r2(2)  1    0     0     0  -r2(1)*l2(1) -r2(2)*l2(1) -l2(1);
            0     0     0   r2(1) r2(2)  1  -r2(1)*l2(2) -r2(2)*l2(2) -l2(2);
           r3(1) r3(2)  1     0     0    0  -r3(1)*l3(1) -r3(2)*l3(1) -l3(1);
            0     0     0   r3(1) r3(2)  1  -r3(1)*l3(2) -r3(2)*l3(2) -l3(2);
           r4(1) r4(2)  1     0     0    0  -r4(1)*l4(1) -r4(2)*l4(1) -l4(1);
            0     0     0   r4(1) r4(2)  1  -r4(1)*l4(2) -r4(2)*l4(2) -l4(2);
        ];
    [~,~,V] = svd(M);   % singular value decomposition
    smallest_eigenvector = V(:, end);      % smallest eigenvalue corresponding to eigenvector
    
    H = [smallest_eigenvector(1:3,1)'; smallest_eigenvector(4:6,1)'; smallest_eigenvector(7:9,1)'];
    H = H / H(end);     % normization a33 to 1(8 dof)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % calculate the error
    points_ = H * [match_r; ones(1,match_num)];
    points_ = points_ ./ points_(end, :);   % bitwise normalize
    error = points_ - [match_l; ones(1,match_num)];
    error = sqrt(sum(error.^2, 1));     % eucledian distance
    
    % keep the H matrix corresponding to maximun inliers
    inliers = error < threshold;
    inlier_num = size(find(inliers), 2);  % number of inliers
    if inlier_num > inlier_num_max
        inlier_num_max = inlier_num;
        inlier_pos = find(inliers);
        H_best = H;
    end
end

end
