function out = imBorder(image);



%Máscaras de Sobel para la estimación del gradiente

SobelGx = [-1 -2 -1; 0 0 0; 1 2 1];

SobelGy = [-1 0 1; -2 0 2; -1 0 1];





Gx = imConvolve(image,SobelGx); %Calcular el gradiente horizontal

Gy = imConvolve(image,SobelGy); %Calcular el gradiente vertical



ModGradiente = sqrt(Gx.^2 + Gy.^2); %Módulo del gradiente

out = imRemap(ModGradiente); %Reajustar


endfunction

function out = imRemap(image)



maxval = max(max(image));

minval = min(min(image));



image = (image - minval)*255/(maxval-minval);

out = uint8(image);

endfunction
%Function imConvolve

% Image(n, m) imagen monocromática

% Mask(n, m) matriz con los valores de la máscara

% R(n,m)	- Imagen resultante





##IN = imread('eye.jpg'); %modificar por el alumno

##[filas, cols, canales] = size(IN);

##mask = [1 1 1; 1 1 1; 1 1 1]/9;

##

##imagen = single(IN);

##mask = single(mask);



function R = imConvolve(imagen, mask)



imagen = single(imagen);

mask = single(mask);



[filas, cols] = size(imagen);

[fmask, colmask] = size(mask);





R = zeros(filas, cols, "single");





incrf = fix(fmask/2); % Redondea al entero mas cercano a cero

incrc = fix(colmask/2);



imax = filas - fmask+1;

jmax = cols - colmask+1;



for i=1:imax

 for j=1:jmax

   value = imagen(i:(i+fmask-1),j:(j+colmask-1)).*mask;

   R(i+incrf, j+incrc) = sum(sum(value));

 end

end

endfunction
