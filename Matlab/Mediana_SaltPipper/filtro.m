function imagenf=filtro(Imagen,tam)
    [m,n]=size(Imagen);
    imagenf=zeros(m,n);

    win=floor(tam/2);

    pa=padarray(Imagen,[win, win],'symmetric');

    for i=1:m-1
        for j=1:n-1
            rows=i;
            rowe=i+2*win;
            cols=j;
            cole=j+2*win;

            winv=pa(rows:rowe,cols:cole);
            imagenf(i,j)=median(winv(:));
        end
    end
end
