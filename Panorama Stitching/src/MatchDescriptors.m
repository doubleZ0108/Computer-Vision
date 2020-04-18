function [match_l, match_r] = MatchDescriptors(F_l, D_l, F_r, D_r)
% matches the two sets of SIFT descriptors
%
% @param
% F_l: feature frame of left image
% D_l: descriptor of left image
% F_r: feature frame of right image
% D_r: descriptor of right image
%
% @return
% match_l: coordinates of the matches point in left image
% match_r: coordinates of the matches point in right image

[matches, distances] = vl_ubcmatch(D_l, D_r);  % match SIFT features(matches | squared Euclidean distance between the matches)

[~, distances_index] = sort(distances, 'descend');     % descend sort for distances
matches = matches(:, distances_index);      % sort matches according to the order of scores
distances = distances(distances_index);     % sort distances

match_l = F_l(1:2, matches(1,:));     % coordinates of the matches point in left image
match_r = F_r(1:2, matches(2,:));     % corrdinates of the matches point in right image
end
