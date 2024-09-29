function [oa, aa, K, ua]=perf_measure(true_label,estim_label)
confu=confusion_matrix(true_label,estim_label);
oa=trace(confu)/sum(confu(:)); %overall accuracy
ua=diag(confu)./sum(confu,2);  %class accuracy
number=size(ua,1);
aa=sum(ua)/number;
Po=oa;
Pe=(sum(confu)*sum(confu,2))/(sum(confu(:))^2);
K=(Po-Pe)/(1-Pe);%kappa coefficient
end

function cm=confusion_matrix(true_label,estim_label)
classlist = unique(true_label);
L = length(classlist);
cm = zeros(L,L);
for i = 1:L
    for j = 1:L
        m = (estim_label == classlist(i) ...
           & true_label  == classlist(j));
        cm(i,j) = sum(m);
    end
end
cm = cm';
end
