clear;
pkg load image;

noisePercentage = 0.90;

I = imread ("Baboon.png");
N = imnoise(I, 'salt & pepper', noisePercentage);

imwrite (N, "noisyBaboon90.png");
imshow(N);