function histograma = calculaPerimetro(image)
  histograma = gHistogram(image,1);
  perimetro = histograma(256);
endfunction