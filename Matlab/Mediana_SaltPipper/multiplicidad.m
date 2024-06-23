function imagenf=multiplicidad(Imagen)
 imgr=double(Imagen);
 [x, y]=size(imgr);
 imagenf=zeros(x, y);
 matriz2=[1, 3, 2; 2, 4, 1; 1, 2, 1];

    for r=2:x-1
        for c=2:y-1
            subi=[imgr(r-1,c-1),imgr(r-1,c),imgr(r-1,c+1);imgr(r,c-1), imgr(r,c),imgr(r,c+1);imgr(r+1,c-1),imgr(r+1,c),imgr(r+1,c+1)];
            matriz1=[];
            [n, m]=size(subi);
            for i=1:n
                for j=1:m
                    matriz1=[matriz1,repmat(subi(i,j),1,matriz2(i,j))];
                end
            end
            for i=1:length(matriz1)
                for j=1:length(matriz1)-i
                    if matriz1(j)>matriz1(j+1)
                    temp=matriz1(j);
                    matriz1(j)=matriz1(j+1);
                    matriz1(j+1)=temp;
                    end
                end
            end
            tam = (length(matriz1) + 1) / 2;
            imagenf(r, c) = matriz1(tam);
        end
    end
 imagenf = uint8(imagenf);
end
