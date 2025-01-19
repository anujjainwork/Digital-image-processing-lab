clc
close all

% Step 1: Load the image
image = imread('/MATLAB Drive/histogram_equilsation/bmw_m5.jpg');
if size(image, 3) == 3
    disp('image is rgb --> converting to grayscale');
    image = rgb2gray(image);
end

% Step 2: Initialize histogram array
histogram = zeros(1, 256); % 256 bins for grayscale values [0-255]

% Step 3: Compute histogram manually
[rows, cols] = size(image);
for ii = 1:rows
    for jj = 1:cols
        intensity = image(ii, jj);
        histogram(intensity + 1) = histogram(intensity + 1) + 1; % Update bin count
    end
end

% Step 4: Compute the CDF
cdf = cumsum(histogram);
cdf_min = min(cdf);
cdf_max = max(cdf);

% Step 5: Normalize the CDF
h_v = round((cdf - cdf_min) / (cdf_max - cdf_min) * 255);

% Step 6: Map the pixel intensities using the normalized CDF
equalized_image = zeros(size(image), 'uint8');
for ii = 1:rows
    for jj = 1:cols
        intensity = image(ii, jj);
        equalized_image(ii, jj) = h_v(intensity + 1);
    end
end

% Step 7: Display the results
figure;

% Original Image
subplot(2, 2, 1);
imshow(image);
title('Original Image');

% Histogram of Original Image
subplot(2, 2, 2);
bar(0:255, histogram, 'BarWidth', 1, 'FaceColor', 'b');
hold on;

% Normalize the CDF to match the histogram's scale
normalized_cdf = cdf / max(cdf) * max(histogram);

% Plot the normalized CDF
plot(0:255, normalized_cdf, 'r', 'LineWidth', 1.5);
hold off;
xlabel('Pixel Intensity');
ylabel('Frequency');
title('Histogram of Original Image');


% Equalized Image
subplot(2, 2, 3);
imshow(equalized_image);
title('Equalized Image');

% Histogram of Equalized Image
subplot(2, 2, 4);
imhist(equalized_image);
title('Histogram of Equalized Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

saveas(gcf, 'results/histogram_equalization_results.png');