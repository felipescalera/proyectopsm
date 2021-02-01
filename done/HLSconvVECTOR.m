function salida = HLSconvVECTOR(IN)
R = IN(:,:,1); 

G = IN(:,:,2);

B = IN(:,:,3);

[filas, cols, canales]=size(IN);

Rnorm = normaliza(R); 

Gnorm = normaliza(G);

Bnorm = normaliza(B);

%%Hasta aqui hemos medido los canales RGB y los hemos normalizado

for ind=1:filas

  for jnd=1:cols
   %Para cada pixel, vamos a medir el rango HLS, aplicando el algoritmo basico de conversion
   [h, l, s] = rgb2hls(Rnorm(ind, jnd), Gnorm(ind, jnd), Bnorm(ind, jnd)); 

   H(ind, jnd) = h;

   L(ind, jnd) = l;

   S(ind, jnd) = s;

  endfor

endfor


%Ajustamos los valores de H, para que no se desborde
H = round( H ); H( H == 360 ) = 0; H = H(:);

hh = zeros( 360, 1 );

for i = 0 : 359  %Creamos el histograma

 hh( i + 1 ) = sum( H == i );

end

salida = hh;  %%Damos como salida el vector del histograma

endfunction