clear;
pkg load image;

I = imread ("BaboonOriginal2.png");
J20 = imread ("deNoisyBaboon20.png");
J50 = imread ("deNoisyBaboon50.png");
J80 = imread ("deNoisyBaboon80.png");

PSNR20_val = psnr(J20,I, 65535)
PSNR50_val = psnr(J50,I, 65535)
PSNR80_val = psnr(J80,I, 65535)
