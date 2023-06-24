clear
%%%  perms get from sagar.compphys.cn  %%%

% read perms
filepath = 'perms_1_13atoms.txt';
fileID = fopen(filepath);
% formatSpec = '%d %d %d %d %d %d';   % txt document have 6 column
formatSpec = '%d %d %d %d %d %d %d %d %d %d %d %d %d';   % txt document have 6 column
perms_1 = textscan(fileID, formatSpec);
fclose(fileID);
perms_1 = cell2mat(perms_1);

% get "SSS"
n=13;
pos1=[];
aa=n-1:-1:0 ;
for ii=1:2^n
     pos1(ii,:)=mod(floor((ii-1)*ones(1,n)./(2.^aa)),2) ;
end

cluster=[];
for ii=1:size(pos1)
    tmp = pos1(ii,:);
    tmp1=  transform_1(perms_1, tmp);
    cluster=[cluster;tmp1];
end
cluster = unique(cluster,'rows');

save('13atoms_fcc_envir_notINatoms','cluster','perms_1')





