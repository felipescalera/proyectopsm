function h = gHistogram(image,canal)  
  %Creamos el histograma para los grises
  h = zeros(256,1);
  
  [filas,cols,canales]=size(image);
  
  aux=image(:,:,canal);
  
  for i = 0:255  %Calculamos la suma de pixeles por valor
    h(i+1) = sum(aux(:) == i);  
  endfor
endfunction