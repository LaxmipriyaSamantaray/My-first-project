clear
close all
clc

load sat-4-full
n=2;
subplot(2,2,1);imshow(train_x(:,:,1,n));
subplot(2,2,2);imshow(train_x(:,:,2,n));
subplot(2,2,3);imshow(train_x(:,:,3,n));
subplot(2,2,4);imshow(train_x(:,:,4,n));


