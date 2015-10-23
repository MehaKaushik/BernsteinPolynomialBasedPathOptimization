clc
clear all

%drawing the obstacles
% x y vetex_number number_of_sides
xo=0;
yo=0;
xf=1500;
yf= 1200;
vertices = [1,130,300,4;2,250,550,4;3,210,210,4;4,100,700,4;5,300,130,3;6,250,550,3;7,430,760,3;8,400,600,6;...
          9,1000,1120,6;10,150,170,6;11,1120,1000,6;12,150,500,6;13,500,150,6;14,150,600,6;15,800,220,6];
      
% drawing the polygons

%for i=1:4:12
%  %   q1=[vertices(i,2),vertices(i,3)];
%     q2=[vertices(i+1,2),vertices(i+1,3)];
%     q3=[vertices(i+2,2),vertices(i+2,3)];
%     q4=[vertices(i+3,2),vertices(i+3,3)];
%     
%     drawLine(q1,q2);
%     hold on
%     drawline(q2,q3);
%     hold on
%     drawline(q3,q4);
%     hold on
%     drawline(q4,q1);
%     hold on
% end
       
sig1 = 0.25;
sig2 = 0.35;
no_obj = 5;
x_obj1 = [2.5 4 2 2];
y_obj1 = [3 2.3 3 3];
x_obj2 = [4 4 3 3];
y_obj2 = [4 3 3 4];
x_obj3 = [5 7 6];
y_obj3 = [3 7.5 6];
x_obj4 = [8 5.5 6];
y_obj4 = [5 9 9];
x_obj5 = [];
y_obj5 = [];

axis([0 10 0 10])
patch( x_obj1,y_obj1,'red');
patch( x_obj2,y_obj2,'red');
patch( x_obj3,y_obj3,'red');
patch( x_obj4,y_obj4,'red');

    