% This script takes images as input and passes the images as parameters to the
% wavelet and BM3D filter. The PCE values of both can be compared.
im1 = 'Images/Baboon512rgb.jpg';
im2 = 'Images/Baboon512rgb.jpg';
im3 = 'Images/Baboon512rgb.jpg';
im4 = 'Images/Baboon512rgb.jpg';
im5 = 'Images/Baboon512rgb.jpg';
im6 = 'Images/Baboon512rgb.jpg';
im7 = 'Images/Baboon512rgb.jpg';
im8 = 'Images/Baboon512rgb.jpg';

Images(1).name = im1; Images(2).name = im2; Images(3).name = im3;
Images(4).name = im4; Images(5).name = im5; Images(6).name = im6;
Images(7).name = im7; Images(8).name = im8;

imx = 'Images/Peppers512rgb.jpg';

Example_BM3D(Images, imx);
% Example_wavelet(Images, imx);