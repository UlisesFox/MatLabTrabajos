clc;
close all;
clear;

ImagenHisto=imread('ciervobosque.jpg');
figure(1);
imshow(ImagenHisto);

valor=[0.2989 0.5870 0.1140];
ImagenHisto=(ImagenHisto(:,:,1)*valor(1)+ImagenHisto(:,:,2)*valor(2)+ImagenHisto(:,:,3)*valor(3));
figure(2);
imshow(ImagenHisto);

ImagenHistoblanco=ImagenHisto * 1.5;
figure(3);
imshow(ImagenHistoblanco);

ImagenHistomuyblanco=(ImagenHisto * 1.5) + 100;
figure(4);
imshow(ImagenHistomuyblanco);

figure(5);
histogram=histogram(ImagenHistomuyblanco);

figure(6);
histogram2=stem(ImagenHistomuyblanco);


