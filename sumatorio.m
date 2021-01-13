function suma = sumatorio(hh)
  suma = 0;
  for i = 0:359
    suma = suma + hh(i+1);
  endfor
endfunction