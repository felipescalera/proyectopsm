function [bwImage,tam] = Binarizacion(image, threshold)

[filas columnas] = size(image);

bwImage = zeros(filas, columnas);

acum = 0;

for i=1:filas

 for j=1:columnas

   if(image(i,j) < threshold)

   bwImage(i,j) = 255;
   acum = acum + 1;

  endif

   

 endfor  

endfor

[filas, cols, canales]=size(image);
tam = filas*cols-acum; %%comentar%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end