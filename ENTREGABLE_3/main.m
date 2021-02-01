close all;
clear all;
pkg load signal;
clc;

% LECTURA AUDIO %
% Lectura y obtención de datos del audio %
audio_leido=audioread('apellidos.wav');
datos=audioinfo('apellidos.wav');

ncanales=datos.NumChannels;
FS=datos.SampleRate;
BPS=datos.BitsPerSample;
ndatos=datos.TotalSamples;
duracion=datos.Duration;

duracion=ndatos/FS;
vmax=max(audio_leido(:));
vmin=min(audio_leido(:));

% Representación del audio %
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

% Definición de la ventana usada para el método de las ventanas deslizantes %
TamVentana = 256;
Solapamiento = TamVentana/2;

% ENERGÍA %
% Uso de la función block.m para el ventaneo %
[auventana,pos] = block(audio_leido_1(:)',TamVentana,Solapamiento);
NpE = size(auventana,1);

% Obtención de la energía de la función %
for n=1:NpE
  En(n) = Energia(auventana(n,:));
endfor

% Representación de la función y de la energía %
n=0:len_audio_1-1;
figure();
[FigHandle lin1 lin2] = plotyy(n/FS, audio_leido_1,(0:NpE-1)*Solapamiento/FS,En);
grid on;
xlabel('Tiempo (s)','fontsize',18);
ylabel('Energía Intantanea[n]','fontsize',18);
set(get(FigHandle(1),'Ylabel'),'fontsize',18,'String','audio_leido[n]');
set(lin2,'linewidth',2);
%% TO DO: Comentar aqui lo de la energia


% DENSIDAD DE CRUCES POR CERO %
% Declaramos L usando el valor recomendado en la teoría de la asignatura, el solapamiento y el factor de diezmado %
L = 110;
Lmed = (L-1)/2;
solapamiento = 65;

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