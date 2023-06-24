clear

maxn=10;
name = ['result_1_',num2str(maxn),'atom_2thEnvir_CC_whichposcar'];
load(name)

tmp1=whichposcar(:,1);
n2=4 ;       % 算到第几个分量

% component
N_conv=[];
for ii=1:maxn
    tmp3=find(tmp1==ii, 1, 'last' );
    CC1 = unique(CC(1:tmp3,:),'rows');
    
    CC2 = sort(CC1,2);
    tmp4=[];
    for jj=1:n2
        itp = find((CC2(:,end-jj)==0)==1);
        [M_convex,~]=Linp_conv2(CC1(itp,:));
        tmp4=[tmp4;size(M_convex,1)];
    end
    N_conv=[N_conv,tmp4];
end

for ii=size(N_conv,1):-1:2
    N_conv(ii,:) = N_conv(ii,:)-N_conv(ii-1,:);
end
save(name,'N_conv','-append')
save(name,'M_convex','-append')

N_atom=1:maxn;
plot(N_atom,N_conv(1,:),'o-')
hold on
plot(N_atom,N_conv(2,:),'o-')
plot(N_atom,N_conv(3,:),'o-')
plot(N_atom,N_conv(4,:),'o-')
xlabel("cell atoms number")
ylabel("convex number")
legend('1 component','2 component','3 component','4component')
title("FCC lattice")




