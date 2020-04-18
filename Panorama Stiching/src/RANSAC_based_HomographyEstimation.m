function ind = RANSAC_based_HomographyEstimation(match_left, match_right)
% choose hyperparameters
e = 0.4;
p = 0.99;
s = 6;
n = ceil(log(1-p) / log(1-(1-e)^s));    % number of iterations

% initial
inlier_count_max = 0;
s = size(match_left, 2);
inlier_count = 0;
H_best = zeros(3,3);

% iterations
for i=1:n
    % pick 4 random points
    [~,index] = datasample(match_left(1,:), 4);
    l = match_left(:, index)';   % 4 random points from left image features to perform H matrix
    r = match_right(:, index)';  % corresponding 4 matches from the right image
    
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
    [~,~,V] = svd(M);   % solve system using singular value decomposition
    x = V(:, end);  % retreiving eigenvector corresponding to smallest eigenvalye
    
    H = [x(1:3,1)'; x(4:6,1)'; x(7:9,1)'];
    H = H / H(end);
    
    % calculating the error in order to keep the H matrix corresponding to
    % biggest number of inliners
    points1 = H*[match_right; ones(1,s)];
    
    % Normalizing
    points1 = [points1(1,:)./points1(3,:); points1(2,:)./points1(3,:); ones(1,s)];
    
    error = (points1 - [match_left; ones(1,s)]);
    error = sqrt(sum(error.^2, 1));     % eucledian distance
    inliers = error < 10;
    inlier_count = size(find(inliers), 2);  % number of inliers
    if inlier_count > inlier_count_max
        inlier_count_max = inlier_count;
        ind = find(inliers);
        H_best = H;
    end 
end

end
