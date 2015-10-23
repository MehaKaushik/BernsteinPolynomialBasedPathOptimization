function [Graph] = smallest_edge_visiblity_graph(Graph,configSpace,index,edgelist)
v3=configSpace(index,[1,2]);

angle=[];

len=size(configSpace);

for k=1:len
    if(configSpace(k,[1,2])~=v3)
		flag = 0;
		v4 = configSpace(k,[1,2]);
        for l=1:size(edgelist)
            edge=[];
            edge=edgelist(l,[1,2]);
            vertex1=configSpace(edge(1),[1,2]);
            vertex2=configSpace(edge(2),[1,2]);
%%diagonal hatane k liye ...basically if v3, v4 form an existing edge draw nahi krega
			if( ( v3 == vertex1 & v4 == vertex2 ) |( v3 == vertex2 & v4 == vertex1 ) )
				flag = 1;
				break;
			end
			if( v4 == vertex1 | v4 == vertex2 | v3 == vertex1 | v3 == vertex2)
				r = 0;
            elseif(isLineSegmentsIntersect(configSpace(k,[1,2]),v3,vertex2,vertex1)==1)
				flag =1;                
                dis=sqrt(power(configSpace(k,1)-v3(1),2)+power(configSpace(k,2)-v3(2),2));
                Graph(configSpace(k,3),configSpace(index,3))=dis;
                Graph(configSpace(index,3),configSpace(k,3))=dis;
            end
        end
		if( flag == 0 )
				drawLine(configSpace(k,[1,2]),v3);
		end
    end
end
end
           


