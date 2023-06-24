clear

maxn=10;
name = ['result_1_',num2str(maxn),'atom_2thEnvir_CC_whichposcar'];
load(name)

% 只要1-4分量的结构
CC1 = sort(CC,2);
tmp = CC1(:,end-3)==0;
ind = find(tmp==1);
CC2=CC(ind,:);
w=whichposcar(ind,:);

CC3= unique(CC2,'rows');
[M_convex,~]=Linp_conv2(CC3);

% 找凸点对应的poscar
M_convex_ind=[];
for ii=1:size(M_convex,1)
      tmp = find(ismember(CC,M_convex(ii,:),'rows')==1);
      tmp =  tmp(1); 
      M_convex_ind=[M_convex_ind;tmp];
end
save(name,'M_convex','M_convex_ind','-append')



