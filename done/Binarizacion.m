function [bwImage,tam] = Binarizacion(image, threshold)

[filas columnas] = size(image);

bwImage = zeros(filas, columnas);

acum = 0;

for i=1:filas

 for j=1:columnas

   %Hemos calculado un umbral y descartamos todo lo que quede por debajo
   %Los valores que estan por encima los ponemos en blanco
   if(image(i,j) < threshold)

   bwImage(i,j) = 255;
   acum = acum + 1;  %Contamos los pixeles por debajo del threshold

  endif

 endfor  

endfor

tam = acum; %Obtenemos el tamaño de la imagen binarizada

end