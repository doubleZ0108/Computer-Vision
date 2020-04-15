function FeaturePointsVisualization(img, rows, cols, radiuses, color)

img = rgb2gray(img);
figure;
imshow(img);
hold on;

% theta = 0:0.1:(2*pi+0.1);
% rows_ = rows(:, ones(size(theta)));
% cols_ = cols(:, ones(size(theta)));
% radiuses_ = radiuses(:, ones(size(theta)));
% theta = theta(ones(size(rows, 1), 1), :);
% X = rows + cos(theta) .* radiuses_;
% Y = cols + sin(theta) .* radiuses_;
% line(X', Y', 'Color', color);



theta = 0:pi/40:2*pi;
X = rows + sin(theta) .* radiuses;
Y = cols + cos(theta) .* radiuses;
line(Y', X', 'Color', color);
title(sprintf('%d circles', size(radiuses, 1)));

end