close all;
clear all;
pkg load signal;
clc;

% LECTURA AUDIO %
% Lectura y obtenci�n de datos del audio %
audio_leido=audioread('apellidos.wav');
datos=audioinfo('apellidos.wav');
FS=datos.SampleRate;

% Representaci�n del audio %
len_audio=length(audio_leido);
n=(0:len_audio-1);
figure();
plot(n,audio_leido);

% Recorte del audio para centrarnos en la parte importante (fuera silencio inicial y final) %
audio_leido_1=audio_leido(50000:225000,1);
len_audio_1=length(audio_leido_1);
n_1=(0:len_audio_1-1);
figure();
plot(n_1,audio_leido_1);

% Definici�n de la ventana usada para el m�todo de las ventanas deslizantes %
L = 101;
Lmed = (L-1)/2;
solapamiento = 65;
%solapamiento = 20;
D = floor((L-1)*(100-solapamiento)/100);
nM = (1+Lmed:D:len_audio_1-Lmed);

% ENERG�A %
% Uso de la funci�n block.m para el ventaneo %
auventana = block(audio_leido_1(:)',L,D);
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
Enorm = En/max(En);
figure();
plot(n,audio_leido_1,'b',nM,Enorm,'g');
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

figure();
plot(n,audio_leido_1,'b',nM,ZC,'r');


% AUTOCORRELACION %
% Declaramos L usando el valor recomendado en la teor�a de la asignatura, el solapamiento y el factor de diezmado %
comienzo = 16000;   %VI- Sonido sonoro
x = audio_leido_1(comienzo:(17500));
correlacion = xcorr(x) (length(x):end);

figure();
stem(correlacion(1:1000));

kmin = 50;
[m,k] = max(correlacion(kmin:end));
k = kmin+k;

printf("k = %d, T = %f, F = %f\n",k-1,(k-1)/FS,FS/(k-1));


%Sonido sordo
comienzo = 74000;   %-S
x = audio_leido_1(comienzo:(79000));
correlacion = xcorr(x) (length(x):end);

figure();
stem(correlacion(1:1000));

kmin = 50;
[m,k] = max(correlacion(kmin:end));
k = kmin+k;

printf("k = %d, T = %f, F = %f\n",k-1,(k-1)/FS,FS/(k-1));

%Silencio
comienzo = 165000;   %-S
x = audio_leido_1(comienzo:(168000));
correlacion = xcorr(x) (length(x):end);

figure();
stem(correlacion(1:1000));

kmin = 50;
[m,k] = max(correlacion(kmin:end));
k = kmin+k;

printf("k = %d, T = %f, F = %f\n",k-1,(k-1)/FS,FS/(k-1));



%%Distincion de sonidos sonoros%%
umbral = 0.102; 
Enorm = En/max(En);
detector=zeros(size(Enorm));
detector=(Enorm>umbral)*1;

%Mostrando resultados
figure();
plot(n_1,audio_leido_1,'b',nM,Enorm,'r',nM,detector,'g','linewidth',3); 

