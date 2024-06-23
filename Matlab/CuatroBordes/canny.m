function [Im_bordes] = canny (Im_original)

Im_mues=Im_original(1:1:end,1:1:end);
Im_mues=double(Im_mues);

H = fspecial('gaussian',[5 5],1.4);
filtro = imfilter(Im_mues, H);
figure(11);
imshow(mat2gray(filtro));
title("Original suavizado");

Hx=[-1 0 1; -2 0 2; -1 0 1];
Hy=[-1 -2 -1 ; 0 0 0; 1 2 1];

Gx=abs(imfilter(Im_mues,Hx));
Gy=abs(imfilter(Im_mues,Hy));

Im=sqrt(Gx.^2 + Gy.^2);
teta=atand(Gy./ Gx);

in = teta>=0 & teta<22.5;
teta(in)= 0 ;
in = teta>=157.5 & teta<=180;
teta(in) = 0;
in = teta>=22.5 & teta<67.5;
teta(in) = 45;
in = teta>=67.5 & teta<112.5;
teta(in) = 90;
in = teta>=112.5 & teta<157.5;
teta(in) = 135;

[M N]=size(Im);
In=zeros(M-2,N-2);
for i=2:M-1
    for j=2:N-1
        switch(teta(i,j))
            case 0 
                [~,m]=max([Im(i,j-1) Im(i,j) Im(i,j+1)]);
                if (m==2) 
                In(i-1,j-1)=Im(i,j);
                end
            case 45
                [~,m]=max([Im(i+1,j-1) Im(i,j) Im(i-1,j+1)]);
                if (m==2)
                In(i-1,j-1)=Im(i,j);
                end
            case 90
                [~,m]=max([Im(i-1,j) Im(i,j) Im(i+1,j)]);
                if (m==2)
                In(i-1,j-1)=Im(i,j);
                end
            case 135
                [~,m]=max([Im(i-1,j-1) Im(i,j) Im(i+1,j+1)]);
                if (m==2)
                In(i-1,j-1)=Im(i,j);
                end
        end
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

figure(12);
imshow(mat2gray(In));
title("Bordes CANNY");

figure(13);
imshow(GxN);
title("Normalizado Gradiente X");

figure(14);
imshow(GyN);
title("Normalizado Gradiente Y");
end