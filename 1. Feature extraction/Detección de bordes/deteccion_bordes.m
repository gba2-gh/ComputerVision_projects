%cd 'C:\Users\gba2\Desktop\MCC 2022-I\Visi�n Computacional\photos'
close all; 
clc;
input = imread('metro.tif');

umbral_c = 0.12;

gray = rgb2gray(input);
borde_canny = edge(gray, 'canny', umbral_c);
borde_sobel = edge(gray, 'sobel');

figure;
imshow(borde_canny)
title('M�todo Canny. Detecci�n de bordes.');

figure;
imshow(borde_sobel)
title('M�todo Sobel. Detecci�n de bordes ');

figure;
montage({input, gray})



