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
  
  pixelesRojoClaro = 0;
  pixelesNaranjas = 0;
  pixelesAmarillos = 0;
  pixelesVerdes = 0;
  pixelesCyan = 0;
  pixelesAzulOscuro = 0;
  pixelesRosas = 0;
  pixelesRojoOscuro = 0;
  
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
    elseif (i >= 39) && (i <= 64)
      pixelesParaPlatano = pixelesParaPlatano + hh(i+1);
    elseif (i >= 214) && (i <= 228)
      pixelesParaArandanos = pixelesParaArandanos + hh(i+1);
    elseif (i >= 345) && (i <= 357)
      pixelesParaCereza = pixelesParaCereza + hh(i+1);
    endif
    
    if (i >= 0) && (i <= 15)
      pixelesRojoClaro = pixelesRojoClaro + hh(i+1); 
    elseif (i >= 16) && (i <= 38)
      pixelesNaranjas = pixelesNaranjas + hh(i+1);
    elseif (i >= 39) && (i <= 65)
      pixelesAmarillos = pixelesAmarillos + hh(i+1);
    elseif (i >= 66) && (i <= 150)
      pixelesVerdes = pixelesVerdes + hh(i+1);
    elseif (i >= 151) && (i <= 210)
      pixelesCyan = pixelesCyan + hh(i+1);
    elseif (i >= 211) && (i <= 250)
      pixelesAzulOscuro = pixelesAzulOscuro + hh(i+1);
    elseif (i >= 251) && (i <= 330)
      pixelesRosas = pixelesRosas + hh(i+1);
    elseif (i >= 331) && (i <= 359)
      pixelesRojoOscuro = pixelesRojoOscuro + hh(i+1);
    endif
      
  endfor
  
  porcentajeColorRojoClaro = (pixelesRojoClaro/suma)*100;
  porcentajeColorNaranja = (pixelesNaranjas/suma)*100;
  porcentajeColorAmarillo = (pixelesAmarillos/suma)*100;
  porcentajeColorVerde = (pixelesVerdes/suma)*100;
  porcentajeColorCyan = (pixelesCyan/suma)*100;
  porcentajeColorAzulOscuro = (pixelesAzulOscuro/suma)*100;
  porcentajeColorRosa = (pixelesRosas/suma)*100;
  porcentajeColorRojoOscuro = (pixelesRojoOscuro/suma)*100;
  colorFinal = 'Mezcla de frutas';
  
    if ((porcentajeColorRojoClaro >= 40) && (porcentajeColorNaranja < 10) 
      && (porcentajeColorAmarillo < 10) && (porcentajeColorVerde < 16) && (porcentajeColorCyan < 10)
      && (porcentajeColorAzulOscuro < 5) && (porcentajeColorRojoOscuro < 16) && (porcentajeColorRosa < 10))
      colorFinal = 'Rojo claro';
    elseif ((porcentajeColorRojoClaro < 5) && (porcentajeColorNaranja >= 60) 
      && (porcentajeColorAmarillo < 17) && (porcentajeColorVerde < 23) && (porcentajeColorCyan < 5)
      && (porcentajeColorAzulOscuro < 5) && (porcentajeColorRojoOscuro < 5) && (porcentajeColorRosa < 5))
      colorFinal = 'Naranja';
    elseif ((porcentajeColorRojoClaro < 5) && (porcentajeColorNaranja < 40) 
      && (porcentajeColorAmarillo >=52) && (porcentajeColorVerde < 5) && (porcentajeColorCyan < 5)
      && (porcentajeColorAzulOscuro < 5) && (porcentajeColorRojoOscuro < 5) && (porcentajeColorRosa < 5))
      colorFinal = 'Amarillo';
    elseif ((porcentajeColorRojoClaro < 5) && (porcentajeColorNaranja < 5) 
      && (porcentajeColorAmarillo < 10) && (porcentajeColorVerde >= 8) && (porcentajeColorCyan < 5)
      && (porcentajeColorAzulOscuro < 5) && (porcentajeColorRojoOscuro < 5) && (porcentajeColorRosa < 5))
      colorFinal = 'Verde';
    elseif ((porcentajeColorRojoClaro < 5) && (porcentajeColorNaranja < 5) 
      && (porcentajeColorAmarillo < 5) && (porcentajeColorVerde < 5) && (porcentajeColorCyan >= 60)
      && (porcentajeColorAzulOscuro < 5) && (porcentajeColorRojoOscuro < 5) && (porcentajeColorRosa < 5))
      colorFinal = 'Cyan';
    elseif ((porcentajeColorRojoClaro < 5) && (porcentajeColorNaranja < 5) 
      && (porcentajeColorAmarillo < 5) && (porcentajeColorVerde < 5) && (porcentajeColorCyan < 5)
      && (porcentajeColorAzulOscuro >= 80) && (porcentajeColorRojoOscuro < 5) && (porcentajeColorRosa < 10))
      colorFinal = 'Azul oscuro';
    elseif ((porcentajeColorRojoClaro < 5) && (porcentajeColorNaranja < 5) 
      && (porcentajeColorAmarillo < 5) && (porcentajeColorVerde < 5) && (porcentajeColorCyan < 5)
      && (porcentajeColorAzulOscuro < 5) && (porcentajeColorRojoOscuro < 5) && (porcentajeColorRosa >= 60))
      colorFinal = 'Rosa';
    elseif ((porcentajeColorRojoClaro < 10) && (porcentajeColorNaranja < 5) 
      && (porcentajeColorAmarillo < 10) && (porcentajeColorVerde < 20) && (porcentajeColorCyan < 5)
      && (porcentajeColorAzulOscuro < 7) && (porcentajeColorRojoOscuro >= 50) && (porcentajeColorRosa < 17))
      colorFinal = 'Rojo oscuro';
    endif
    
    
    porcentajeFresa = (pixelesParaFresa/suma)*100;
    porcentajeNaranja = (pixelesParaNaranja/suma)*100;
    porcentajeCereza = (pixelesParaCereza/suma)*100;
    porcentajePlatano = (pixelesParaPlatano/suma)*100;
    porcentajeSandia = (pixelesParaSandia/suma)*100;
    porcentajeLima = (pixelesParaLima/suma)*100;
    porcentajeArandanos = (pixelesParaArandanos/suma)*100;
    frutaFinal = '';

    if(strcmp(colorFinal,'Mezcla de frutas') == 0)
      if ((porcentajeFresa < 5) && (porcentajeNaranja < 5) && (porcentajeCereza < 5) && (porcentajePlatano < 5)
        && (porcentajeSandia < 5) && (porcentajeLima < 5) && (porcentajeArandanos >= 65))
        frutaFinal = 'Arandanos';
      elseif ((porcentajeFresa < 15) && (porcentajeNaranja < 5) && (porcentajeCereza >= 35) && (porcentajePlatano < 5)
        && (porcentajeSandia < 15) && (porcentajeLima < 7) && (porcentajeArandanos < 5))
        frutaFinal = 'Cereza';
      elseif ((porcentajeFresa >= 45) && (porcentajeNaranja < 7) && (porcentajeCereza < 10) && (porcentajePlatano < 5)
        && (porcentajeSandia < 15) && (porcentajeLima < 10) && (porcentajeArandanos < 5))
        frutaFinal = 'Fresas';
      elseif ((porcentajeFresa < 5) && (porcentajeNaranja < 5) && (porcentajeCereza < 5) && (porcentajePlatano < 5)
        && (porcentajeSandia < 20) && (porcentajeLima >= 75) && (porcentajeArandanos < 5))
        frutaFinal = 'Lima';
      elseif ((porcentajeFresa < 5) && (porcentajeNaranja >= 47) && (porcentajeCereza < 5) && (porcentajePlatano < 15)
        && (porcentajeSandia < 20) && (porcentajeLima < 10) && (porcentajeArandanos < 5))
        frutaFinal = 'Naranja';
      elseif ((porcentajeFresa < 5) && (porcentajeNaranja < 30) && (porcentajeCereza < 5) && (porcentajePlatano >= 50)
        && (porcentajeSandia < 5) && (porcentajeLima < 5) && (porcentajeArandanos < 5))
        frutaFinal = 'Platano';
      elseif ((porcentajeFresa < 5) && (porcentajeNaranja < 5) && (porcentajeCereza < 5) && (porcentajePlatano < 5)
        && (porcentajeSandia >= 45) && (porcentajeLima < 35) && (porcentajeArandanos < 5))
        frutaFinal = 'Sandia';

      endif
    else
      colorFinal = 'Mezcla de: ';
      if (porcentajeArandanos > 12)
        frutaFinal = 'Arandanos';
        colorFinal = strcat(colorFinal, ' Azul oscuro');
      endif
      if (porcentajeCereza > 12)
        if(strcmp(frutaFinal,'') == 1)
          frutaFinal = 'Cerezas';
          colorFinal = strcat(colorFinal, ' Rojo oscuro');
        else
          frutita = ', cerezas';
          frutaFinal = strcat(frutaFinal, frutita);
          colorFinal = strcat(colorFinal, ', rojo oscuro');
        endif
      endif
      if (porcentajeFresa > 12)
        if(strcmp(frutaFinal,'') == 1)
          frutaFinal = 'Fresas';
          colorFinal = strcat(colorFinal, ' Rojo claro');
        else
          frutita = ', fresas';
          frutaFinal = strcat(frutaFinal, frutita);
          colorFinal = strcat(colorFinal, ', rojo claro');
        endif
      endif
      if (porcentajeLima > 15)
        if(strcmp(frutaFinal,'') == 1)
          frutaFinal = 'Lima';
          colorFinal = strcat(colorFinal, ' Verde lima');
        else
          frutita = ', lima';
          frutaFinal = strcat(frutaFinal, frutita);
          colorFinal = strcat(colorFinal, ', verde lima');
        endif
      endif
      if (porcentajeNaranja > 12)
        if(strcmp(frutaFinal,'') == 1)
          frutaFinal = 'Naranja';
          colorFinal = strcat(colorFinal, ' Naranja');
        else
          frutita = ', naranja';
          frutaFinal = strcat(frutaFinal, frutita);
          colorFinal = strcat(colorFinal, ', naranja');
        endif
      endif
      if (porcentajePlatano > 12)
        if(strcmp(frutaFinal,'') == 1)
          frutaFinal = 'Platano';
          colorFinal = strcat(colorFinal, ' Amarillo');
        else
          frutita = ', platano';
          frutaFinal = strcat(frutaFinal, frutita);
          colorFinal = strcat(colorFinal, ', amarillo');
        endif
      endif
      if (porcentajeSandia > 15)
        if(strcmp(frutaFinal,'') == 1)
          frutaFinal = 'Sandia';
          colorFinal = ' Verde oscuro';
        else
          frutita = ', sandia';
          frutaFinal = strcat(frutaFinal, frutita);
          colorFinal = strcat(colorFinal, ', verde oscuro');
        endif
      endif
    endif
    
    tipoFruta = zeros(1,7);
    tipoFruta(1) = porcentajeArandanos;
    tipoFruta(2) = porcentajeCereza;
    tipoFruta(3) = porcentajeFresa;
    tipoFruta(4) = porcentajeLima;
    tipoFruta(5) = porcentajeNaranja;
    tipoFruta(6) = porcentajePlatano;
    tipoFruta(7) = porcentajeSandia;
    
    
    % Sacar el perimetro a raiz del perimetro
    grayim = rgb2gray(IN);
    grayHisto = gHistogram(grayim,1);
    threshold = MVThreshold(grayHisto);
    bwimage = Binarizacion(grayim, threshold);
    bordergrayim = imBorder(bwimage);
    
    perimetroFruta = calculaPerimetro(bordergrayim);

    fprintf('La imagen contiene una fruta del tipo: %s.\n', frutaFinal);
    plural = isequal(strfind(colorFinal,','),[]);
    if(plural == 0)
      fprintf('Los colores principales de la imagen son: %s.\n', colorFinal);
    else
      fprintf('El color principal de la imagen es: %s.\n', colorFinal);
    endif
    fprintf('La fruta tiene un perímetro de %d píxeles.\n', perimetroFruta);

endfunction
