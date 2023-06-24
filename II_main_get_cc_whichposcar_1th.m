clear

load  13atoms_fcc_envir_notINatoms.mat
ind=0;
CC=[zeros(1,size(cluster,1)-1),1];         % ��ʼ�������滻�ṹ
whichposcar=[1,0,0,0];  
maxn=10;      % ԭ����


for  n=1:maxn
         path = ['primitive_cell\extend_cell-',num2str(n)];
%          path = ['/home/cenyj/FCC/extend_cell/extend_cell-',num2str(n)];
         
         File = dir(fullfile(path,'cell_*')) ;           % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.txt�ļ���������Ϣ
         maxi = size({File.name}',1) ;                            % ��ȡ���Ϻ�׺��Ϊ.txt�������ļ����ļ�����ת��Ϊn��1��

    for i=0:maxi-1    % ԭ������
          primitive=[path,'\cell_v',num2str(n),'_id',num2str(i),'.vasp'];   % ԭ��λ��
          path1=['seq\poscar-v-',num2str(n),'\poscar-v-',num2str(n),'-',num2str(i)];
%           path1=['/home/cenyj/FCC/seq/poscar-v-',num2str(n),'/poscar-v-',num2str(n),'-',num2str(i)];
               
                 for k=1:n
%                        seq=[path1,'/all_seq_',num2str(k)];
                       seq=[path1,'\all_seq_',num2str(k)];
                       [c,line]=get_correlation_2th(primitive,seq,cluster,perms_1);
                       CC=[CC;c];
                       ind=ind+1;
                       
                       tmp = [repmat([n,i,k],line,1) (1:line)'];
                       whichposcar=[whichposcar;tmp];
                 end
    end
end

name = ['result_1_',num2str(maxn),'atom_2thEnvir_CC_whichposcar'];
save(name,'CC','whichposcar')

