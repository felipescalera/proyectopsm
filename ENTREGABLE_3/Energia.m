function y = Energia( x )
  
  N = length(x); %Aplicamos el c�lculo de la energ�a
  x = x(:);
  
  y = x' * x;
  
endfunction
