clear
clc
clf


path = 'C:\Users\CYJ\Documents\MATLAB\ungraduate\ising_model\not_in_atoms\FCC\convex1_16_poscar\31struct\POSCAR8';

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


% 画图部分

for ii=1:size(rod,1)-1
      for jj=2:size(rod,1)
            tmp = roundn(sqrt(sum((rod(jj,:)-rod(ii,:)).^2)),-3);
            if tmp == roundn(itp1,-3)
                tmp1=[rod(ii,:);rod(jj,:)];
%                 line(tmp1(:,1),tmp1(:,2),tmp1(:,3),'Color','#606060','linewidth',2)
                
                drawCylinder([rod(ii,:)  rod(jj,:)  0.015], 'facecolor', [176,196,222]/255);
                
                hold on
            end
      end
end

% plot3(bb_p1(:,1),bb_p1(:,2),bb_p1(:,3),'.','MarkerSize',40,'Color',[0 0.4470 0.7410])
hold on
% plot3(bb_p2(:,1),bb_p2(:,2),bb_p2(:,3),'.','MarkerSize',40,'Color',[0.8500 0.3250 0.0980])

for ii = 1:size(bb_p1,1)
    drawSphere([bb_p1(ii,:) 0.075],'facecolor',[86,152,195]/255)
%     plot3(bb_p1(ii,1),bb_p1(ii,2),bb_p1(ii,3),'.','MarkerSize',40,'Color',[0 0.4470 0.7410])

end

for ii = 1:size(bb_p2,1)    
    drawSphere([bb_p2(ii,:) 0.075],'facecolor',[239,52,115]/255)
%     plot3(bb_p2(ii,1),bb_p2(ii,2),bb_p2(ii,3),'.','MarkerSize',40,'Color',[0.8500 0.3250 0.0980])
end

% 阴影坐标
%%(110)
% pts = [   
%    -1    4.1899    1.4435
%     1.2794    4.1909    -1
%     3.7    4.2057    1.4606
%     1.2716    4.2201    4
%    ];
%(111)
% pts =[
%    -0.0666    1.3846    0.0175
%     1.3520    2.8007    0.0314
%    -0.0669    2.8067    1.4402
% ];
% pts=[
%         1.3492    2.8615    0.0175
%    -0.0713    2.8436    1.4317
%     1.4142    1.4290    1.4114
%     ];
% pts=[
%         0.6374   -0.0187    0.7275
%     1.4142    1.4103    0.0145
%    -0.0697    2.8097    0.0204
%    ];
% pts=[
%     1.4142    2.8299    0.0149
%     -0.0738    2.8401    0.0059       
%    -0.0692    0.0036    1.4429
%     1.4142   -0.0075    1.4012
% ];
% pts=[
%         1.3604    1.4578    0.0287
%    -0.0567    1.4469    1.4509
%     1.3575    0.0327    1.4509];
% pts=[
%         1.4142    0.0010    1.4292
%    -0.0729    0.0000    1.3967
%    -0.0741    1.4259    1.4142
%     1.4142    1.4281    1.4200];
% pts=[
%         1.4142    2.8401    1.4236
%    -0.0713    2.8284    1.4374
%    -0.0747    1.4181    0.0059
%     1.4142    1.4251    0.0103];
% pts=[
%         1.4120    1.4142   -0.0148
%     1.3949   -0.0722    0.0059
%     1.4025   -0.0738    1.4083
%     1.3997    1.4142    1.4180];
% pts=[
%        -0.0116   -0.0732    0.0117
%     1.4142   -0.0722    0.0204
%     1.4097    1.4142    1.3999
%    -0.0117    1.3402    1.4172];
% pts=[
%         2.0984   -0.5705    0.7188
%     2.0948    0.6380    -0.5117
%     2.1023    1.8432    0.7217
%     2.0950    0.6384    1.8288];
pts=[
        0.6984   -0.5705    0.7188
    0.6948    0.6380    -0.5117
    0.7023    1.8432    0.7217
    0.6950    0.6384    1.8288];


fill3(pts(:,1),pts(:,2),pts(:,3),[0.4660 0.6740 0.1880],'facealpha',0.6,'edgecolor','none')
% fill3(pts1(:,1),pts1(:,2),pts1(:,3),[0.4660 0.6740 0.1880],'facealpha',0.6,'edgecolor','none')


axis equal
axis off
% view(-75,19)     % 调整视图角度(111)
%view(52,26)     % 调整视图角度
% view(-78,19)     % 调整视图角度,(110)
% view(-108,17)       %
% view(-100,22)
% view(-99,7)
% view(-106,13)
% view(-112,15)
% view(-81,17)
% view(-13,12)
% view(-78,12)
% view(-78,12)
% view(-14,17)
view(-14,17)
% view(-94,11)


light('position',[-1 -1 1])

set(gcf,'color','w')       % 背景颜色设置为
% export_fig  acm_1-2comp_PoscarPicture\POSCAR8  -m4       % 保存图片





