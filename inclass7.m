clc;close all;clear;
A = [0.5, 0.1, 0.4; 0.2, 0.7, 0.1; 0.5, 0.3, 0.2];
B = [0.5, 0.3, 0.2; 0.3, 0.2, 0.5; 0.1, 0.6, 0.3];
I = [1/3, 1/3, 1/3];
O = [1,3,2,3,1];
y=viterbi(A,B,I,O)
function y=viterbi(A,B,I,O)
y={};
t=I;
t=t.*transpose(B(:,O(1)));
index=1
for jj=2:length(O)
    j=O(jj);
    tb=[];
    ntl=[];
    for i=1:length(A)
        stl=t.*transpose(A(:,i));
        tb(i)=find(stl==max(stl));
        ntl(i)=max(stl).*B(i,j);
    end
    y{index}=tb;
    index=index+1;t=ntl;
end
index=1;
res(index)=find(t==max(t));
for i=1:length(y)
    a=y{i};
    res(index+1)=a(res(index));
    index=index+1;
end
y=flip(res);
end