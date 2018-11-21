function [ s ] = fitness( x )
DEL = 10.77763891;%4.18对应
DEL = DEL*pi/180;
D = x(1);%杆高
DEL0 = x(2)*pi/180;%纬度
T0 = x(3)*pi/12;%正午时间
time = 14.7:0.05:15.7;%时间
time = time*pi/12;
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
tem = size(time');
XXXX = cos(time);
%{
if (size(find(XXXX>0)))~= max(tem)
    s = 12345678900000;
    return;
end
%}
l = sqrt(xx.^2+yy.^2);
x =D*(-sin(DEL)*cos(DEL0)+cos(DEL0)*cos(time-T0))./(sin(DEL)*sin(DEL0)+cos(DEL)*cos(DEL0)*cos(time-T0));
y = D*cos(DEL)*sin(time-T0)./(sin(DEL)*sin(DEL0)+cos(DEL)*cos(DEL0)*cos(time-T0));
L = sqrt(x.^2+y.^2);
[x,y,xy] = xuanzhuan(x,y,sqrt(x.^2+y.^2),0);
[xx,yy,xyxy] = xuanzhuan(xx,yy,sqrt(xx.^2+yy.^2),0);
xy0 = xy-xyxy';
s = sum((l-L).^2)+var(xy0);%目标函数


end

 