function ruido=ruido(Imagen,por)
    [m,n]=size(Imagen);
    ruido=Imagen;

    pix=round(por*m*n);

    indices=randperm(m*n);

    for i=1:pix
        in=indices(i);
        fila=floor((in-1)/n)+1;
        columna=mod(in-1,n)+1;

        if rand()<0.5
            ruido(fila,columna)=255;
        else
            ruido(fila,columna)=0;
        end
    end
end
