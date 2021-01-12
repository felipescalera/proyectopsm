IN=imread('');
[filas, cols, canales]=size(IN);
imshow(IN);

h=histogram(IN,1);
figure(2);
showHisto(h);
