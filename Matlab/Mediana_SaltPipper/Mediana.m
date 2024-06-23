clc;
close all;
clear;

Imagen=imread('ChibiDino.jpg');
valor=[0.2989 0.5870 0.1140];
Imagen=(Imagen(:,:,1)*valor(1)+Imagen(:,:,2)*valor(2)+Imagen(:,:,3)*valor(3));
figure(1);
imshow(Imagen);
title("Original a escala de grises");


por = 0.02;
ruidos = ruido(Imagen, por);
figure(2);
imshow(ruidos);
title("Imagen con ruido");

tam = 3;
filtra = filtro(ruidos, tam);
figure(3);
imshow(uint8(filtra)); 
title('Imagen filtrada mediana');

filtra2 = multiplicidad(ruidos);
figure(4);
imshow(filtra2); 
title('Imagen filtrada multiplicidad');