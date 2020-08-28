# RANSAC

* [Problem](#problem)
* [Algorithm](#algorithm)
* [Experiment Result](#experiment-result)
* [Implementation](#implementation)
   * [Hyper Parameter](#hyper-parameter)
   * [Linear Square](#linear-square)
   * [RANSAC](#ransac-1)
* [About the Author](#about-the-author)

------

## Problem

RANSAC is widely used in fitting models from sample points with outliers. Please implement a program to fit a straight 2D line using RANSAC from the following sample points:
 (-2, 0), (0, 0.9), (2, 2.0), (3, 6.5), (4, 2.9), (5, 8.8), (6, 3.95), (8, 5.03), (10, 5.97), (12, 7.1), (13, 1.2), (14, 8.2), (16, 8.5) (18, 10.1). Please show your result graphically.

## Algorithm

1. Randomly select a sample of `s` from `S` and instantiate the model from this subset.
2. Determine  `Si` which are within a distance threshold `t` of the model.
3. If the size of `Si`(number of inliers) is greater than some threshold `T`. Re-estimate the model using all points in `Si` and terminate.
4. If size of `Si` is less than `T`, select a new subset and repeat.
5. After `N` trail, the largest consensus set `Si` is selected, and the model is re-estimated using all points in Si.

<br/>

## Experiment Result

| Hyper Parameter   | Value |
| ----------------- | ----- |
| max_iter_times    | 10000 |
| fitting_threshold | .1    |
| inlier_threshold  | 11    |

There are 9 inliers of this "best fitting line".

<img src="https://upload-images.jianshu.io/upload_images/12014150-85f203e5e27dd1f5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="11.png" width="80%;" />

| Hyper Parameter   | Value |
| ----------------- | ----- |
| max_iter_times    | 10000 |
| fitting_threshold | 1     |
| inlier_threshold  | 11    |

There are 11 inliers of this "best fitting line".

<img src="https://upload-images.jianshu.io/upload_images/12014150-164334f7aacfb269.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="22.png" width="80%;" />

> Because this problem only have 14 points, we can calculate lines exhausted
>
> We can use `nchoosek(1:14, 2)` to generate each permutation and judge them on by on.

<br/>

## Implementation

### Hyper Parameter

- `vec_x`: independence variables in column vector form
- `vec_y`: dependence variables in column vector form
- `max_iter_times`: deterimine the maximum iteration times of the algorithm
- `fitting_threshold`: determine whether a point is so-called a inlier
- `inlier_threshold`: determine whether the inliers is so-called sufficient enough

### Linear Square

I use projection in **Linear Algorithm** to calculate the coefficient matrix directly in matrix form. Also we can use error term and derivative to solve the system.

```matlab
function [k_hat, b_hat] = LinearSquare(vec_x, vec_y)

K = vec_x;
B = ones(size(K,1), 1);
A = [K B];
b = vec_y;

x_hat = inv(A' * A) * A' * b;

k_hat = x_hat(1,1);
b_hat = x_hat(2,1);

end
```

### RANSAC

- randomly select two points as a sample to fit the model

  ```matlab
  rand_perm = randperm(total);
  rand_index = rand_perm(1:2);
  points = [vec_x(rand_index) vec_y(rand_index)];
  Q1 = points(1,:);
  Q2 = points(2,:);
  ```

- count the inlier upon this model

  ```matlab
  inlier_arr = [];
  for i=1:total
      P = [vec_x(i) vec_y(i)];
      if abs(det([Q2-Q1;P-Q1]))/norm(Q2-Q1) <= fitting_threshold
         inlier_arr = [inlier_arr P'];
      end
  end
  ```

- reserve the better fitting model

  ```matlab
  count_inlier = size(inlier_arr,2);
  if count_inlier > max_count_inlier
      max_count_inlier = count_inlier;
      max_inlier_arr = inlier_arr;
  end
  if max_count_inlier >= inlier_threshold
      break;
  end
  ```

<br/>

## About the Author

| Item            | Info                     |
| --------------- | ------------------------ |
| **Name**        | Zhe Zhang(张喆)          |
| **ID**          | 1754060                  |
| **Adviser**     | Prof. Lin Zhang          |
| **Course Name** | Digital Image Processing |
| **Course Time** | Mon. 2-4 [1-17]          |
| **Email**       | dbzdbz@tongji.edu.cn     |

