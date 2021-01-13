[filas, cols, canales]=size(IN);
imshow(IN);

h=histogram(IN,1);
figure(2);
showHisto(h);

h=histogram(IN,2);
figure(3);
showHisto(h);

h=histogram(IN,3);
figure(4);
showHisto(h);

[R, G, B] = Canales(IN);

figure();
imshow(R);

figure();
imshow(G);

figure();
imshow(B);

[filas, cols, canales] = size(IN);

imshow(IN);

clc;
clear all;
IN=imread('frutas/arandanos.jpg');
HLSconv(IN);

IN1=imread('frutas/cerezas.jpg');
HLSconv(IN1);

IN2=imread('frutas/fresas.jpg');
HLSconv(IN2);

IN3=imread('frutas/lima.jpg');
HLSconv(IN3);

IN4=imread('frutas/naranjas.jpg');
HLSconv(IN4);

IN5=imread('frutas/platano.jpg');
HLSconv(IN5);

IN6=imread('frutas/sandia.jpg');
HLSconv(IN6);