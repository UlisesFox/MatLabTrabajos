clc;
close all;
clear;

Im=imread('images.jpg');
valor=[0.2989 0.5870 0.1140];
Ir=(Im(:,:,1)*valor(1)+Im(:,:,2)*valor(2)+Im(:,:,3)*valor(3));
figure(1);
imshow(Ir);
title("Original a escala de grises");

[m, n]=size(Ir);
U=zeros(size(Ir));
S=zeros(size(Ir));

h=ones(3,3)/9;
Id=double(Ir);
If=imfilter(Id,h);

Hx=[-0.5 0 0.5];
Hy=[-0.5;0;0.5];

Ix=imfilter(If,Hx);
Iy=imfilter(If,Hy);

HE11=Ix.*Ix;
HE22=Iy.*Iy;
HE12=Ix.*Iy;

Hg=[0 1 2 1 0; 1 3 5 3 1; 2 5 9 5 2; 1 3 5 3 1; 0 1 2 1 0];
Hg=Hg*(1/57);

A=imfilter(HE11,Hg);
B=imfilter(HE22,Hg);
C=imfilter(HE12,Hg);

alfa=0.04;
Rp=A+B;
Rp1=Rp.*Rp;

Q=((A.*B)-(C.*C))-(alfa*Rp1);
th=1000;
U=Q>th;
pixel=10;

for r=1:m
    for c=1:n
        if(U(r,c))
            I1=[r-pixel 1];
            I2=[r+pixel m];
            I3=[c-pixel 1];
            I4=[c+pixel n];
            datxi=max(I1);
            datxs=min(I2);
            datyi=max(I3);
            datys=min(I4);
            Bloc=Q(datxi:1:datxs,datyi:1:datys);
            MaxB=max(max(Bloc));
            if(Q(r,c)==MaxB)
                S(r,c)=1;
            end
        end
    end
end

figure(2);
imshow(Ir);
title("Imagen con esquinas detectadas");
hold on

for r=1:m
    for c=1:n
        if(S(r,c))
            plot(c,r,'+');
        end
    end
end