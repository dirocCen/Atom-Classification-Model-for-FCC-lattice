function CC=get_correlation_2th_from_poscar(poscar,cluster,perms_1)

[basis,bb,atom]=read_poscar(poscar);
n=size(bb,1);
% [L,line]=position_square(n,seq);
L = ones(1,n);
itp=-1;
if sum(size(atom))==4
    itp=str2num(atom{2,1});
end
if itp~=-1
    L(1,itp+1:end)=0;
end

fd=first_distance(basis,bb)*sqrt(2)/2;
[NNindex_2,judge]=NNfind_2_judge(basis,bb,fd);
 if judge==1
    CC=0;
 else
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

 end