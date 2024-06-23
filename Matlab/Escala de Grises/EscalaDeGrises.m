clc;
close all;
clear;

Imagen=imread('Zorrocafe.jpg');
figure(1);
imshow(Imagen); %Imagen original

[m,n,p]=size(Imagen);
for i=1: m
    for j=1: n
        x=(Imagen(i,j)*0.299+Imagen(i,j)*0.587+Imagen(i,j)*0.114);
        Imagen(i,j,1)=x;
        Imagen(i,j,2)=x;
        Imagen(i,j,3)=x;
    end
end
figure(2);
imshow(Imagen); %imagen a escala de grises

valor=[0.2989 0.5870 0.1140];
Imagen=(Imagen(:,:,1)*valor(1)+Imagen(:,:,2)*valor(2)+Imagen(:,:,3)*valor(3));
figure(3);
imshow(Imagen); %Imagen a escala de grises

for i=1: m
    for j=1: n
        if Imagen(i,j)<=100
            Imagen(i,j)=0;
        else
            Imagen(i,j)=255;
        end
    end
end
figure(4);
imshow(Imagen); %Imagen a blanco y negro