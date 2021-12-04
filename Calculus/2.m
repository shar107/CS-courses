 
MAT 1011 
MATLAB
L31+L32
FALL SEMESTER 2019-20
SHARADINDU ADHIKARI
19BCE2105
Question 1
Find the volume of the solid S that is bounded by the elliptic paraboloid x
2
+ 2 y
2
+ z =16, the 
planes x = 2 and y = 2, and the three coordinate planes.
clear all
clc
syms x y z
int(int(16-x^2-2*y^2,x,0,2),y,0,2)
viewSolidone(z,0+0*x+0*y,16-x^2-2*y^2,x,0+0*y,2+0*y,y,0,2)

Question 2
Evaluate sin x cos y dA where R =  0, / 20, / 2.
R
clc
clear all
syms x y z
viewSolidone(z,0+0*x+0*y,sin(x)*cos(y),x,0+0*y,pi/2+0*y,y,0,pi/2)
int(int(sin(x)*cos(y),x,0,pi/2),y,0,pi/2)
ans =
1
Question 3
Find the volume of the region bounded between the planes x + y + 2 z = 2 and
2 x + 2 y + z = 4 in the first octant.
clear all
clc
syms x y z
xa=-2;
xb=2;
ya=-sqrt(2-x^2/2);
yb=sqrt(2-x^2/2);
za=(2-x-y)/2;
zb=4-2*x+2*y;
I=int(int(int(1+0*z,za,zb),y,ya,yb),x,xa,xb)
viewSolid(z,za,zb,y,ya,yb,x,xa,xb)
I =
6*pi*2^(1/2)
Question 4
Find the volume of the region cut from the solid elliptical cylinder x
2 + 4 y
2
  4 by the
xy − plane and the plane z = x + 2.
clear all
clc
syms x y z
ya=-1;
yb=1;
xa=-sqrt(4-4*y^2);
xb=sqrt(4-4*y^2);
za=0+0*x+0*y;
zb=x+2+0*y;
I=int(int(int(1+0*z,z,za,zb),x,xa,xb),y,ya,yb)
viewSolidone(z,za,zb,x,xa,xb,y,ya,yb)
I =
4*pi
End 