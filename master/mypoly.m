clear all;close all;clc;
n = [10 50 150 200 300 400 500 10000 20000 50000 100000];
%n = [2];                   %����ʹ��
x = input('Please enter x:');

for i = 1 : size(n,2)
    
    a = rand(1,n(i)+1);
    %a = [1 2 3];           %����ʹ��
    
    y1(i) = a(1);           %����1��ֱ�Ӽ��㷨
    tStart = tic;
    for j = 2 : size(a,2)
        y1(i) = y1(i) + a(j) * x^(j-1);
    end
    t1(i) = toc(tStart);
    
    y2(i) = a(1);           %����2����P�ݹ�
    tStart = tic;
    for j = 2 : size(a,2)
        y2(i) = y2(i) + a(j) * x^(j-1);
    end
    t2(i) = toc(tStart);
    
    y3(i) = a(1);           %����3����P��X�ݹ�
    q = 1;
    tStart = tic;
    for j = 2 : size(a,2)
        q = q * x;
        y3(i) = y3(i) + a(j) * q;
    end
    t3(i) = toc(tStart);
    
    y4(i) = a(size(a,2));   %����4����P�ݹ�
    len = size(a,2);
    tStart = tic;
    for j = 1 : ( size(a,2)-1 )
        y4(i) = y4(i) * x + a(len-j);
    end
    t4(i) = toc(tStart);
    
end


semilogx(n,t1,'-*y',n,t2,'--+b',n,t3,':ok',n,t4,'-.r'); 


xlabel('N(���ݹ�ģ)' ); 
ylabel('ʱ������'); 
title('����ʽ��ֵ4���㷨�Ƚ�')
