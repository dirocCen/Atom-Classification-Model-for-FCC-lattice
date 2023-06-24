function [NNindex,judge]=NNfind_2_judge(basis,bb,first_distance)
b=bb*basis;          %direct to xyz

b=roundn(b,-3);
basis=roundn(basis,-3);
judge=0;
% basis=basis(1:2,1:2);
% b=b(:,1:2);
NN=first_distance*[-1 1 0; 1 1 0; 1 -1 0;-1 -1 0; -1 0 1; 0 1 1; 1 0 1; 0 -1 1;  -1 0 -1; 0 1 -1; 1 0 -1; 0 -1 -1];         % FCC�����ԭ�Ӿ�����1,��12��;   �ν�����2^(1/2),��6��
NNindex=zeros(size(b,1),size(NN,1));
all=[];
for ii=-4:4
    for jj=-4:4
        for kk=-4:4
              tb=b+repmat([ii jj kk]*basis,size(b,1),1);          
              all=[all
              tb];
        end
    end
end

xyz=[all repmat((1:size(b,1))',size(all,1)/size(b,1),1)];
for ii=1:size(b,1)       % ԭ����Ŀ
    for jj=1:size(NN,1)    % �������Ŀ
        tp=b(ii,:)+NN(jj,:);
        dtp=sum((repmat(tp,size(all,1),1)-all).^2,2);
        [q,qq]=min(dtp);
        NNindex(ii,jj)=xyz(qq,4);
        if q>1
            'error';
            judge=1;
        end
    end
end

 