% Bits plane slicing after converting an image to grayscale
% by Anuj Jain
% Roll no BT22ECI010

clc;
clear;
close all;

% Specify the image path (hardcoded)
imagePath = '/MATLAB Drive/bmw_m5.jpg'; % Replace with your image file path

% Read the grayscale image
grayImage = imread(imagePath);

% Check if the image is already grayscale
if size(grayImage, 3) == 3
    grayImage = rgb2gray(grayImage); % Convert to grayscale if needed
end

% Get the image size
[rows, cols] = size(grayImage);

% Create a folder to save the bit-plane images
outputFolder = 'BitPlaneOutputs';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Display the original grayscale image
figure;
subplot(3, 3, 1);
imshow(grayImage, []);
title('Original Grayscale Image');

% Save the original grayscale image
imwrite(grayImage, fullfile(outputFolder, 'Original_Grayscale_Image.png'));

% Loop through each bit plane and display them
for bp = 0:7
    % Extract the specific bit plane
    bitPlaneImage = bitget(grayImage, bp + 1);
    
    % Save the bit plane image
    outputFileName = fullfile(outputFolder, sprintf('BitPlane_%d.png', bp));
    imwrite(logical(bitPlaneImage), outputFileName);
    
    % Display the bit plane
    subplot(3, 3, bp + 2); % Position the subplot
    imshow(logical(bitPlaneImage)); % Show as logical (binary image)
    title(['Bit Plane ', num2str(bp)]);
end

% Maximize the figure window
set(gcf, 'Position', get(0, 'Screensize'));

% Save the full figure
saveas(gcf, fullfile(outputFolder, 'BitPlane_Slicing_Results.png'));

disp(['Bit-plane slicing completed. Output saved in folder: ', outputFolder]);
