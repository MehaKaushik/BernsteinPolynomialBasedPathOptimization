function [ dis ] = distance(v1,v2 )
a=v1(1);
b=v1(2);

x=v2(1);
y=v2(2);

dis= power(a-x,2)+power(b-y,2);
dis=sqrt(dis);


end

