function sumaBlanco = calculaPerimetro(image)
  histograma = gHistogram(image,1);
 
  sumaBlanco = 0;
  for i = 1:255
    sumaBlanco = sumaBlanco + histograma(i+1);
  endfor
    
endfunction