clc;
close all;

% Read the image
I = imread('/MATLAB Drive/LAB_2/cat.jpg');

if size(I, 3) == 3
    I = rgb2gray(I);
end

equalized_image = histeq(I);

figure;
subplot(2, 2, 1);
imshow(I);
title('Original Image');

subplot(2, 2, 2);
imshow(equalized_image);
title('Equalized Image');

subplot(2, 2, 3);
imhist(I);
title('Original Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');

subplot(2, 2, 4);
imhist(equalized_image);
title('Equalized Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');