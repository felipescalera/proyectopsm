close all;
clear all;
pkg load signal;
clc;

% LECTURA AUDIO %
% Lectura y obtención de datos del audio %
audio_leido=audioread('apellidos.wav');
datos=audioinfo('apellidos.wav'); 
FS=datos.SampleRate;

% Representación del audio %
len_audio=length(audio_leido); %Duración del audio
n=(0:len_audio-1);
figure();
plot(n,audio_leido);
title('"Viñuelas Perales"','fontsize',24);
xlabel("n",'fontsize',24);
ylabel("s[n]",'fontsize',24);

% Recorte del audio para centrarnos en la parte importante (fuera silencio inicial y final) %
audio_leido_1=audio_leido(50000:225000,1);
len_audio_1=length(audio_leido_1);
n_1=(0:len_audio_1-1);
figure();
plot(n_1,audio_leido_1);
title('"Viñuelas Perales" recortado','fontsize',24);
xlabel("n",'fontsize',24);
ylabel("s[n]",'fontsize',24);

% Definición de la ventana usada para el método de las ventanas deslizantes %
L = 101;
Lmed = (L-1)/2;
solapamiento = 65;
%solapamiento = 20;
D = floor((L-1)*(100-solapamiento)/100); %%Desplazamiento
nM = (1+Lmed:D:len_audio_1-Lmed);

% ENERGÍA %
% Uso de la función block.m para el ventaneo %
auventana = block(audio_leido_1(:)',L,D);
NpE = size(auventana,1);


%Declaramos la ventana que aplicamos sobre la señal%
n1=0:L-1;

%w = ones(TamVentana,1);
w = 0.5-0.5*cos(2*pi*n1/(L-1))'; %%Declaramos el tipo de ventana (de Hann)

% Obtención de la energía de la función, aplicándole la máscara a la señal%
for n=1:NpE
  En(n) = Energia(auventana(n,:).*w); 
  %%Energia es una función simple que hace el cálculo de la energía
endfor

% Representación de la función y de la energía %
n=0:len_audio_1-1;
Enorm = En/max(En);
figure();
plot(n,audio_leido_1,'b',nM,Enorm,'g');
title('Energía del audio','fontsize',24);
xlabel("n",'n',24);
ylabel("E[n]",'fontsize',24);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DENSIDAD DE CRUCES POR CERO %
% Declaramos L usando el valor recomendado en la teoría de la asignatura, el solapamiento y el factor de diezmado %
L = 101;
Lmed = (L-1)/2;
solapamiento = 65;
%solapamiento = 20;
D = floor((L-1)*(100-solapamiento)/100); %Declaramos el desplazamiento
nM = (1+Lmed:D:len_audio_1-Lmed);

ZC = zeros(size(nM));

w = ones(L,1);
%Aplicamos el cálculo visto en clase de laboratoriopara la densidad de cruces por cero
F = [0; (1/(2*L)*abs(sign(audio_leido_1(2:end))-sign(audio_leido_1(1:end-1))))];

for it = 1:length(nM)
  ZC(it) = sum(F(nM(it)-Lmed:nM(it)+Lmed).*w);
endfor

figure();
plot(n,audio_leido_1,'b',nM,ZC,'r');
title('Densidad de cruces por cero','fontsize',24);
xlabel("n",'n',24);
ylabel("ZC[n]",'fontsize',24);


% AUTOCORRELACION %
% Declaramos L usando el valor recomendado en la teoría de la asignatura, el solapamiento y el factor de diezmado %
comienzo = 16000;   %n para Sonido sonoro
x = audio_leido_1(comienzo:(17500));
%Calculamos la correlación para el nuevo fragmento de la señal
correlacion = xcorr(x) (length(x):end); 

figure();
stem(correlacion(1:1000));
title('Correlación de sonido sonoro','fontsize',24);
xlabel("n",'fontsize',24);
ylabel("correlacion[n]",'fontsize',24);

kmin = 50;
[m,k] = max(correlacion(kmin:end));
k = kmin+k;%Referente a la energía de la señal

%Mostramos por consola la información sobre la correlación
%Donde k será la energía y F el pitch
printf("k = %d, T = %f, F = %f\n",k-1,(k-1)/FS,FS/(k-1));


%Sonido sordo
%Aplicamos el mismo procedimiento
comienzo = 74000;   %-S
x = audio_leido_1(comienzo:(79000));
correlacion = xcorr(x) (length(x):end);

figure();
stem(correlacion(1:1000));
title('Correlación de sonido sordo','fontsize',24);
xlabel("n",'fontsize',24);
ylabel("correlacion[n]",'fontsize',24);

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
title('Correlación de sonido silencio','fontsize',24);
xlabel("n",'fontsize',24);
ylabel("correlacion[n]",'fontsize',24);

kmin = 50;
[m,k] = max(correlacion(kmin:end));
k = kmin+k;

printf("k = %d, T = %f, F = %f\n",k-1,(k-1)/FS,FS/(k-1));



%%Distinción de sonidos sonoros%%
%%Algoritmo que calcula el umbral de energía
%%para distinguir los sonidos sordos de sonoros.
%%A partir de un umbral de energía establecido por nosotros,
%%medirá en que punto hay un nivel menor de energía
%%correspondiendo a los sonidos sordos y silencios, mientras
%%que para los sonidos sonoros, se tendrá en cuenta su mayor nivel de
%%energía
umbral = 0.102; 
Enorm = En/max(En);
detector=zeros(size(Enorm));
detector=(Enorm>umbral)*1; %%Si la energía es mayor al umbral, decimos que es 1

%Mostrando resultados
figure();
plot(n_1,audio_leido_1,'b',nM,Enorm,'r',nM,detector,'g','linewidth',3); 
title('Detección de sonidos sonoros de sordos y silencios','fontsize',24);
xlabel("n",'n',24);
ylabel("detector[n]",'fontsize',24);

