function [ diff ] = get_berns_diff( t,to,tf )

u=(t-to)/(tf-to);

B0dot=-5*((1-u).^4);
B1dot=-20*((1-u).^3)*u + 5*((1-u).^4);
B2dot=-30*((1-u).^2)*(u.^2) + 20*((1-u).^3)*(u);
B3dot=-20*(1-u)*(u.^3) + 30*((1-u).^2)*(u.^2);
B4dot=20*((1-u))*(u.^3) -5*(u.^4);
B5dot=5*(u.^4);


diff=[B0dot,B1dot,B2dot,B3dot,B4dot,B5dot];

end

