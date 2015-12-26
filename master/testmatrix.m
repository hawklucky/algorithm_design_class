function testmatrix()
%clear all;close all;clc;
n = 11 : 11;
global A B 

for i = 1 : size(n,2)
    
    A = round( 1*( rand( 2^n(i) )) );
    B = round( 1*( rand( 2^n(i) )) );
    
%     t1(i) = matlabmatrix();
%     t2(i) = matrixdefine();
%     t3(i) = fenzhimatrix();
    t5(i) = fenzhidiguimatrix();
    
end
  save('t5.mat','t5');
% save('t1.mat','t1');
% save('t2.mat','t2');
% save('t3.mat','t3');
% save('t4.mat','t4');
end