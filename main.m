clc
clear;
him = double(cell2mat(struct2cell(load('./data/Indian_pines.mat'))));
%the data cube is three dimention m*n*l
[m,n,l ]=size(him);
him=reshape(him,m*n,l);
t=max(max(him));
him=him/t;
w=ones(l-1,l);
for i=1:l
    p=him;
    p(:,i)=[];
    [w(:,i),e(i)]=NNLS(p,him(:,i));
end
t=zeros(l,l);
for i=1:l
    for j=1:l
        if i==j
            t(i,j)=e(i);
        elseif i<j
            t(i,j)=w(i,j-1)';
        else
            t(i,j)=w(i-1,j)';
        end
    end
end
o=zeros(1,l);
for i=1:l
    o(1,i)=norm(t(:,i));
end
[B,I]=sort(o);


