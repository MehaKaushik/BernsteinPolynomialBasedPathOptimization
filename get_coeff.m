function [ coeff ] = get_coeff( t,to,tf )


u=(t-to)/(tf-to);


B0=(1-u).^5;
B1=5*((1-u).^4)*u;
B2=10*((1-u).^3)*(u.^2);
B3=10*((1-u).^2)*(u.^3);
B4=5*((1-u).^1)*(u.^4);
B5=(u.^5);

coeff = [B0,B1,B2,B3,B4,B5];

end

