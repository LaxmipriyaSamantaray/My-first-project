clear
close all
clc

load all_feat_test_LBP 
load all_feat_train_LBP 
load test_y 
load train_y 

mdl = fitcknn(all_feat_train_LBP,train_y);
[YPred,scores] = predict(mdl,all_feat_test_LBP);

[oa, aa, K, ua]=perf_measure(test_y ,YPred');
figure,plotconfusion(convert_labels_binary_vec(test_y,4),convert_labels_binary_vec(YPred',4));title('TL results');

disp(['Overall Accuracy :',num2str(oa)]);
disp(['Average Accuracy :',num2str(aa)]);
disp(['Kappa :',num2str(K)]);
disp(['Class1 :',num2str(ua(1))]);
disp(['Class2 :',num2str(ua(2))]);
disp(['Class3 :',num2str(ua(3))]);
disp(['Class4 :',num2str(ua(4))]);
