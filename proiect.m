clear;

I = imread ("8.noisyBaboon90.png");

I = im2double(I);

J = deNoise (I);
#J = deNoise (J);

imwrite (J, "deNoisyBaboon90.png");
figure 1;
imshow(I);
figure 2;
imshow(J);