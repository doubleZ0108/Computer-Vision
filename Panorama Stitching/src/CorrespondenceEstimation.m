function CorrespondenceEstimation(img_l, img_r, match_l, match_r, inlier_pos)
% display correspondence estimation feature points
% 
% @param
% img_l: origin left image
% img_r: origin right image
% match_l: coordinates of the matches point in left image
% match_r: coordinates of the matches point in right image
% inlier_pos: position of inliers feature points

PotentialCorrespondenceEstimation(img_l, img_r, match_l, match_r);
InlierCorrespondenceEstimation(img_l, img_r, match_l, match_r, inlier_pos);

end

function PotentialCorrespondenceEstimation(img_l, img_r, match_l, match_r)
% display potential correspondences estimation feature points
figure
showMatchedFeatures(img_l, img_r, match_l', match_r', 'montage');
title('potential matches');
legend('matchedPts_left', 'matchedPts_right');
end

function InlierCorrespondenceEstimation(img_l, img_r, match_l, match_r, inlier_pos)
% display inlier correspondences estimation feature points
figure
showMatchedFeatures(img_l, img_r, match_l(:,inlier_pos)', match_r(:,inlier_pos)', 'montage');
title('inliers matches');
legend('matchedPts_left', 'matchedPts_right');
end