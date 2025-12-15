function hybrid_fun = fitSpringHybridModel(T, polyDegree, slopeStdThreshold)
% fitSpringHybridModel - Fits a hybrid polynomial-linear model to spring data
%
% Syntax:
%   hybrid_fun = fitSpringHybridModel(T, polyDegree, slopeStdThreshold)
%
% Inputs:
%   T - A table with two columns: T.x (displacement), T.y (force)
%   polyDegree - Degree of polynomial to fit the nonlinear region (default: 3)
%   slopeStdThreshold - Threshold for std of slope to detect linearity (default: 0.05)
%
% Output:
%   hybrid_fun - A function handle that evaluates the hybrid model

    if nargin < 2
        polyDegree = 3;
    end
    if nargin < 3
        slopeStdThreshold = 0.05;
    end

    x = T.x(:);
    y = T.y(:);

    % Step 1: Compute slope (dy/dx)
    dy = diff(y);
    dx = diff(x);
    slope = dy ./ dx;
    x_mid = x(1:end-1) + dx/2;

    % Step 2: Smooth slope
    slope_smoothed = movmean(slope, 5);

    % Step 3: Detect linear region
    window = 10;
    idx_linear_start = length(slope_smoothed); % fallback in case threshold isn't met
    for i = 1:(length(slope_smoothed) - window)
        window_std = std(slope_smoothed(i:i+window));
        if window_std < slopeStdThreshold
            idx_linear_start = i + window;
            break
        end
    end

    % Get x1, y1, and average slope m
    x1 = x_mid(idx_linear_start);
    y1 = interp1(x, y, x1);
    m = mean(slope_smoothed(idx_linear
