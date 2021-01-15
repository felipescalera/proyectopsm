function bwImage = filtraGrises(image, threshold)

[filas columnas] = size(image);

bwImage = zeros(filas, columnas);


for i=1:filas

 for j=1:columnas

   if(image(i,j) > threshold)

   bwImage(i,j) = 255;
   
   else
   bwImage(i,j) = 0;
endif
   

 endfor  

endfor

end