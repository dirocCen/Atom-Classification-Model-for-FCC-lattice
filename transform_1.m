function  res = transform_1(perms_1,atoms)
% 执行对称操作，排序后返回第一个
%     tol=[];
%     for ii=1:size(perms_1,1)
%         tmp = atoms(perms_1(ii,:));
%         tol = [tol;tmp];
%     end
    tol=atoms(perms_1);
    tol=sortrows(tol);
    res = tol(1,:);
    
    
end

