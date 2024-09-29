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
        features = [features extractFDFeatures(train_x(:,:,j,i))'];
    end
    all_feat_train_FD(i,:)=features;
    i
end

for i=1:ts_sample
    features=[];
    for j=1:4
        features = [features extractFDFeatures(test_x(:,:,j,i))'];
    end
    all_feat_test_FD(i,:)=features;
    i
end

save all_feat_test_FD all_feat_test_FD
save all_feat_train_FD all_feat_train_FD
save test_y test_y
save train_y train_y



