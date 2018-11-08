function [] = Example_wavelet(Images, imx)

% Camera identification example using wavelet filter

RP = getFingerprint_wavelet(Images);
RP = rgb2gray1(RP);
    sigmaRP = std2(RP);
Fingerprint = WienerInDFT(RP,sigmaRP);

Noisex = NoiseExtractFromImage(imx,2);
Noisex = WienerInDFT(Noisex,std2(Noisex));

% The optimal detector (see publication "Large Scale Test of Sensor Fingerprint Camera Identification")
Ix = double(rgb2gray(imread(imx)));
C = crosscorr(Noisex,Ix.*Fingerprint);
detection = PCE(C)

