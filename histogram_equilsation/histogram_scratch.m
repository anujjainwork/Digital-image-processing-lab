clc
close all

% Step 1: Load the image
image = imread('/MATLAB Drive/LAB_2/cat.jpg');
if size(image, 3) == 3
    image = rgb2gray(image); % Convert to grayscale if it's an RGB image
end

% Step 2: Initialize histogram array
histogram = zeros(1, 256); % 256 bins for grayscale values [0-255]

% Step 3: Compute histogram manually
[rows, cols] = size(image);
for i = 1:rows
    for j = 1:cols
        intensity = image(i, j); % Get pixel intensity
        histogram(intensity + 1) = histogram(intensity + 1) + 1; % Update bin count
    end
end



% Step 4: Plot the histogram
figure;
bar(0:255, histogram, 'BarWidth', 1, 'FaceColor', 'b'); % Display as a bar graph
xlabel('Pixel Intensity');
ylabel('Frequency');
title('Histogram of the Image');