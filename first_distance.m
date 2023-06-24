function   d=first_distance(basis,bb)

b=bb*basis;          %direct to xyz
all=[];
for ii=-1:1
    for jj=-1:1
        for kk=-1:1      
              tb=b+repmat([ii jj kk]*basis,size(b,1),1);          
              all=[all
              tb];
        end
    end
end
dtp=sqrt(sum((repmat(b(1,:),size(all,1),1)-all).^2,2));
dtp=roundn(dtp,-3);
tmp=unique(dtp);
d=tmp(2);
