% Elliptic curve: x^2 - y^3 + 2y - 1.5 = 0
% Hippopede curve: (x^2+y^2)^2+4b(b-1)(x^2+y^2)=4b^2 x^2, b>a
clc;
clear all;

y1=-1.7:0.01:2;
x1=sqrt(y1.^3-2*y1+1.5);
x2=-sqrt(y1.^3-2*y1+1.5);
x1=real(x1);
x2=real(x2); 


[X,Y] = meshgrid(-2:.1:2);
Z = X.^2-Y.^3+2*Y-1.5;

[DX,DY] = gradient(Z,.4,.4);



figure(1);
hold on; box on;
plot(x1,y1,'linewidth', 2, 'color', 'k');
plot(x2,y1,'linewidth', 2, 'color', 'k');

contour(X,Y,Z)
quiver(X,Y,2*DX,2*DY);
axis equal;

figure(2);
hold on; box on;
mesh(X,Y,Z);
plot3(x1,y1,y1*0,'linewidth', 2, 'color', 'k');
plot3(x2,y1,y1*0,'linewidth', 2, 'color', 'k');
view([-0.2 1 1]);
axis equal;