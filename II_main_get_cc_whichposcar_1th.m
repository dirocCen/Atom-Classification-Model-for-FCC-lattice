clear

load  13atoms_fcc_envir_notINatoms.mat
ind=0;
CC=[zeros(1,size(cluster,1)-1),1];         % 初始不参与替换结构
whichposcar=[1,0,0,0];  
maxn=10;      % 原子数


for  n=1:maxn
         path = ['primitive_cell\extend_cell-',num2str(n)];
%          path = ['/home/cenyj/FCC/extend_cell/extend_cell-',num2str(n)];
         
         File = dir(fullfile(path,'cell_*')) ;           % 显示文件夹下所有符合后缀名为.txt文件的完整信息
         maxi = size({File.name}',1) ;                            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列

    for i=0:maxi-1    % 原胞类型
          primitive=[path,'\cell_v',num2str(n),'_id',num2str(i),'.vasp'];   % 原胞位置
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

