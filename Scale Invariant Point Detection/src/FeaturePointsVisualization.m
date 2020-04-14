function FeaturePointsVisualization(img, rows, cols, radiuses, color)

imshow(img);
hold on;

theta = 0:0.1:2*pi;
rows_ = rows(:, ones(size(theta)));
cols_ = cols(:, ones(size(theta)));
radiuses_ = radiuses(:, ones(size(theta)));
theta = theta(ones(size(rows, 1), 1), :);
X = rows + cos(theta) .* radiuses_;
Y = cols + sin(theta) .* radiuses_;
line(X', Y', 'Color', color);

title(sprintf('%d circles', size(rows, 1)));

end