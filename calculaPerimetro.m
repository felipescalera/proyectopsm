function sumaBlanco = calculaPerimetro(image)
  %Obtenemos el histograma de la imagen
  histograma = gHistogram(image,1);
 
  sumaBlanco = 0;
  %Sumamos los blancos y grises de la imagen para sacar el perimetro
  for i = 1:255
    sumaBlanco = sumaBlanco + histograma(i+1);
  endfor
    
endfunction