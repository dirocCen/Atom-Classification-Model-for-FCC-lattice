function  [L,line]=position_square(n,seq)
% 跟考虑到第几近邻的环境无关

%seq=['C:\Users\CYJ\Documents\MATLAB\ungraduate\ising_model\square_method3\seq\poscar-v-9\poscar-v-9-0\all_seq_6'];
fid=fopen(seq,'rt');
tmp=strsplit(seq,'_');
sizeA=[str2num(cell2mat(tmp(end))) Inf];
A = fscanf(fid,'%d',sizeA)';
fclose(fid);

L=ones(size(A,1),n);
for ii=1:size(A,1)
     L(ii,A(ii,:)+1)=0;
end
line=size(A,1);
