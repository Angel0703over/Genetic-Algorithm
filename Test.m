function [ flag ] = Test( lenchrom, bound, ret )
%lenchrom   input:Ⱦɫ�峤��
%bound      input:������ȡֵ��Χ
%code       input:Ⱦɫ��ı���ֵ
%flag      output:�����Ա�־����
%��ʼ����
flag = 1;
%1:����
%0:������
for n = 1:lenchrom
    if ret(n) < bound(n,1) || ret(n) > bound(n,2)
        flag = 0;
        break
    end
end
end

