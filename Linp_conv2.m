function   [M_convex,UU]=Linp_conv2(MM2)
%����ϵ������mxn��n��ά��,m�ǽṹ��,Dim��ά�� n
%���ص�M_convex��͹���Ӧϵ����UU��ϵ��������͹���Ӧ������


warning off
%����ϵ����Ϊ0��͹��
Dim=size(MM2,2);
con=[];
for i=1:size(MM2,1)
      if length(find(MM2(i,:)==0))==size(MM2,2)-1
          con=[con;i];
      end
end

% for i=1:size(MM2,1)
%       if length(find(MM2(i,:)==0))==size(MM2,2)-2
%           con=[con;i];
%       end
% end
M_convex=MM2(con,:);

tempMM2=MM2;
for j=1:size(MM2,2)-1
        a=[];
        for i=1:size(tempMM2,1)
              if (length(find(tempMM2(i,:)==0))==size(MM2,2)-1-j)
                    a=[a;find(tempMM2(i,:)~=0) i];
              end
        end
        aa=unique(a(:,1:end-1),'rows');
        
        
        N = Dim;     %ά��
        AA_yu=randperm(N);
        AA_yu = sort(AA_yu);
        %ֻȡ��Ϊ���ά������ʾ
        tempM_convex5=[];tempcon=[];
        for i=1:size(aa,1)
             aa_yu=AA_yu;
             aa_yu(aa(i,:))=[];
             b=a(ismember(a(:,1:end-1),aa(i,:),'rows'),:);
             
             M_test=[tempMM2(b(:,end),aa(i,:)) b(:,end)];
             
             tempM_convex1=M_convex ;
             tempM_convex1=tempM_convex1(ismember(tempM_convex1(:,aa_yu),zeros(1,size(aa_yu,2)),'rows'),:) ;    % ǰ���͹����������ά��Ϊ0�ĵ�
             tempM_convex2=tempM_convex1(:,aa(i,:)) ; 
             
             tempM_test=M_test ; 
             tempcon1=[];
             tempM_convex6=[];  %���������for������͹��
             for k=1:size(M_test,1)
                   tempM_test(1,:)=[];
                   tempM_convex3=[tempM_convex2;tempM_convex6;tempM_test(:,1:end-1)];
                   if  isempty(tempM_convex3)==1 
                        judge=0;
                   else
                        [~,judge]=estCon_linp2(tempM_convex3,M_test(k,1:end-1));   %��͹��
                   end
                   if (judge==0)
                        tempcon1=[tempcon1;M_test(k,end)];
                        tempM_convex6=[tempM_convex6;M_test(k,1:end-1)];
                    end
             end
             tempcon=[tempcon;tempcon1];
%             tempM_convex5=[tempM_convex5;tempM_convex6];
                 
        end
        M_convex=[M_convex;tempMM2(tempcon,:)];
        if (isempty(a)~=1)
            tempMM2(a(:,end),:)=[];            
        end
end

UU=[];
for ii=1:size(M_convex,1)
      U=find(M_convex(ii,:)==MM2,1);
      UU=[UU;U];
end




