clc;
close all;
clear;

Im=imread('Zorrocafe.jpg');

valor=[0.2989 0.5870 0.1140];
Im=(Im(:,:,1)*valor(1)+Im(:,:,2)*valor(2)+Im(:,:,3)*valor(3));
[m,n]=size(Im);

for i=1: m
    for j=1: n
        if Im(i,j)<=100
            Im(i,j)=0;
        else
            Im(i,j)=255;
        end
    end
end

figure(1);
imshow(Im);
title("Original binarizada");

prompt = {'¿Cuántas veces quieres hacer la repeticion?'};
    titulo = 'Número';
    tam = [1 35];
    def = {'1'};
    res = inputdlg(prompt, titulo, tam, def);
    num = str2double(res{1});

dilatacion(Im, num)
erocion(Im, num)