% Camera identification example

'Example - Do the three images represent the same camera that took the image Pxxx.jpg?'
im1 = '001.jpg',
im2 = '002.jpg',
im3 = '003.jpg',
Images(1).name = im1;  Images(2).name = im2;  Images(3).name = im3; 
RP = getFingerprint(Images);
RP = rgb2gray1(RP);
    sigmaRP = std2(RP);
Fingerprint = WienerInDFT(RP,sigmaRP);

imx = 'Pxxx.jpg',
Noisex = NoiseExtractFromImage(imx,2);
Noisex = WienerInDFT(Noisex,std2(Noisex));

% The optimal detector (see publication "Large Scale Test of Sensor Fingerprint Camera Identification")
Ix = double(rgb2gray(imread(imx)));
C = crosscorr(Noisex,Ix.*Fingerprint);
detection = PCE(C)

