function [Nodes, Triangles, Quads]=Circle_Mesh(R,Nr,Nt)
%Nodes
%------------
c=0;
for j=1:1:Nr %Number of Circles
for i=1:1:Nt %Number of Angles
c=Nt*(j-1)+i;    
Nodes(c,1)=R*j/Nr*cosd(180*(i-1)/Nt);
Nodes(c,2)=R*j/Nr*sind(180*(i-1)/Nt);    
end
end
Nodes(c+1,1)=0;
Nodes(c+1,2)=0;
%Triangles
%------------
Triangles=[];
for i=1:1:Nt-1
Triangles(i,1)=i; 
Triangles(i,2)=i+1;
Triangles(i,3)=c+1;    
end
Triangles(i+1,1)=i+1; 
Triangles(i+1,2)=1;
Triangles(i+1,3)=c+1;   
%Quads
%------------
Quads=[];
for j=1:1:Nr-1
for i=1:1:Nt-1
d=Nt*(j-1)+i;  
Quads(d,1)=Nt*j+i;
Quads(d,2)=Nt*j+i+1;
Quads(d,3)=Nt*(j-1)+i+1;
Quads(d,4)=Nt*(j-1)+i;
end
Quads(d+1,1)=Nt*j+i+1;
Quads(d+1,2)=Nt*j+1;
Quads(d+1,3)=Nt*(j-1)+1;
Quads(d+1,4)=Nt*(j-1)+i+1;
end
end