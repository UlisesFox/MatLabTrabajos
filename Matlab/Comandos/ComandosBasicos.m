clc;
close all;
clear;
Imagen=imread('Zorrocafe.jpg');
figure(1);
imshow(Imagen);
%Im_R=Imagen(:,:,1);
%Im_G=Imagen(:,:,2);
%Im_B=Imagen(:,:,3);
%[m,n,p]=size(Imagen);
%imwrite(Imagen,'pruebadeZorrocafe.jpg');
%pixel=impixel;
%Imagen(200,750,1)=1;
%Imagen(200,750,2)=1;
%Imagen(200,750,3)=1;
%improfile
%a=2
%Imagen=Imagen(1:a:end,1:a:end,1:1:end);
%Im_double=double(Imagen);
%Im_double=Im_double*0.50;
%Imagen=uint8(Im_double);
%Imagen=rgb2gray(Imagen);
[m,n,p]=size(Imagen);
%for i=1: m
%    for j=1: n
%        x=(Imagen(i,j)*0.299+Imagen(i,j)*0.587+Imagen(i,j)*0.114);
%        Imagen(i,j,1)=x;
%        Imagen(i,j,2)=x;
%        Imagen(i,j,3)=x;
%    end
%end
valor=[0.2989 0.5870 0.1140];
Imagen=(Imagen(:,:,1)*valor(1)+Imagen(:,:,2)*valor(2)+Imagen(:,:,3)*valor(3));
figure(2);
imshow(Imagen);
for i=1: m
    for j=1: n
        if Imagen(i,j)<=128
            Imagen(i,j)=0;
        else
            Imagen(i,j)=255;
        end
    end
end
figure(3);
imshow(Imagen);