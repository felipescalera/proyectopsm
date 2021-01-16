clc;
clear all;

IN=imread('frutas/arandanos.jpg');
hh=HLSconvVECTOR(IN);
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
queFrutaEs(hh5,IN5);


IN=imread('frutas/platano2.jpg');
hh51=HLSconvVECTOR(IN51);
queFrutaEs(hh51,IN51);

tic
IN6=imread('frutas/sandia.jpg');
hh6=HLSconvVECTOR(IN6);
OUT6=queFrutaEs(hh6,IN6);
toc

IN61=imread('frutas/sandia2.jpg');
hh61=HLSconvVECTOR(IN61);
queFrutaEs(hh61,IN61);

IN71=imread('frutas/prueba.jpg');
hh71=HLSconvVECTOR(IN71);
OUT71=queFrutaEs(hh71,IN71);

IN72=imread('frutas/siguienteprueba.jpg');
hh72=HLSconvVECTOR(IN72);
OUT72=queFrutaEs(hh72,IN72);

IN73=imread('frutas/ultimaprueba.jpg');
hh73=HLSconvVECTOR(IN73);
OUT73=queFrutaEs(hh73,IN73);

%Leemos la imagen
IN74=imread('frutas/combinacionfrutas4.jpg');
%Obtenemos el histograma a color de la imagen
hh74=HLSconvVECTOR(IN74);
%Identificamos sus caracteristicas principales
OUT74=queFrutaEs(hh74,IN74);
