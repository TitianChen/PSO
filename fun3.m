function [ s ] = fun3( x )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
N = datenum(2015,4,18)-datenum(2015,1,1);%ʱ��
F = x(2);%γ��
H = abs(x(1));%���Ӹ߶�
d = x(3);%ʱ���
time = 14.7:0.05:15.7;%ʱ��
xxyy = [0.4973	1.149625826
0.5029	1.182198976
0.5085	1.215296955
0.5142	1.249051052
0.5198	1.28319534
0.5255	1.317993149
0.5311	1.353364049
0.5368	1.389387091
0.5426	1.426152856
0.5483	1.463399853
0.5541	1.501481622
0.5598	1.540231817
0.5657	1.579853316
0.5715	1.620144515
0.5774	1.661270613
0.5833	1.703290633
0.5892	1.74620591
0.5952	1.790050915
0.6013	1.835014272
0.6074	1.880875001
0.6135	1.927918447];
xx = xxyy(:,1);
yy = xxyy(:,2);
time = time - d;
NS = 23.45*sin(2*pi*(284+N)/365)/180*pi;%��γ��
P = (time-12)*15/180*pi;%ʱ��
h = sin(F)*sin(NS)+cos(F)*cos(NS)*cos(P);
h = asin(h);%̫���߶Ƚ�
[BBB,AAA] = size(find(h>0));
tem = size(time');
if (size(find(h>0)))~= max(tem)
    s = 12345678900000;
    return;
end
time = time(find(h>0));
h = h(find(h>0));
P = (time-12)*15/180*pi;%ʱ��
A = cos(NS).*sin(P)./cos(h);
A = asin(A);%̫����λ��
[max_A,nA] = max(A);
A(nA:end) = 2*max_A-A(nA:end);
[min_A,nnA] = min(A);
A(1:nnA) = 2*min_A-A(1:nnA);
L = H./tan(h);
x = L.*sin(A);
y = L.*cos(A);
LL = sqrt(xx.^2+yy.^2);%���ݳ�
% s = sum(abs(y'-yy)+abs(x'-xx));
% s = s+sum(abs(LL-L'));
%Ŀ�꺯��;
s = sum((LL-L').^2);%Ŀ�꺯��
[x,y,d1] = xuanzhuan(x,y,sqrt(x.^2+y.^2),0);
[xx,yy,d2] = xuanzhuan(xx,yy,sqrt(xx.^2+yy.^2),0);
d0 = d1-d2';
s = s+var(d0);%Ŀ�꺯��
end

