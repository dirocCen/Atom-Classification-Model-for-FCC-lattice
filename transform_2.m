function  CC = transform_2(perms_1,atoms,cluster)
% 执行对称操作，排序后返回第一个对应的cluster中的哪一个

CC=[];
for ii=1:size(atoms,1)
    tmp = atoms(ii,:);
    tol=tmp(perms_1);
    tol=sortrows(tol);
    
    tmp=find(ismember(cluster,tol(1,:),'rows')==1);
    c=zeros(1,size(cluster,1));
    c(tmp)=c(tmp)+1;
    CC=[CC;c];

end

