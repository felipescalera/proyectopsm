function y = Energia( x )
  
  N = length(x); %Aplicamos el cálculo de la energía
  x = x(:);
  
  y = x' * x;
  
endfunction
