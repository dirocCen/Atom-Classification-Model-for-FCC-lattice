function NNindex=NNfind_1(basis,bb,first_distance)
%     if (nargin<3)
%         param3 = 0.70710678;
%     end
b=bb*basis;          %direct to xyz
% basis=basis(1:2,1:2);
% b=b(:,1:2);
NN=first_distance*[-1 1 0;-2 0 0;-1 -1 0;-1 0 1;-1 0 -1];         % FCC�����ԭ�Ӿ�����1,��12��;   �ν�����2^(1/2),��6��
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
        if q>0.1
            'error'
        end
    end
end

 