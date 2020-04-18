function CorrespondenceEstimation(img_l, img_r, match_left, match_right, inlier_pos)

PotentialCorrespondencesEstimation(img_l, img_r, match_left, match_right);
InlierCorrespondencesEstimation(img_l, img_r, match_left, match_right, inlier_pos);

end

function PotentialCorrespondencesEstimation(img_l, img_r, match_left, match_right)
figure
showMatchedFeatures(img_l, img_r, match_left', match_right', 'montage');
title('set of potential matches');
legend('matchedPts_left', 'matchedPts_right');
end

function InlierCorrespondencesEstimation(img_l, img_r, match_left, match_right, inlier_pos)
figure
showMatchedFeatures(img_l, img_r, match_left(:,inlier_pos)', match_right(:,inlier_pos)', 'montage');
title('set of inliers matches');
legend('matchedPts_left', 'matchedPts_right');
end