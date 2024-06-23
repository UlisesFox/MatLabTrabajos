function dilatacion = dilatacion(Im, num)
    se1 = [0 0 0; 0 1 0; 0 1 0];

    [x, y] = size(Im);
    J1 = Im;

    tamano = size(se1, 1);
    tamano2 = floor(tamano / 2);

    for n = 1:num
        img = padarray(J1, [tamano2 tamano2], 0, 'both');
        J1 = zeros(x, y);
        
        for i = 1:x
            for j = 1:y
                neighborhood = img(i:i+tamano-1, j:j+tamano-1);
                J1(i, j) = max(neighborhood(se1 == 1));
            end
        end
    end

    J1 = cast(J1, class(Im));

    figure(2);
    imshow(J1);
    title(['Imagen Dilatada - Iteraciones: ', num2str(num)]);
end