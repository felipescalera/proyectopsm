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


hh=HLSconvVECTOR(IN);
OUT=queFrutaEs(hh,IN);

hh=HLSconvVECTOR(IN1);
OUT1=queFrutaEs(hh,IN1);

hh=HLSconvVECTOR(IN2);
OUT2=queFrutaEs(hh,IN2);

hh=HLSconvVECTOR(IN3);
OUT3=queFrutaEs(hh,IN3);

hh=HLSconvVECTOR(IN4);
OUT4=queFrutaEs(hh,IN4);

hh=HLSconvVECTOR(IN5);
OUT5=queFrutaEs(hh,IN5);

hh=HLSconvVECTOR(IN6);
OUT6=queFrutaEs(hh,IN6);

IN=imread('frutas/prueba.jpg');
hh=HLSconvVECTOR(IN);
OUT=queFrutaEs(hh,IN);