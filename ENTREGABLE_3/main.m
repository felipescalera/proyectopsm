close all;
clear all;
pkg load signal;
clc;

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

len_audio=length(audio_leido);
n=(0:len_audio-1);
figure();
plot(n,audio_leido);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
audio_leido_1=audio_leido(50000:225000,1);
len_audio_1=length(audio_leido_1);
n_1=(0:len_audio_1-1);
figure();
plot(n_1,audio_leido_1);

%Ventana%
TamVentana = 256;
Solapamiento = TamVentana/2;

audio_leido_1=ones(length(audio_leido_1),1);
[auventana,pos] = block(audio_leido_1(:)',TamVentana,Solapamiento);
NpE = size(auventana,1);
for n=1:NpE
  En(n) = Energia(auventana(n,:));
endfor

n=0:len_audio_1-1;
figure();
[FigHandle lin1 lin2] = plotyy(n/FS, audio_leido_1,(0:NpE-1)*Solapamiento/FS,En);
grid on;
xlabel('Tiempo (s)','fontsize',18);
ylabel('Energía Intantanea[n]','fontsize',18);
set(get(FigHandle(1),'Ylabel'),'fontsize',18,'String','audio_leido[n]');
set(lin2,'linewidth',2);
%Comentar aqui lo de la enegia%

plot(length(auventana),auventana(:));