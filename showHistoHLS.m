function showHisto(h,niveles)
  R = IN(:,:,1); 

G = IN(:,:,2);

B = IN(:,:,3);




Rnorm = normaliza(R); 

Gnorm = normaliza(G);

Bnorm = normaliza(B);



for ind=1:filas

  for jnd=1:cols

   [h, l, s] = rgb2hls(Rnorm(ind, jnd), Gnorm(ind, jnd), Bnorm(ind, jnd)); %Completar la funcion rgb2hls

   H(ind, jnd) = h;

   L(ind, jnd) = l;

   S(ind, jnd) = s;

  endfor

endfor



H = round( H ); H( H == 360 ) = 0; H = H(:);

hh = zeros( 360, 1 );

for i = 0 : 359

 hh( i + 1 ) = sum( H == i );

end



figure();

showHisto(hh,360);

endfunction
