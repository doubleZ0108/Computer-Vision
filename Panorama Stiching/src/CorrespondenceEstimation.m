function CorrespondenceEstimation(img_l, img_r, match_left, match_right, ind)

PotentialCorrespondencesEstimation(img_l, img_r, match_left, match_right);
InlierCorrespondencesEstimation(img_l, img_r, match_left, match_right, ind);

end

function PotentialCorrespondencesEstimation(img_l, img_r, match_left, match_right)
figure
showMatchedFeatures(img_l, img_r, match_left', match_right', 'montage');
title('set of potential matches');
legend('matchedPts_left', 'matchedPts_right');
end

function InlierCorrespondencesEstimation(img_l, img_r, match_left, match_right, ind)
figure
showMatchedFeatures(img_l, img_r, match_left(:,ind)', match_right(:,ind)', 'montage');
title('set of inliers matches');
legend('matchedPts_left', 'matchedPts_right');
end