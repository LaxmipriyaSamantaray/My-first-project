clear
close all
clc

load sat-4-full

im=train_x(:,:,1,1);
%im=imread('cameraman.tif');
feat=extractFDFeatures_1(im);
subplot(1,2,1);imshow(im);
subplot(1,2,2);imshow(feat);