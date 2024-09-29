function feat=extractFDFeatures(I)
[M,N]= size(I);
%------- performing non-linear filtering on a varying size pixel block -------%
for r=2:7
rc = @(x) floor(((max(x)-min(x))/r))+ 1; % non-linear filter
F= colfilt(I, [r r],'sliding', rc);
B{r}= log(double(F * (49/(r^2))));
end
i=log(2:7); % Normalised scale range vector
%------- computing the slope using linear regression -------%
Nxx=dot(i,i)-(sum(i)^2)/6;
for m = 1:M
    for n = 1:N
        fd= [B{7}(m,n), B{6}(m,n), B{5}(m,n), B{4}(m,n), B{3}(m,n), B{2}(m,n)]; % Number of boxes multiscale vector
        Nxy=dot(i,fd)-(sum(i)*sum(fd))/6; 
        FD(m, n)= (Nxy/Nxx); % slope of the linear regression line
    end
end
feat=FD(:);