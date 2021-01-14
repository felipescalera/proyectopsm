%% Función para sacar qué fruta es, pasando como entrada un histograma

function tipoFruta = queFrutaEs(hh,IN)
  
  % Calcular el número de pixeles de color de la foto
  pixelesParaFresa = 0;
  pixelesParaNaranja = 0;
  pixelesParaCereza = 0;
  pixelesParaPlatano = 0;
  pixelesParaSandia = 0;
  pixelesParaLima = 0;
  pixelesParaArandanos = 0;
  
  suma = 0;
  for i = 0:359
    suma = suma + hh(i+1);
   
    if ((i >= 96) && (i <= 134)) || ((i >= 65) && (i <= 78))
      pixelesParaSandia = pixelesParaSandia + hh(i+1); 
    elseif (i >= 79) && (i <= 95)
      pixelesParaLima = pixelesParaLima + hh(i+1);
    elseif (i >= 0) && (i <= 15)
      pixelesParaFresa = pixelesParaFresa + hh(i+1);
    elseif (i >= 29) && (i <= 38)
      pixelesParaNaranja = pixelesParaNaranja + hh(i+1);
    elseif (i >= 39) && (i <= 46)
      pixelesParaPlatano = pixelesParaPlatano + hh(i+1);
    elseif (i >= 214) && (i <= 228)
      pixelesParaArandanos = pixelesParaArandanos + hh(i+1);
    elseif (i >= 345) && (i <= 357)
      pixelesParaCereza = pixelesParaCereza + hh(i+1);
    endif
      
  endfor
  
  porcentajeFresa = (pixelesParaFresa/suma)*100;
  porcentajeNaranja = (pixelesParaNaranja/suma)*100;
  porcentajeCereza = (pixelesParaCereza/suma)*100;
  porcentajePlatano = (pixelesParaPlatano/suma)*100;
  porcentajeSandia = (pixelesParaSandia/suma)*100;
  porcentajeLima = (pixelesParaLima/suma)*100;
  porcentajeArandanos = (pixelesParaArandanos/suma)*100;
  
##    if (porcentajeFresa)
##      pixelesParaSandia = pixelesParaSandia + hh(i+1); 
##    elseif (porcentajeNaranja)
##      pixelesParaLima = pixelesParaLima + hh(i+1);
##    elseif (porcentajeCereza)
##      pixelesParaFresa = pixelesParaFresa + hh(i+1);
##    elseif (porcentajePlatano)
##      pixelesParaNaranja = pixelesParaNaranja + hh(i+1);
##    elseif (porcentajeSandia)
##      pixelesParaPlatano = pixelesParaPlatano + hh(i+1);
##    elseif (porcentajeLima)
##      pixelesParaArandanos = pixelesParaArandanos + hh(i+1);
##    elseif (porcentajeArandanos)
##      pixelesParaCereza = pixelesParaCereza + hh(i+1);
##    endif
  
  
  
  
  % Declaramos los rangos de color
  %[M,I] = max(hh); %[nº apariciones color mas presente, su indice]
  
  %azul = 0; %arandano -> I=221, minimo=0.15552
  %rojoOscuro = 0; %cereza -> I=349, minimo=0.04734
  %rojoClaro = 0; %fresa -> I=1, minimo=0.083646
endfunction
