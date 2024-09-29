function T=convert_labels_binary_vec(labels,class_no)
G=labels;
G_unique=1:class_no;
E=eye(numel(G_unique));
for i=1:numel(labels)
    for j=1:numel(G_unique)
        if(G(i)==G_unique(j))
            T(:,i)=E(:,j);
        end
    end
end
end