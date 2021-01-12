function [h, l, s] = rgb2hls(r,g,b)



pixel = [r, g, b];



maxval = max( pixel );

minval = min( pixel );



l = ( maxval + minval ) /2;



aux = maxval - minval;

if maxval == minval 

  

 s = 0;

  

elseif l <= 0.5

  

 s = aux / (2*l );

  

else

 s = aux / ( 2 - 2 * l );

end



if s == 0

  

 h = NaN;

  

elseif maxval == r

  

 h = (g - b )/ aux;

  

elseif maxval == g

  

 h = 2 + ( b -r )/ aux;

  

else

 h = 4 + (r - g )/ aux;

end

if ~isnan( h )

 h = h * 60;

 if h < 0

  h = h + 360;

 end

end

end