function text_modify(filename_ini,filename_new,new_contents,line)
%��ȡ�ļ����е��ļ������µ�����new_contents�滻line�еľɵ�����old_contents

% ��ȡ�ļ����޸�
 fileID = fopen(filename_ini,'r+');                    %�Կɶ�д�ķ�ʽ�򿪴��޸ĵ��ļ�
 i=0;
 while ~feof(fileID)
        tline=fgetl(fileID);                              %���ж�ȡԭʼ�ļ�
        i=i+1;
        newline{i} = tline;                               %�����¶������ԭʼ�ļ�ÿ������
        if i==line                                        %�ж��Ƿ񵽴���޸ĵ���
            newline{i} = strrep(tline,tline,new_contents);%�滻�����������޸ĵ���ȫ���滻Ϊ������
        end
    end
    fclose(fileID);                                       %�ر��ļ�
    
% ����ı�
    fileID = fopen(filename_new,'w+');                    %�Կɶ�д�ķ�ʽ������ļ����ļ�������������ļ����ݴ��ļ�ͷ����ʼд����������������ļ����������ļ���ֻд��
    for k=1:i
        fprintf(fileID,'%s\n',newline{k});              %��newline�ڵ���������д��
    end
    fclose(fileID);                                       %�ر��ļ�
end