function [match_left, match_right] = MatchDescriptors(F_l, D_l, F_r, D_r)

% MATCHES = vl_ubcmatch(DESCR1, DESCR2) matches the two sets of SIFT
% descriptors DESCR1 and DESCR2.
% 
% [MATCHES,SCORES] = vl_ubcmatch(DESCR1, DESCR2) retuns the matches and
% also the squared Euclidean distance between the matches.
[matches, scores] = vl_ubcmatch(D_l, D_r);  % Match SIFT features
[~, sort_index] = sort(scores, 'descend');     % ��scores����
matches = matches(:, sort_index);       % ����scores��������������matches
scores = scores(sort_index);
match_left = F_l(1:2, matches(1,:));     % ��ͼmatches�������
match_right = F_r(1:2, matches(2,:));
end
