clc;
close all;
clear;

Imagen=imread('Zorrocafe.jpg');
figure(1);
imshow(Imagen);
title("Original");

valor=[0.2989 0.5870 0.1140];
Imagen1=(Imagen(:,:,1)*valor(1)+Imagen(:,:,2)*valor(2)+Imagen(:,:,3)*valor(3));
figure(2);
imshow(Imagen1);
title("Escala de grises");

Imagen1=double(Imagen1);
[x,y]=size(Imagen1);

imgr=Imagen1;
    for r=2:x-1
        for c=2:y-1
            imgr(r,c)=1/9*(Imagen1(r-1,c-1)+Imagen1(r-1,c)+Imagen1(r-1,c+1)...
                +Imagen1(r,c-1)+Imagen1(r,c)+Imagen1(r,c+1)+Imagen1(r+1,c-1)...
                +Imagen1(r+1,c)+Imagen1(r+1,c+1));
        end
    end

imgr=uint8(imgr);
figure(3);
imshow(imgr);
title("Suavizado lineal");


imgr=Imagen1;
    for r=2:x-1
        for c=2:y-1
            imgr(r,c)=1/25*((1*Imagen1(r-1,c-1))+(1*Imagen1(r-1,c))...
                +(1*Imagen1(r-1,c+1))+(1*Imagen1(r,c-1))+(1*Imagen1(r,c))...
                +(1*Imagen1(r,c+1))+(1*Imagen1(r+1,c-1))+(1*Imagen1(r+1,c))...
                +(1*Imagen1(r+1,c+1)));
        end
    end

imgr = uint8(imgr);
figure(4);
imshow(imgr);
title("Suavizado Box");


imgr=Imagen1;
    for r=3:x-2
        for c=3:y-2
            imgr(r,c)=1/57*((1*Imagen1(r-2,c-1))+(2*Imagen1(r-2,c))...
                +(1*Imagen1(r-2,c+1))+(1*Imagen1(r-1,c-2))...
                +(3*Imagen1(r-1,c-1))+(5*Imagen1(r-1,c))...
                +(3*Imagen1(r-1,c+1))+(1*Imagen1(r-1,c+2))...
                +(2*Imagen1(r,c-2))+(5*Imagen1(r,c-1))+(9*Imagen1(r,c))...
                +(5*Imagen1(r,c+1))+(2*Imagen1(r,c+2))+(1*Imagen1(r+1,c-2))...
                +(3*Imagen1(r+1,c-1))+(5*Imagen1(r+1,c))...
                +(3*Imagen1(r+1,c+1))+(1*Imagen1(r+1,c+2))...
                +(1*Imagen1(r+2,c-1))+(2*Imagen1(r+2,c))+(1*Imagen1(r+2,c+1)));
        end
    end

imgr=uint8(imgr);
figure(5);
imshow(imgr);
title("Filtro Gauss");


imgr=Imagen1;
    for r=3:x-2
        for c=3:y-2
            imgr(r,c)=((-1*Imagen1(r-2,c))+(-1*Imagen1(r-1,c-1))...
                +(-2*Imagen1(r-1,c))+(-1*Imagen1(r-1,c+1))...
                +(-1*Imagen1(r,c-2))+(-2*Imagen1(r,c-1))+(16*Imagen1(r,c))...
                +(-2*Imagen1(r,c+1))+(-1*Imagen1(r,c+2))+(-1*Imagen1(r+1,c-1))...
                +(-2*Imagen1(r+1,c))+(-1*Imagen1(r+1,c+1))+(-1*Imagen1(r+2,c)));
        end
    end


imgr = uint8(imgr);
figure(6);
imshow(imgr);
title("Fitro Laplace");