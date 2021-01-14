function h = gHistogram(image,canal)
  h = zeros(256,1);
  
  [filas,cols,canales]=size(image);
  
  aux=image(:,:,canal);
  
  for i = 0:255
    h(i+1) = sum(aux(:) == i);
  endfor
endfunction