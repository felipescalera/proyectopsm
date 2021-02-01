function y = Energia( x )
  
  N = length(x);
  x = x(:);
  
  y = x' * x;
  
endfunction
