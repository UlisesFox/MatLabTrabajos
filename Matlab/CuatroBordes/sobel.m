function sobel=sobel(Im)
[m,n]=size(Im);
Im=double(Im)
Gx=zeros(size(Im))
Gy=zeros(size(Im))

%aplica filtro

for r=2 : m-1
    for c=2:n-1
        Gx(r,c)=-1*Im(r-1,c-1)-2*Im(r-1,c)-1*Im(r-1,c+1)...
            +1*Im(r+1,c-1)+2*Im(r+1,c)+1*Im(r+1,c+1);
        Gy(r,c)=-1*Im(r-1,c-1)+1*Im(r-1,c+1)-2*Im(r,c-1)...
           +2*Im(r,c+1)-1*Im(r+1,c-1)+1*Im(r+1,c+1);
    end
end

GT=sqrt(Gx.^2+Gy.^2);
%optener valor maximo del gradiente
VmaxGT=max(max(GT));
%se normaliza el gradiente
GTN=(GT/VmaxGT)*255;
GNT=uint8(GTN);
%se binariz
B=GTN>100;
%obtenemos valores minimos de los gradientes
VminGx=min(min(Gx));
VminGy=min(min(Gy));
%utiliza los minimos desplaza para evitar negativas
GradoOffx=Gx-VminGx;
GradoOffy=Gy-VminGy;
%se obtiene los valores maximos para GX y GY
VmaxGx=max(max(GradoOffx));
VmaxGy=max(max(GradoOffy));
%se normaliza los gradientes
GxN=(GradoOffx/VmaxGx)*255;
GyN=(GradoOffy/VmaxGy)*255;
GxN=uint8(GxN);
GyN=uint8(GyN);

figure(5);
imshow(GNT);
title("Bordes SOBEL");

figure(6);
imshow(GxN);
title("Normalizado Gradiente X");

figure(7);
imshow(GyN);
title("Normalizado Gradiente Y");
end

