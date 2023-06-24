function [CC,line]=get_correlation_2th(primitive,seq,cluster,perms_1)

[basis,bb,~]=read_poscar(primitive);
n=size(bb,1);
[L,line]=position_square(n,seq);

NNindex_2=NNfind_2(basis,bb,0.70710678);
 
CC=[];
for kk=1:size(bb,1)
        L_original=[L(:,kk) L(:,NNindex_2(kk,1)) L(:,NNindex_2(kk,2)) L(:,NNindex_2(kk,3)) L(:,NNindex_2(kk,4)) L(:,NNindex_2(kk,5)) L(:,NNindex_2(kk,6)) L(:,NNindex_2(kk,7)) L(:,NNindex_2(kk,8)) L(:,NNindex_2(kk,9)) L(:,NNindex_2(kk,10)) L(:,NNindex_2(kk,11)) L(:,NNindex_2(kk,12))];
        tmp_CC=transform_2(perms_1,L_original,cluster);
        if kk==1
            CC=tmp_CC;
        else
            CC=CC+tmp_CC;
        end
        
end
CC=CC/size(bb,1);

