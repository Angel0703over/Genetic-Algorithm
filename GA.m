function [zbest, y] = GA()
%%
%������ʼ��
popsize = 1000;                             %��Ⱥ��ģ
lenchrom = 3;                               %������Ⱦɫ�����
maxgen = 5000;                              %��������

pc = 0.7;                                   %���ý�����ʣ���������Ϊ�仯��
pm = 0.3;                                   %���ñ�����ʣ�ͬ��Ҳ��������Ϊ�仯��
%%
%��Ⱥ
bound = [-1 1;-1 1;-1 1];
%������Χ
%%
%������ʼ���Ӻ���Ӧ��
GApop = zeros(popsize,lenchrom);
fitness = zeros(popsize,1);
for n = 1:popsize
    %�������һ����Ⱥ
    GApop(n,:) = Code(lenchrom,bound);      %�����������
    %������Ӧ��
    fitness(n) = Fun(GApop(n,:));
end
%����õ�Ⱦɫ��
[bestfitness, bestindex] = min(fitness);
zbest = GApop(bestindex,:);                 %ȫ�����
fitnesszbest = bestfitness;                 %ȫ�������Ӧ��ֵ
y = zeros(1,maxgen);
%%
%����Ѱ��
for n = 1:maxgen
    %��Ⱥ���� GAѡ�����
    GApop = Select(GApop, fitness, popsize);
    %�������
    GApop = Cross(pc,lenchrom,GApop,length(GApop),bound);
    %�������
    GApop = Mutation(pm,lenchrom,GApop,popsize,[n,maxgen],bound);
    for m = 1:popsize
        fitness(m) = Fun(GApop(m,:));
        if fitness(m) < fitnesszbest
            zbest = GApop(m,:);
            fitnesszbest = fitness(m);
        end
    end
    y(n) = fitnesszbest;
end
y = y(end);
end