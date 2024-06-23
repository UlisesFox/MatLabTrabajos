clc;
close all;
clear;

Im = imread('figuras.jpg');
Im = rgb2gray(Im);

Im = imbinarize(Im);
figure(1);
imshow(Im);
title('Imagen Binarizada')

[m, n] = size(Im);
Imd = double(Im);

e = 2;
k = 1;
ec1 = [];
ec2 = [];

for r = 2:m
    for c = 2:n
        if Imd(r, c) == 1
            if Imd(r, c-1) == 0 && Imd(r-1, c) == 0
                Imd(r, c) = e;
                e = e + 1;
            elseif (Imd(r, c-1) > 1 && Imd(r-1, c) < 2) || (Imd(r, c-1) < 2 && Imd(r-1, c) > 1)
                if Imd(r, c-1) > 1
                    Imd(r, c) = Imd(r, c-1);
                else
                    Imd(r, c) = Imd(r-1, c);
                end
            elseif Imd(r, c-1) > 1 && Imd(r-1, c) > 1
                Imd(r, c) = Imd(r-1, c);
                if Imd(r, c-1) ~= Imd(r-1, c)
                    ec1(k) = Imd(r-1, c);
                    ec2(k) = Imd(r, c-1);
                    k = k + 1;
                end
            end
        end
    end
end

for ind = 1:k-1
    if ec1(ind) <= ec2(ind)
        Imd(Imd == ec2(ind)) = ec1(ind);
    else
        Imd(Imd == ec1(ind)) = ec2(ind);
    end
end

w = unique(Imd);
t = length(w);

for ix = 2:t
    Imd(Imd == w(ix)) = ix - 1;
end

E = mat2gray(Imd);
figure(2);
imshow(E);
title('Imagen Binarizada Procesada')