clc
clear all
close all

%%Leer imagten de entrada
input=imread('triangle.jpg');
%%Pasar entrada a escala de grises
image_i = rgb2gray(input);
image_i= im2double(image_i);

image_rot = imrotate(image_i, 180);

figure
imshow(image_i); title('Imagen');

% figure
% imshow(image_rot); title('Imagen Rotada');

%%imagena a procesar
image=image_i;


%%Calcular los momentos centrales necesarios para las ecuaciones de Hu
mu_11 = momento_central(image ,1,1);
mu_20 = momento_central(image ,2,0);
mu_02 = momento_central(image ,0,2);
mu_21 = momento_central(image ,2,1);
mu_12 = momento_central(image ,1,2);
mu_03 = momento_central(image ,0,3);
mu_30 = momento_central(image ,3,0);

%Calcular resultado de las Ecuaciones de Hu 
h_1 = mu_20 + mu_02;
h_2 = (mu_20 - mu_02)^2 + 4*(mu_11)^2;
h_3 = (mu_30 - 3*mu_12)^2 + (3*mu_21 - mu_03)^2;
h_4 = (mu_30 + mu_12)^2 + (mu_21 + mu_03)^2;
h_5 = (mu_30 - 3*mu_12)*(mu_30 + mu_12)*((mu_30 + mu_12)^2 - 3*(mu_21 + mu_03)^2) + (3*mu_21 - mu_03)*(mu_21 + mu_03)*(3*(mu_30 + mu_12)^2 - (mu_21 + mu_03)^2);
h_6 = (mu_20 - mu_02)*((mu_30 + mu_12)^2 - (mu_21 + mu_03)^2) + 4*mu_11*(mu_30 + mu_12)*(mu_21 + mu_03);
h_7 = (3*mu_21 - mu_03)*(mu_30 + mu_12)*((mu_30 + mu_12)^2 - 3*(mu_21 + mu_03)^2) + (mu_30 - 3*mu_12)*(mu_21 + mu_03)*(3*(mu_30 + mu_12)^2 - (mu_03 + mu_21)^2);



momentos_hu = [h_1, h_2, h_3 , h_4, h_5, h_6, h_7]
momentos_hu_norm= -sign(momentos_hu).*(log10(abs(momentos_hu)))
        
        