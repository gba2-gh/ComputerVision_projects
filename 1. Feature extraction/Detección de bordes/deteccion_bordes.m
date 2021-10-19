%cd 'C:\Users\gba2\Desktop\MCC 2022-I\Visión Computacional\photos'
close all; 
clc;
input = imread('metro.tif');

umbral_c = 0.12;

gray = rgb2gray(input);
borde_canny = edge(gray, 'canny', umbral_c);
borde_sobel = edge(gray, 'sobel');

figure;
imshow(borde_canny)
title('Método Canny. Detección de bordes.');

figure;
imshow(borde_sobel)
title('Método Sobel. Detección de bordes ');

figure;
montage({input, gray})



