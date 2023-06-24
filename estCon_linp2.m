function   [XX,judge]=estCon_linp2(M_convex,test)
% M_convex ��������ʾ�ĵ㣬 test�Ǳ���ʾ��  �� ��ʽ��mxn �� m�ǽṹ�� ��n��ά��
% judge����1�ǿ��Ա���ʾ������0�ǲ���

% options = optimoptions('linprog','Algorithm','interior-point','Display','off');    % �ڵ㷨
options=optimset('Display','off');      %�����η�(Ĭ��)
% options = optimoptions('linprog','PreProcess','none');

          A=M_convex';
          b=test';
          B=[A b];
          n=length(A(1,:));
          rA=rank(A);
          rB=rank(B);
          XX=[];
         if (rA==rB && rA==n)
              X=roundn(A\b,-5);
              if(roundn(sum(X),-3)==1  && sum(X>=0 & X<=1)==length(X))
                  judge=1;
%                   M_convexNew=[M_convex;test];
              else
                   judge=0;
                  XX=zeros(1,size(M_convex,1));
%                   M_convexNew=M_convex;
              end
        end

        if (rA==rB && rA<n)
                Y0=A\b;%��÷���η�����Ax=B��һ���ؽ�X0   
                
                if (sum(isnan(Y0))>0 || sum((A*Y0-b).^2)>10^4 )
                    [res,p]=rref([A b])  ;
                    uu=res(1:length(p),p)\res(1:length(p),end);
                    Y0=zeros(1,n);
                    Y0(p)=uu;
                    Y0=Y0';
                end
                
                
                
                    
                    Y=null(A,'r') ;%�����η�����Ax=0 �Ļ�����ϵY  
                    U=[Y;-Y;zeros(1,size(Y,2))];   %U����A
                    U=[U ones(size(U,1),1)];
                    b2=[ones(length(Y0),1)-Y0;Y0;0];
                    Aeq=[sum(Y,1) 0] ;
                    beq=1-sum(Y0) ;
                    
                    f=[zeros(1,size(Y,2)) -1];
                    [k1,~,exitflag1,~,~]=linprog(f,U,b2,Aeq,beq,[],[],options);
                    
                    if( exitflag1==1)
                            Z=roundn(k1(end),-5);
                            if(Z==0)
                                 judge=1;
                                 tempX=roundn(Y0+Y*k1(1:end-1),-8);
                                 XX=tempX';   
                            else
                                 judge=0;
                                 XX=zeros(1,size(M_convex,1));
                            end           
                    else
                          judge=0;
                           XX=zeros(1,size(M_convex,1));
                    end                
                
            end
                
         if (rA~=rB)
               judge=0;
               XX=zeros(1,size(M_convex,1));
         end
         







