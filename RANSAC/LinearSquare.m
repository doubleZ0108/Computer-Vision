function [k_hat, b_hat] = LinearSquare(vec_x, vec_y)
% compute the parameters of the best fitting line using linear square
% 
% @param
% vec_x: independence variables in column vector form
% vec_y: dependence variables in column vector form
% 
% @return
% k_hat: predicted slope
% y_hat: predicted intercept

K = vec_x;
B = ones(size(K,1), 1);
A = [K B];
b = vec_y;

x_hat = inv(A' * A) * A' * b;

k_hat = x_hat(1,1);
b_hat = x_hat(2,1);

end