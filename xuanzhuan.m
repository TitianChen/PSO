function [x,y,d] = xuanzhuan( x,y,l,dd )
%×ø±ê±ä»»
d = asin(y./l);
for i = 1:max(size(x))
    if (y(i)<0)
        if (x(i)>0)
            d(i) = 2*pi+d(i);
        else
            d(i) = pi-d(i);
        end
    else
        if (x(i)<0)
            d(i) = pi-d(i);
        end
    end
end
d = d+dd;
x = cos(d).*l;
y = sin(d).*l;
end

