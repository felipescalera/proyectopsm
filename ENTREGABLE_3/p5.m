
    Y = audioread('apellidos.wav');

    Y = Y(50000:225000,1); % recorte de la parte interesante de la misma.
    lenY = length(Y);
    n = (0:lenY-1);


     % se muestra la muestra
     plot(n,Y);
     
%----------------------------------------------------------------------
% Cálculo de la energía instantánea. En este primer apartado se lee un fichero estéreo y se optiene información del mismo
%----------------------------------------------------------------------
	
    L = 101; %[VALOR A VARIAR POR EL ALUMNO, usar valores impares]
    Lmed = (L-1)/2;
    solapamiento = 65; %VALOR A VARIAR POR EL ALUMNO, usar valores en porcentaje
    D = floor((L-1)*(100-solapamiento)/100);

    % Puntos de muestreo de la característica 
    % es donde se debe calcular el valor de la energía.
    nM = (1+Lmed:D:lenY-Lmed);
    E = zeros(size(nM));

    % Definición de ventana rectangular
    w = ones(L,1); %A VARIAR POR EL ALUMNO

    Matven = block(Y,L,D);
    for k=1:size(Matven,1)
      E(k)=Energia(Matven(k,:).*w');
    endfor

    % Representación de la señal muestreada
    figure(1)
    plot(n,Y); %% señal original

    Enorm = E/max(E); %Energía normalizada entre 0 y 1.
    figure(2)
    plot(n,Y,'b',nM,Enorm,'r-*'); %% señal con energía (normalizada)
     

  % umbral escogido
  umbral = 0.001; % A MODIFICAR POR EL ALUMNO
  
  % Señal detector (del mismo tamaño que Enorm)
  detector=zeros(size(Enorm));
  
  % calcule el valor de detector A COMPLETAR POR EL ALUMNO
  for k=1:length(Enorm)
    if(Enorm(k) > umbral)
      detector(k)=1;
    endif
  endfor
  
  % mostrando resultados
  figure(1)
  plot(n,Y,'b',nM,Enorm,'r',nM,detector,'g');
  
 
  










