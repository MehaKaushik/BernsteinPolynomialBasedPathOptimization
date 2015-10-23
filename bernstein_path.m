function [ xt_robo , xt_dot , kt, kt_dot, yt_robo , yt_dot, omega_t , velocity ] = bernstein_path(xo,yo,xodot,xf,yf,xfdot,xc,yc,to,tf,tc,kodot,kfdot)

B=[xo;xodot;xf;xfdot;xc];

A=[get_coeff(to,to,tf);get_berns_diff(to,to,tf);get_coeff(tf,to,tf);get_berns_diff(tf,to,tf);get_coeff(tc,to,tf)];
%X=[X1;X2;X3;X4;X5;X6];

X= pinv(A)*B;
[a1,a2,a3,a4,a5,a6] = get_integral(X(1),X(2),X(3),X(4),X(5),X(6),to,to,tf);
[a7,a8,a9,a10,a11,a12] = get_integral(X(1),X(2),X(3),X(4),X(5),X(6),to,tf,tf);
[a13,a14,a15,a16,a17,a18] = get_integral(X(1),X(2),X(3),X(4),X(5),X(6),tc,tf,tf);

L=[a1,a2,a3,a4,a5,a6;a7,a8,a9,a10,a11,a12;a13,a14,a15,a16,a17,a18;get_berns_diff(to,to,tf);get_berns_diff(tf,to,tf)];
Z=[0;yf-yo;yc-yo;kodot;kfdot];
K = pinv(Z)*L;i=1;
for t=to:0.1:tf
       
     berns = get_coeff(t,to,tf);
    
     diff =get_berns_diff(t,to,tf);

   [coefo, coef1, coef2, coef3, coef4,coef5 ]=get_integral(X(1),X(2),X(3),X(4),X(5),X(6),to,t,tf);  
   
 xt_robo(i,:) = berns(1)*X(1)+berns(2)*X(2)+berns(3)*X(3)+berns(4)*X(4)+berns(5)*X(5)+berns(6)*xf; 
 xt_dot(i,:)=diff(1)*X(1)+diff(2)*X(2)+diff(3)*X(3)+diff(4)*X(4)+diff(5)*X(5)+diff(6)*X(6); 
 kt(i,:)=berns(1)*K(1)+berns(2)*K(2)+berns(3)*K(3)+berns(4)*K(4)+berns(5)*K(5)+berns(6)*K(6);
 kt_dot(i,:)=diff(1)*K(1)+diff(2)*K(2)+diff(3)*K(3)+diff(4)*K(4)+diff(5)*K(5)+diff(6)*K(6); 
 yt_robo(i,:) = yo+K(1)*coefo+K(2)*coef1+K(3)*coef2+K(4)*coef3+K(5)*coef4+K(6)*coef5; 
 yt_dot(i,:)=xt_dot(i,:)*kt(i,:);
 omega_t(i,:) = kt_dot(i,:)./(1+kt(i,:).^2); 
 velocity(i,:)=sqrt(xt_dot(i,:)^2+yt_dot(i,:)^2);
 i = i+1;
 berns=[];
 diff=[];
 end

end

