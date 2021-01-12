function [R, G, B] = Canales(IN)
  [filas, cols, canal] = size(IN);
  
  R=IN; G=IN; B=IN;
  R(:, :, 2:3) = 0;
  G(:, :, [1 3]) = 0;
  B(:, :, 1:2) = 0;
  
endfunction
