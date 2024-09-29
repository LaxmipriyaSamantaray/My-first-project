clear
close all
clc

load all_feat_test_LBP 
load all_feat_train_LBP 
load all_feat_test_FD 
load all_feat_train_FD

load test_y 
load train_y 

all_feat_test=[all_feat_test_FD all_feat_test_LBP];
all_feat_train=[all_feat_train_FD all_feat_train_LBP];

[idx,weights] = relieff(all_feat_train,categorical(train_y'),10);
lp=1;
for cnt=100:100:3000
    no_of_features=cnt;%(100 3372)
    feat_index=idx(1:no_of_features);
    all_feat_trainn=all_feat_train(:,feat_index);
    all_feat_testt=all_feat_test(:,feat_index);

    mdl = fitcecoc(all_feat_trainn,train_y);
    [YPred,scores] = predict(mdl,all_feat_testt);

    [oa(lp), ~, ~, ~]=perf_measure(test_y ,YPred');
    lp=lp+1
end
figure;
plot(100:100:3000,oa);xlabel('No of selected samples (RelieFf)');
ylabel('Accuracy');
grid on;

