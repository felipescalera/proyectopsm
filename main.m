clc;
clear all;


IN=imread('frutas/arandanos.jpg');
HLSconv(IN);
salida = HLSconvVECTOR(IN);
[M,I] = max(salida);
suma = sumatorio(salida);
porcentaje = M/suma;
I             % indice del color mas repetido
porcentaje    % fraccion de pixeles de la imagen cuyo color es el mas repetido


IN1=imread('frutas/cerezas.jpg');
HLSconv(IN1);
salida1 = HLSconvVECTOR(IN1);
[M1,I1] = max(salida1);
suma1 = sumatorio(salida1);
porcentaje1 = M1/suma1;
I1
porcentaje1

IN2=imread('frutas/fresas.jpg');
HLSconv(IN2);
salida2 = HLSconvVECTOR(IN2);
[M2,I2] = max(salida2);
suma2 = sumatorio(salida2);
porcentaje2 = M2/suma2;
I2
porcentaje2

IN3=imread('frutas/lima.jpg');
HLSconv(IN3);
salida3 = HLSconvVECTOR(IN3);
[M3,I3] = max(salida3);
suma3 = sumatorio(salida3);
porcentaje3 = M3/suma3;
I3
porcentaje3

IN4=imread('frutas/naranja.jpg');
HLSconv(IN4);
salida4 = HLSconvVECTOR(IN4);
[M4,I4] = max(salida4);
suma4 = sumatorio(salida4);
porcentaje4 = M4/suma4;
I4
porcentaje4

IN5=imread('frutas/platano.jpg');
HLSconv(IN5);
salida5 = HLSconvVECTOR(IN5);
[M5,I5] = max(salida5);
suma5 = sumatorio(salida5);
porcentaje5 = M5/suma5;
I5
porcentaje5

IN6=imread('frutas/sandia.jpg');
HLSconv(IN6);
salida6 = HLSconvVECTOR(IN6);
[M6,I6] = max(salida6);
suma6 = sumatorio(salida6);
porcentaje6 = M6/suma6;
I6
porcentaje6


IN=imread('frutas/arandanos.jpg');
hh=HLSconvVECTOR(IN);
[OUT,PER]=queFrutaEs(hh,IN);
queFrutaEs(hh,IN);

IN1=imread('frutas/cerezas.jpg');
hh1=HLSconvVECTOR(IN1);
OUT1=queFrutaEs(hh1,IN1);

IN11=imread('frutas/cerezas2.jpg');
hh11=HLSconvVECTOR(IN11);
OUT11=queFrutaEs(hh11,IN11);

IN2=imread('frutas/fresas.jpg');
hh2=HLSconvVECTOR(IN2);
OUT2=queFrutaEs(hh2,IN2);

IN3=imread('frutas/lima.jpg');
hh3=HLSconvVECTOR(IN3);
OUT3=queFrutaEs(hh3,IN3);

IN4=imread('frutas/naranja.jpg');
hh4=HLSconvVECTOR(IN4);
OUT4=queFrutaEs(hh4,IN4);

IN5=imread('frutas/platano.jpg');
hh5=HLSconvVECTOR(IN5);
OUT5=queFrutaEs(hh5,IN5);

IN51=imread('frutas/platano2.jpg');
hh51=HLSconvVECTOR(IN51);
OUT51=queFrutaEs(hh51,IN51);

IN6=imread('frutas/sandia.jpg');
hh6=HLSconvVECTOR(IN6);
OUT6=queFrutaEs(hh6,IN6);

IN61=imread('frutas/sandia2.jpg');
hh61=HLSconvVECTOR(IN61);
OUT61=queFrutaEs(hh61,IN61);

IN71=imread('frutas/prueba.jpg');
hh71=HLSconvVECTOR(IN71);
OUT71=queFrutaEs(hh71,IN71);

IN72=imread('frutas/siguienteprueba.jpg');
hh72=HLSconvVECTOR(IN72);
OUT72=queFrutaEs(hh72,IN72);

IN73=imread('frutas/ultimaprueba.jpg');
hh73=HLSconvVECTOR(IN73);
OUT73=queFrutaEs(hh73,IN73);

IN74=imread('frutas/combinacionfrutas4.jpg');
hh74=HLSconvVECTOR(IN74);
OUT74=queFrutaEs(hh74,IN74);

IN=imread('frutas/arandanos.jpg');
imshow(IN);


grayim = rgb2gray(IN);
grayHisto = gHistogram(grayim,1);
threshold = MVThreshold(grayHisto);
bwimage = Binarizacion(grayim, threshold);
imshow(bwimage);


grayim5 = rgb2gray(IN5);
grayHisto5 = gHistogram(grayim5,1);
threshold5 = MVThreshold(grayHisto5);
bwimage5 = Binarizacion(grayim5, threshold5);
imshow(bwimage5);



bordergrayim = imBorder(bwimage);
grayHisto = gHistogram(bordergrayim,1);
threshold = MVThreshold(grayHisto);
bwimage = Binarizacion(bordergrayim, threshold);
aux1 = calculaPerimetro(bordergrayim);

bordergrayim5 = imBorder(bwimage5);
imshow(bordergrayim5);
aux = calculaPerimetro(bordergrayim5);
