- Lect 1: Introduction to Computer Vision
  - what is computer vision?
    - human vision
    - what is it related to?
  - why is computer vision difficult?
  - why do we need to study CV?
  - course overview
    - Introduction
    - Panorama stitching
      - Local interset point detectors
      - Local feature descriptors and matching
    - Monocular camera calibration
      - Projective geometry
      - Nonlinear least squares
      - Measurement using a single camera
    - Binocular stereo vision
    - Machine Learning
      - Basic for machine learning and its applications
      - Applications of DCNNs
  - Introduction to numerical geometry
  
- Lect 2: Local Interest Point Detectors

  - Local Invariant Features
  - Motivation
    - Requirement
    - Invariance
  - Harris Corner Detector
    - Finding corners
    - Basic idea
    - Mathematics
    - Algorithm
    - Steps
    - Properties
    - Local descriptors for Harris corners
  - Scale Invariant Point Detection
    - Automatic scale selection
    - Laplacian-of-Gaussian detector
    - Difference-of-Gaussian detector
  
- Lect 3: Local Feature Descriptors and Matching

  - Scale Invariant Feature Transform(SIFT)
    - Assign Keypoints Orientations
    - Building the descriptor
    - Application of SIFT
  - Case Study: Homography Estimation
    - Matrix Differentiation
    - Lagrange Multiplier
      - LS for Inhomogeneous Linear System
      - LS for Homogeneous Linear System
    - Least-squares for Linear Systems
    - RANSAC-based Homography Estimation

- Lect 4: Math Prerequisite 1 - Projective Geometry

  - Vector Operations
  - Fundamentals of Projective Geometry

- Lect 5: Math Prerequisite 2 - Nonlinear Least-squares

  - Non-linear Least Squares
    - General Methods for Non-linear Optimization
      - Basic Concepts
      - Descent Methods
        - 2-phase methods
          - steepest descent to compute the descent direction
          - Newton's method to compute the descent direction
          - Line search to find the step length
        - 1-phase methods
          - trust region method
          - damped method
    - Non-Linear Least Squares Problems
      - Basic Concepts
      - Gauss-Newton Method
      - Levenberg-Marquardt Method
      - Powell's Dog Leg Method

- Lect 6: Measurement Using a Single Camera

  - What is Camera Calibration?
  - Modeling for Image Pipeline
  - The General Framework for Camera Calibration
  - Initial Rough Estimation of Calibration Parameters
  - Nonlinear Least-squares
  - Bird's-eye-view Generation

- Lect 7: Basic for Machine Learning and A Special Emphasis on CNN

  - Basic concepts
    - A little history about AI
    - What is machine learning?
    - SUpervised vs Unsupervised
    - Training, testing, and validation
    - Overfitting, generalization, and capacity
    - Performance evaluation
    - Class-imbalance issue
  - Linear model
    - Linear regression
    - Logistic regression
    - Softmax regression
      - Cross Entropy
  - Neural network
  - Convolutional neural network(CNN)
  - Modern CNN architectures
  - DCNN for object detection
    - Background
    - R-CNN
    - Faster-RCNN
    - Yolo

- Lect 8: Applications of CNNs

  - Vision-based Parking-slot Detection
    - Background Introduction
    - General Flowchart
    - Surround-view Synthesis
    - Parking-slot Detection from Surround-view
    - Experiments
  - Human-body Keypoint Detection
    - Problem definition
    - OpenPose

- Lect 9: Introduction to Numerical Geometry

  - Introduction
  - Basic concepts in geometry
  - Discrete geometry
    - Metric for discrete geometry
    - Sampling
  - Rigid shape analysis
    - Euclidean isometries removal
    - ICP-based shape matching

  