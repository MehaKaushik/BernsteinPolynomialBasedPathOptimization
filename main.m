clc;
clear all;
xo = 0;
yo = 0;
r_robo = 0.25;           % for robot


no_obj = 4;
x_obj1 = [430 760 760 430];
y_obj1 = [400 400 600 600];
x_obj2 = [1000 1120 1120 1000];
y_obj2 = [150 150 700 500];
x_obj3 = [500 800 600];
y_obj3 = [150 150 220];
x_obj4 = [800 550 600];
y_obj4 = [700 900 1100];
%x_obj5 = [];    
%y_obj5 = [];

axis([0 1300 0 1300])
patch( x_obj1,y_obj1,'red');
hold on;
patch( x_obj2,y_obj2,'red');
hold  on;
patch( x_obj3,y_obj3,'red');
hold on;
patch(x_obj4 , y_obj4,'red');
hold on;

confsize = no_obj+2;
global configSpace;
edgelist=[];
global Graph;
configSpace = [xo,yo,1;x_obj1(1),y_obj1(1),2;x_obj1(2),y_obj1(2),3;x_obj1(3),y_obj1(3),4;x_obj1(4),y_obj1(4),5;x_obj2(1),y_obj2(1),6;x_obj2(2),y_obj2(2),7;x_obj2(3),y_obj2(3),8;x_obj2(4),y_obj2(4),9;x_obj3(1),y_obj3(1),10;x_obj3(2),y_obj3(2),11;x_obj3(3),y_obj3(3),12;x_obj4(1),y_obj4(1),13;x_obj4(2),y_obj4(2),14;x_obj4(3),y_obj4(3),15];
% ?????? method to get edges
edgelist=[2,3;2,4;2,5;3,4;3,5;4,5;6,7;6,8;6,9;7,8;7,9;8,9;10,11;10,12;11,12;13,14;14,15;13,15];   
array_vertexnum=[];
%array_vertexnum=[array_vertexnum,smallest_edge_visibility(configSpace,[xo,yo]);
index =1;
for index=1:size(configSpace)
    %Graph =[Graph,
    Graph = smallest_edge_visiblity_graph(Graph,configSpace,index,edgelist);
end
xf = configSpace(7,1);
yf = configSpace(7,2);
node=[xo,yo;x_obj1(1),y_obj1(1);x_obj1(2),y_obj1(2);x_obj1(3),y_obj1(3);x_obj1(4),y_obj1(4);x_obj2(1),y_obj2(1);x_obj2(2),y_obj2(2);x_obj2(3),y_obj2(3);x_obj2(4),y_obj2(4);x_obj3(1),y_obj3(1);x_obj3(2),y_obj3(2);x_obj3(3),y_obj3(3);xf,yf];
G = sparse(Graph);

[dist, path, pred] = graphshortestpath(G,1,7);             % since goal is closest to vertex9

figure(2)
plot(node(path(:),1),node(path(:),2),'o');
hold on;

xo=0;
yo=0;
xodot=0.5;
xfdot=2;
kodot=0;
kfdot=0.3;

t0=20;
tf=30;
tc = 25;

% Fitting bernstein from goal to end


[xt_robo , xt_dot , kt, kt_dot, yt_robo , yt_dot, omega_t , velocity] = bernstein_path(xo,yo,xodot,node(path(1),1),node(path(1),2),xfdot,(xo+node(path(1),1))/2,(yo+node(path(1),2))/2,t0,tf,tc,kodot,kfdot);

X=xt_robo;
Y=yt_robo;
for i = 1:length(path)
    %t0 = i*unitT;
    %tf = 0.8*(i+8)*unitT;
    %tc= 0.4*(i+4)*unitT;
    t0 = t0 +20;
    tf = tf +25;
    tc = (t0+tf)/2;
    xodot = xt_dot(length(xt_dot));
    xfdot = xodot + 40 ;
    kodot = kt_dot(length(kt_dot));
    kfdot = kodot + 0.8;
    xo = X(length(X));
    yo = Y(length(Y));
    
    xf = node(path(i),1);
    yf = node(path(i),2);
    [xt_robo , xt_dot , kt, kt_dot, yt_robo , yt_dot, omega_t , velocity] = bernstein_path(xo,yo,xodot,xf,yf,xfdot,(node(path(i),1)+xo)/2,(node(path(i),2)+yo)/2,t0,tf,tc,kodot,kfdot);
     X = [X;xt_robo];
     Y = [Y;yt_robo];
    
end
X= [X;xf];
Y=[Y;yf];

plot(X,Y,'-g');

