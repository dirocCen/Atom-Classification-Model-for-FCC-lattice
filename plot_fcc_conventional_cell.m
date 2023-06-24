clear


path = 'C:\Users\CYJ\Documents\MATLAB\ungraduate\ising_model\not_in_atoms\FCC\convex1_16_poscar\31struct\POSCAR2';

n1=1;n2=1;n3=1;prec=1e-3;

[basis,bb,a]=read_poscar(path);
if size(a,2)==1
    num=zeros(1,str2num(a{2}));
else
    num=[zeros(1,str2num(a{2,1})) ones(1,str2num(a{2,2}))];
end

b=bb*basis;          %direct to xyz

bb_expand = [];
for ii=-5:5
    for jj=-5:5
        for kk=-5:5
              tb=[b+repmat([ii jj kk]*basis,size(b,1),1) (1:size(b,1))'];          
              bb_expand=[bb_expand;tb];
            
        end
    end
end
        
itp1 = first_distance(basis,bb) * sqrt(2);

rod = [];
for ii=0:n1
    for jj=0:n2
        for kk=0:n3
              rod=[rod;[ii jj kk]*itp1];  
        end
    end
end

tmp1 = (-prec<=bb_expand(:,1)) & (bb_expand(:,1)<=(itp1*n1+prec)) ;
tmp2 = (-prec<=bb_expand(:,2)) & (bb_expand(:,2)<=(itp1*n2+prec)) ;
tmp3 = (-prec<=bb_expand(:,3)) & (bb_expand(:,3)<=(itp1*n3+prec)) ;
ind1 = tmp1 & tmp2 & tmp3;
ind2 = find(ind1==1);


bb_p=bb_expand(ind2,:);
itp2 = num(bb_p(:,4));
tmp = unique(itp2);
if length(tmp)==1
    if tmp==0
        bb_p1=bb_p(:,1:3);
        bb_p2=[];
    else
        bb_p1=[];
        bb_p2=bb_p(:,1:3);
    end
else
itp3 = find(itp2==tmp(1));
itp4 = find(itp2==tmp(2));

bb_p1 = bb_p(itp3,1:3);
bb_p2 = bb_p(itp4,1:3);

end


% »­Í¼²¿·Ö

for ii=1:size(rod,1)-1
      for jj=2:size(rod,1)
            tmp = sqrt(sum((rod(jj,:)-rod(ii,:)).^2));
            if tmp == itp1
                tmp1=[rod(ii,:);rod(jj,:)];
                plot3(tmp1(:,1),tmp1(:,2),tmp1(:,3),'-','Color','#606060','linewidth',2)
                hold on
            end
      end
end

plot3(bb_p1(:,1),bb_p1(:,2),bb_p1(:,3),'.','MarkerSize',40,'Color',[0 0.4470 0.7410])
hold on
plot3(bb_p2(:,1),bb_p2(:,2),bb_p2(:,3),'.','MarkerSize',40,'Color',[0.8500 0.3250 0.0980])

set(gca,'XColor','white')
set(gca,'YColor','white')







