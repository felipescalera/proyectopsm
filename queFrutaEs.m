%% Función para sacar qué fruta es, pasando como entrada un histograma

function tipoFruta = queFrutaEs(hh)
  
  % Calcular el número de pixeles de color de la foto
  pixelesColor = 0;
  for i = 0:359
    pixelesColor = pixelesColor + hh(i+1);
  endfor
  
  
  % Declaramos los rangos de color
  [M,I] = max(hh); %[nº apariciones color mas presente, su indice]
  
  azul = 0; %arandano -> I=221, minimo=0.15552
  rojoOscuro = 0; %cereza -> I=349, minimo=0.04734
  rojoClaro = 0; %fresa -> I=1, minimo=0.083646
endfunction
