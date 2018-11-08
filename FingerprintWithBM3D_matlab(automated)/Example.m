% Camera identification example

% 'Example - Do the these images represent the same camera that took the image?'
% Current code supports only three images. The images can be JPEG or PNG.

im1 = 'Images/F16_512rgb.png';
im2 = 'Images/Lena512rgb.png';
im3 = 'Images/Peppers512rgb.png';
im4 = 'Images/Peppers512rgb.png';
im5 = 'Images/Peppers512rgb.png';
im6 = 'Images/Peppers512rgb.png';
im7 = 'Images/Peppers512rgb.png';
im8 = 'Images/Peppers512rgb.png';
Images(1).name = im1;  Images(2).name = im2;  Images(3).name = im3; 
Images(4).name = im4;  Images(5).name = im5;  Images(6).name = im6;
Images(7).name = im7;  Images(8).name = im8;
% getFingerprint.m takes RGB images in the JPEG/PNG format. For BM3D filter, the
% code in getFingerprint.m has been modified to use a BM3D filter for noise
% extraction. The noise in the image is calculated by subtracting the image
% from the denoised image.

RP = getFingerprint(Images);
RP = rgb2gray1(RP);
    sigmaRP = std2(RP);
Fingerprint = WienerInDFT(RP,sigmaRP);

% The BM3D filter uses PNG (2D) grayscale images.
% 'imx' here denotes a noisy image
% The image from the camera for which check is done.

imx = imread('Images/Lena512rgb.png');

%Uncomment this line if using an rgb image.
%Image is converted to grayscale.
imx = rgb2gray(imx);

imx = im2double(imx);
randn('seed', 0); 
sigma = 25;
imx1 = imx + (sigma/255)*randn(size(imx));

% imx_est is the denoised image.
[~,imx_est] = BM3D(1, imx1, sigma);

% In case there is an original (less noisy) image, it can be used to get the value of PSNR
% else it is zero. Scan your image in 'imx2' .Uncomment the following lines.
% [PSNR,imx _est] = BM3D(imx2,imx1, sigma);

% Noise is calculated by subtracting noisy image from denoised image
Noisex = imx_est-imx1;
Noisex = WienerInDFT(Noisex,std2(Noisex));

% The optimal detector (see publication "Large Scale Test of Sensor Fingerprint Camera Identification")
Ix = double(rgb2gray1(imx));
C = crosscorr(Noisex,Ix.*Fingerprint);
detection = PCE(C),

