clear
close all
clc

M=[0.6	0.58689888	0.433748584	0.869565217	0.136363636	0.666666667	0.675
0.69	0.682781621	0.569743234	0.565217391	0.590909091	0.8	0.775
0.77	0.761487154	0.679710347	0.739130435	0.681818182	0.8	0.825];

bar(categorical({'OA','AA','Kappa'}),M(:,1:3)');
legend('FD','LBP','Proposed');ylabel('Accuracy');

figure;
bar(categorical({'Class1','class2','Class3','Class4'}),M(:,4:end)');
legend('FD','LBP','Proposed');ylabel('Accuracy');