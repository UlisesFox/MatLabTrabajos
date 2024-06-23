function erocion = erocion(Im, num)
    se1 = [1 1 0; 0 1 0; 0 1 0];
    
    [x, y] = size(Im);
    J2 = zeros(x, y);
    
    tamano = size(se1, 1);
    tamano2 = floor(tamano / 2);
    
    for n = 1:num
        img = padarray(Im, [tamano2 tamano2], Inf, 'both');
        J2 = zeros(x, y);
    
        for i = 1:x
            for j = 1:y
                neighborhood = img(i:i+tamano-1, j:j+tamano-1);
                J2(i, j) = min(neighborhood(se1 == 1));
            end
        end
    end
    
    J2 = cast(J2, class(Im));
    
    figure(3);
    imshow(J2);
    title(['Imagen Erocionada - Iteraciones: ', num2str(num)]);
end