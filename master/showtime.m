
n = [2^2, 2^3,2^4,2^5,2^6,2^7,2^8,2^9,2^10,2^11,2^12];
load('t1.mat');
load('t2.mat');
load('t3.mat');
load('t4.mat');

plot(log(n)/log(2),t1,'-*y',log(n)/log(2),t2,'--+b',log(n)/log(2),t3,':ok',log(n)/log(2),t4,'-.r'); 