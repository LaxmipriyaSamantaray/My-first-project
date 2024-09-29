clear
close all
clc

load sat-4-full

[~,test_y]=max(test_y);
[~,train_y]=max(train_y);

tr_sample=100;%4 lakh
ts_sample=100;% 1 lakh
test_y=test_y(1:ts_sample);
train_y=train_y(1:tr_sample);

for i=1:tr_sample
    features=[];
    for j=1:4
        features = [features extractLBPFeatures(train_x(:,:,j,i))];
    end
    all_feat_train_LBP(i,:)=features;
    i
end

for i=1:ts_sample
    features=[];
    for j=1:4
        features = [features extractLBPFeatures(test_x(:,:,j,i))];
    end
    all_feat_test_LBP(i,:)=features;
    i
end

save all_feat_test_LBP all_feat_test_LBP
save all_feat_train_LBP all_feat_train_LBP
save test_y test_y
save train_y train_y
