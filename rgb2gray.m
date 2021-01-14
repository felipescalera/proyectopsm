function gray = rgb2gray(image)
  image = single(image);
  gray = uint8( 0.299*image(:,:,1) + 0.587 * image(:,:,2) + 0.114 * image(:,:,3));
  % Multiplicar cada canal por los valores dados
endfunction
