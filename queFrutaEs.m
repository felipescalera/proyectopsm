%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Función para obtener qué tipo o tipos de fruta están presentes en una imagen                                           %%
%%                                                                                                                        %%
%% Entrada: hh=histograma de la imagen IN (con valores HLS), IN=imagen a tratar                                           %%
%% Salida: imprime por pantalla el tipo de fruta y sus características (color, longitud del perímetro, y tamaño del área) %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function queFrutaEs(hh,IN)
  
  % Inicializamos las variables para clasificar los píxeles del histograma
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

  % Recorremos todos los píxeles del histograma y obtenemos su total (suma) ademas de clasificarlos
  suma = 0;
  for i = 0:359
    suma = suma + hh(i+1);   %Sumamos todos los pixeles a color
   
    if ((i >= 96) && (i <= 134)) || ((i >= 65) && (i <= 78))  %Ajustamos por un rango lo que consideramos una fruta concreta
      pixelesParaSandia = pixelesParaSandia + hh(i+1);        %Y sumamos los pixeles incluidos en este rango
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
    
    if (i >= 0) && (i <= 15)                        %Tambien estamos incluyendo un sumatorio para los colores según un rango
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
  
  % Obtenemos el porcentaje de cada color para determinar el color o colores mas presentes
  porcentajeColorRojoClaro = (pixelesRojoClaro/suma)*100;
  porcentajeColorNaranja = (pixelesNaranjas/suma)*100;
  porcentajeColorAmarillo = (pixelesAmarillos/suma)*100;
  porcentajeColorVerde = (pixelesVerdes/suma)*100;
  porcentajeColorCyan = (pixelesCyan/suma)*100;
  porcentajeColorAzulOscuro = (pixelesAzulOscuro/suma)*100;
  porcentajeColorRosa = (pixelesRosas/suma)*100;
  porcentajeColorRojoOscuro = (pixelesRojoOscuro/suma)*100;
  colorFinal = 'Mezcla de frutas';  
  %Se inicializa el color final en este flag, si no se clasifica el color, diremos que es una mezcla de frutas
  
  % Comprobamos los valores de los porcentajes de color y en función de ellos, asignamos un color (o 'Mezcla de frutas' en caso contrario)
  if ((porcentajeColorRojoClaro >= 40) && (porcentajeColorNaranja < 10) 
    && (porcentajeColorAmarillo < 10) && (porcentajeColorVerde < 16) && (porcentajeColorCyan < 10)
    && (porcentajeColorAzulOscuro < 5) && (porcentajeColorRojoOscuro < 16) && (porcentajeColorRosa < 10))
    colorFinal = 'Rojo claro';    %Asignamos el color de la fruta segun los rangos
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
    
  % Obtenemos el porcentaje de pixeles relevantes de cada fruta para determinar el tipo o tipos presentes  
  porcentajeFresa = (pixelesParaFresa/suma)*100;
  porcentajeNaranja = (pixelesParaNaranja/suma)*100;
  porcentajeCereza = (pixelesParaCereza/suma)*100;
  porcentajePlatano = (pixelesParaPlatano/suma)*100;
  porcentajeSandia = (pixelesParaSandia/suma)*100;
  porcentajeLima = (pixelesParaLima/suma)*100;
  porcentajeArandanos = (pixelesParaArandanos/suma)*100;
  frutaFinal = '';

  % Comprobamos si el color determinado es el correspondiente a una mezcla de frutas o no
  if(strcmp(colorFinal,'Mezcla de frutas') == 0) % Si colorFinal NO es mezcla de frutas, comprobamos los porcentajes y asignamos un color
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
  else % Si es una mezcla de frutas, comprobamos qué tipos de fruta la conforman y los vamos concatenando para obtener la mezcla como string
    colorFinal = 'Mezcla de: ';
    if (porcentajeArandanos > 12)  %Comprobamos los porcentajes de cada fruta y fijamos los valores
      frutaFinal = 'Arandanos';
      colorFinal = strcat(colorFinal, ' Azul oscuro');
    endif
    if (porcentajeCereza > 12)
      if(strcmp(frutaFinal,'') == 1)  
        frutaFinal = 'Cerezas';
        colorFinal = strcat(colorFinal, ' Rojo oscuro');
      else
        frutita = ', cerezas';   %Tenemos un if que comprueba si ya hemos añadido una fruta, a fin de imprimir una cadena formateada
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
    
  % Obtenemos la imagen en gris
  grayim = rgb2gray(IN);
  % Sacamos el histograma a gris de la imagen
  grayHisto = gHistogram(grayim,1);
  % Calculamos el umbral promedio para la binarizacion
  threshold = MVThreshold(grayHisto); %Tenemos en cuenta que es bimodal
  %Sacamos la imagen binarizada y el tamaño de la fruta, sacando los pixeles que son blancos 
  [bwimage,tam] = Binarizacion(grayim, threshold);
    
  figure(1);
  subplot(2,2,1);
  imshow(IN);
  title('Imagen original de la fruta','fontsize',24);
  
  subplot(2,2,2);
  imshow(bwimage);
  title('Imagen binarizada','fontsize',24);
    
  %Creamos una imagen con bordes usando la mascara de Sobel
  bordergrayim = imBorder(bwimage);
    
  subplot(2,2,3);
  imshow(bordergrayim);
  title('Imagen con mascara de Sobel','fontsize',24);

  %Filtramos los bordes de la imagen para eliminar los grises impuros
  newImage = filtraGrises(bordergrayim,180);
  subplot(2,2,4);
  imshow(newImage);
  title('Imagen bordeada con filtro de gris','fontsize',24);
       
  perimetroFruta = calculaPerimetro(newImage);
    
  % Devolvemos por consola los valores obtenidos mediante la funcion
  plural = isequal(strfind(colorFinal,','),[]);
  if(plural == 0)
     fprintf('Los colores principales de las frutas en la imagen son: %s.\n', colorFinal);
     fprintf('Las frutas tienen un perimetro aproximado de %d pixeles.\n', perimetroFruta);
     fprintf('Las frutas tienen un area aproximada de %d pixeles.\n', tam);
  else
     fprintf('El color principal de la fruta en la imagen es: %s.\n', colorFinal);
     fprintf('La fruta tiene un perimetro de %d pixeles.\n', perimetroFruta);
     fprintf('La fruta tiene un area aproximada de %d pixeles.\n', tam);
  endif
  fprintf('La imagen contiene una fruta o frutas del tipo: %s.\n', frutaFinal);

endfunction
