function [k_hat, b_hat] = RANSAC(vec_x, vec_y, max_iter_times, fitting_threshold, inlier_threshold)
% RANSAC algorithm for calculat the best fitting line
%  
% @param
% vec_x: independence variables in column vector form
% vec_y: dependence variables in column vector form
% max_iter_times: deterimine the maximum iteration times of the algorithm
% fitting_threshold: determine whether a point is so-called a inlier
% inlier_threshold: determine whether the inliers is so-called sufficient enough
% 
% @return
% k_hat: predicted slope
% y_hat: predicted intercept

total = size(vec_x,1);
max_count_inlier = 0;
max_inlier_arr = [];

for index=1:max_iter_times
    %% randomly select two points as a sample to fit the model
    rand_perm = randperm(total);
    rand_index = rand_perm(1:2);
    points = [vec_x(rand_index) vec_y(rand_index)];
    Q1 = points(1,:);
    Q2 = points(2,:);
    
    %% count the inlier upon this model
    inlier_arr = [];
    for i=1:total
        P = [vec_x(i) vec_y(i)];
        if abs(det([Q2-Q1;P-Q1]))/norm(Q2-Q1) <= fitting_threshold
            inlier_arr = [inlier_arr P'];
        end
    end
    
    %% reserve the better fitting model
    count_inlier = size(inlier_arr,2);
    if count_inlier > max_count_inlier
        max_count_inlier = count_inlier;
        max_inlier_arr = inlier_arr;
    end
    if max_count_inlier >= inlier_threshold
        break;
    end
end

%% re-estimate the model using all points in the best inliers based Linear Square
[k_hat, b_hat] = LinearSquare(max_inlier_arr(1,:)', max_inlier_arr(2,:)');

end