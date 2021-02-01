% Funci�n para crear la matriz usada para el an�lisis por ventanas
% Mat contiene el conjunto de datos
% L n�mero de muestras de cada ventana
% D desplazamiento entre ventanas (expresado en n�mero de muestras)
%
% La funci�n devuelve la matriz bidimensional MatVen, con r filas y c columnas.
% c es igual a la longitud de la ventana.
% r depende de la longitud de Mat y el desplazamiento D. 
% En general r= EnteroMayor (lonMat/D)
% 
% Tambi�n devuelve los puntos muestrales donde se encuentra la referencia de cada ventana

function [MatVen pos] = block ( Mat, L, D) 

		%------ Comprobamos que la matriz Mat es unidmensional y tipo fila ----
[m, n] = size(Mat); 
if m > n
	Mat = Mat';
end
[m, n] = size(Mat);
if m>1
	error('La matriz no es unidimensional');
end

lonMat=length(Mat);	%Longitud de la matriz

%-------------------------   Criterios generales de operaci�n ------------------------
%La referencia (^) de la ventana es su centro. La posici�n temporal de esta referencia se emplear� para situar sobre una gr�fica de tiempo el resultado calculado sobre esa ventana.
%La referencia comienza en el origen de tiempos. 
%En cada iteraci�n, la referencia se incrementa en la cantidad indicada en el par�metro D (desplazamiento entre ventanas) mientras dicha referencia no se salga del vector de datos.
%------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------
%      Para una ventana de longitud impar (Ej.: L=7)
%
%	____________________
%      |__|__|__|__|__|__|__| pos = 4
%                 ^ 
%       1   2  3  4  5  6  7
%      Para una ventana de longitud par 
%	__________________
%      |__|__|__|__|__|__|    pos = 3.5
%               ^   
%       1   2  3  4  5  6  
%----------------------------------------------------------------------------------
    

	%------------------------ Iteramos para construir la matriz bidimensional-----
k=1;
for ii=1:D:(lonMat-L+1);
	MatVen(k,:) = Mat(ii:(L+ii-1));
	pos(k) = ii+(L-1)/2;
	k=k+1;
end


