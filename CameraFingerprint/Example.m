% Camera identification example

%Example - Do the images represent the same camera that took the image Pxxx.jpg?
% Replace the following with different images for each variable
im1 = 'P1.jpg',
im2 = 'P2.jpg',
im3 = 'P3.jpg',
im4 = 'P1.jpg',
im5 = 'P2.jpg',
im6 = 'P3.jpg',
im7 = 'P1.jpg',
im8 = 'P2.jpg',

Images(1).name = im1;  Images(2).name = im2;  Images(3).name = im3; 
Images(4).name = im4;  Images(5).name = im5;  Images(6).name = im6;
Images(5).name = im7;  Images(8).name = im8;


RP = getFingerprint(Images);
RP = rgb2gray1(RP);
    sigmaRP = std2(RP);
Fingerprint = WienerInDFT(RP,sigmaRP);

% The image from the camera for which the check is being done
imx = 'Pxxx.jpg',
Noisex = NoiseExtractFromImage(imx,2);
Noisex = WienerInDFT(Noisex,std2(Noisex));

% The optimal detector (see publication "Large Scale Test of Sensor Fingerprint Camera Identification")
Ix = double(rgb2gray(imread(imx)));
C = crosscorr(Noisex,Ix.*Fingerprint);
detection = PCE(C)

