clc;
close all;
clear;

Im=imread('ciervobosque.jpg');
figure(1);
imshow(Im)

Im=rgb2gray(Im);
[fil,col]=size(Im);
pixmax=256;
tam=zeros(pixmax);
figure(2);
imshow(Im);

%histograma de imagen original
for rxp = 1:fil
    for ryp = 1:col
        rxyp = Im(rxp,ryp);
            for val = 1:pixmax
                if rxyp==val
                    tam(val)=tam(val)+1;
                end
            end
    end
end
figure(3);
stem(tam);
figure(4);
imshow(Im);

%histograma acumuloativo
H=[1:256];
Vo=0;
    for ru = 1:256
        H(ru)=Vo+tam(ru);
        Vo=H(ru);
    end

figure(6)
stem(H)
figure(7);
imshow(Im);

%histrograma lineal (ecualizado)
Inh=[1:256];
    for rxs = 1:fil
        for rys = 1:col
            ac=Im(rxs,rys);
            if ac==val
                Inh(rxs,rys)=tam(ac+1)*255/(fil*col);
            end
        end
    end
figure(8)
stem(Inh)
figure(9);
imshow(Im);
