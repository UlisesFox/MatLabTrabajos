clc;
close all;
clear;

Im=imread('Zorrocafe.jpg');
valor=[0.2989 0.5870 0.1140];
Im=(Im(:,:,1)*valor(1)+Im(:,:,2)*valor(2)+Im(:,:,3)*valor(3));
figure(1);
imshow(Im);
title("Original a escala de grises");

prewits(Im)
sobel(Im)
roberts(Im)
canny(Im)
