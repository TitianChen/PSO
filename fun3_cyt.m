function [ s ] = fun3( x )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
DEL = 10.77763891;%4.18对应
DEL = DEL*pi/180;
D = x(1);%杆高
DEL0 = x(2);%纬度
T0 = x(3);%正午时间
time = 14.7:0.05:15.7;%时间
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
%time = time - T0;%%%%%%
%[BBB,AAA] = size(find(h>0));%%%%%%%%
tem = size(time');
%if (size(find(h>0)))~= max(tem)
%附件1 find((max(time)-6<T0))
%%%%%%%find(T0<min(time)))
%%%%%%%find(abs(DEL)<23.5)
%%%%%%%find(abs(del0)<90)
%%%%%%%find(d>0)
%if (size(find(max(time)-6<T0) && (T0<min(time))))~= max(tem)%%%%%%??????
if (size(find(max(time)-6<T0)))~= max(tem)%%%%%%??????
    s = 12345678900000;
    return;
end
l = sqrt(xx.^2+yy.^2);
L = abs(d*sqrt((-sin(DEL)*cos(DEL0*pi/180)+cos(DEL0*pi/180).*cos((time-T0)*pi/12)).^2+(cos(DEL)*sin((time-T0)*pi/12)).^2)/(sin(DEL)*sin(DEL0*pi/180)+cos(DEL)*cos(DEL0*pi/180)*cos((time-T0)*pi/12)));
%LL = sqrt(xx.^2+yy.^2);%数据长
% s = sum(abs(y'-yy)+abs(x'-xx));
% s = s+sum(abs(LL-L'));
%目标函数;

SSE = sse(l-L);
i = length(T);
ave_l = sum(l)/i;
ave_L = sum(L)/i;
ave2_lL = (ave_l+ave_L)/2;
SST = sum((l-ave2_lL).^2)+sum((L-ave2_iL).^2);
R_square = 1-SSE/SST;
s = abs(R_square-1);




s = sum((LL-L').^2);%目标函数
[x,y,d1] = xuanzhuan(x,y,sqrt(x.^2+y.^2),0);
[xx,yy,d2] = xuanzhuan(xx,yy,sqrt(xx.^2+yy.^2),0);
d0 = d1-d2';
s = s+var(d0);%目标函数
end

 