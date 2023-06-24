clear

path = 'convex1_16_poscar\31struct';
File = dir(fullfile(path,'poscar*')) ;           % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.txt�ļ���������Ϣ
 
ele={'Ag Au','Ag Pd','Au Pd','Cu Au','Cu Pd','Mo Ta','Mo W','Ta W'};
name1 ={'Ag_Au','Ag_Pd','Au_Pd','Cu_Au','Cu_Pd','Mo_Ta','Mo_W','Ta_W'};

for jj=1:size(ele,2)
    dirname = ['convex1_16_poscar\', name1{jj}];
    mkdir(dirname);

    replaceLine = 6;     %ָ�����滻�У�����7���滻
    myformat = '%s';   %�����ʽ��ע�⣺\n������
    newData = ele{jj};         %�滻����
    name = {File.name}';
    maxi = size(name,1); 

    for ii=1:maxi
%         source_name=[path,'\',name{ii}];
        des_name = [dirname,'\POSCAR',num2str(ii)];
        text_modify(des_name,des_name,newData, replaceLine)
    end

end




