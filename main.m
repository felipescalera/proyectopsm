IN=imread('frutas/naranjas.jpg');
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


showHistoHLS(IN);