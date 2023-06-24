function [CC,line]=get_correlation_1th(primitive,seq,cluster,perms_1)

[basis,bb,~]=read_poscar(primitive);
n=size(bb,1);
[L,line]=position_square(n,seq);

NNindex_1=NNfind_1(basis,bb);
 
CC=[];
for kk=1:size(bb,1)
        L_original=[L(:,kk) L(:,NNindex_1(kk,1)) L(:,NNindex_1(kk,2)) L(:,NNindex_1(kk,3)) L(:,NNindex_1(kk,4)) L(:,NNindex_1(kk,5))];
        tmp_CC=transform_2(perms_1,L_original,cluster);
        if kk==1
            CC=tmp_CC;
        else
            CC=CC+tmp_CC;
        end
        
end
CC=CC/size(bb,1);

