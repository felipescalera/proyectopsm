close all;
clear all;
pkg load signal;
clc;

% LECTURA AUDIO %
% Lectura y obtenci�n de datos del audio %
audio_leido=audioread('apellidos.wav');
datos=audioinfo('apellidos.wav');



% Recorte del audio para centrarnos en la parte importante (fuera silencio inicial y final) %
audio_leido_1=audio_leido(50000:225000,1);
len_audio_1=length(audio_leido_1);
n_1=(0:len_audio_1-1);
figure();

% Definici�n de la ventana usada para el m�todo de las ventanas deslizantes %
L = 101;
Lmed=(L-1)/2;
Solapamiento = 65;
%solapamiento = 20;
    D = floor((L-1)*(100-Solapamiento)/100);

    % Puntos de muestreo de la característica 
    % es donde se debe calcular el valor de la energía.
nM = (1+Lmed:D:len_audio_1-Lmed);
En = zeros(size(nM));

% ENERG�A %
% Uso de la funci�n block.m para el ventaneo %
[auventana,pos] = block(audio_leido_1(:)',L,Solapamiento);
NpE = size(auventana,1);


%Declaramos la ventana que aplicamos sobre la se�al%
n1=0:L-1;

%w = ones(TamVentana,1);
w = 0.5-0.5*cos(2*pi*n1/(L-1))';

% Obtenci�n de la energ�a de la funci�n %
for n=1:NpE
  En(n) = Energia(auventana(n,:).*w);
endfor

% Representaci�n de la funci�n y de la energ�a %
n=0:len_audio_1-1;
%% TO DO: Comentar aqui lo de la energia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DENSIDAD DE CRUCES POR CERO %
% Declaramos L usando el valor recomendado en la teor�a de la asignatura, el solapamiento y el factor de diezmado %
L = 101;
Lmed = (L-1)/2;
solapamiento = 65;
%solapamiento = 20;

D = floor((L-1)*(100-solapamiento)/100);
nM = (1+Lmed:D:len_audio_1-Lmed);
ZC = zeros(size(nM));

w = ones(L,1);
F = [0; (1/(2*L)*abs(sign(audio_leido_1(2:end))-sign(audio_leido_1(1:end-1))))];

for it = 1:length(nM)
  ZC(it) = sum(F(nM(it)-Lmed:nM(it)+Lmed).*w);
endfor




%%Distincion de sonidos sonoros%%
umbral = 0.05; 
Enorm = En/max(En);
detector=zeros(size(Enorm));
detector=(Enorm>umbral)*1;
  
  
%Mostrando resultados
figure();
plot(n_1,audio_leido_1,'b',nM,Enorm,'r',nM,detector,'g'); 

