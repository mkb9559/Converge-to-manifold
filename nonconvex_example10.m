% Elliptic curve: x^2 - y^3 + 2y - 1.5 = 0

clc;
clear all;

y1=-1.7:0.01:2;
x1=sqrt(y1.^3-2*y1+1.5);
x2=-sqrt(y1.^3-2*y1+1.5);
x1=real(x1);
x2=real(x2); 

sy=1.5;
sx=-sqrt(sy^3-2*sy+1.5);

ey=1.4;
ex=sqrt(ey^3-2*ey+1.5);

sp_num=10;
for i=1:sp_num
    mx(i) = sx+(i/(sp_num+1))*(ex-sx);
    my(i) = sy+(i/(sp_num+1))*(ey-sy);
end


t1=clock;
Ts=0.01;
for i=1:sp_num
    cnt(i)=1;
    nx(i,1)=mx(i);
    ny(i,1)=my(i);
end

for i=1:sp_num
    i
    f = nx(i,cnt(i))^2-ny(i,cnt(i))^3+2*ny(i,cnt(i))-1.5;
    while(f*f>0.00001&&cnt(i)<10000)
        v=-[2*f*(2*nx(i,cnt(i))) 2*f*(-3*ny(i,cnt(i))^2+2)]';
        nx(i,cnt(i)+1)=nx(i,cnt(i))+Ts*v(1);
        ny(i,cnt(i)+1)=ny(i,cnt(i))+Ts*v(2);
        cnt(i)=cnt(i)+1;
        f = nx(i,cnt(i))^2-ny(i,cnt(i))^3+2*ny(i,cnt(i))-1.5;
    end
end
t2=clock;
etime(t2,t1)


figure(1);
hold on; box on;
plot(x1,y1,'linewidth', 2, 'color', 'k');
plot(x2,y1,'linewidth', 2, 'color', 'k');
plot(sx,sy,'*','linewidth', 4, 'color', 'b');
plot(ex,ey,'*','linewidth', 4, 'color', 'r');
plot(mx,my,'*','linewidth', 4, 'color', 'g');
line([sx ex],[sy ey],'linewidth', 2, 'color', 'm');
for i=1:sp_num
    plot(nx(i,1:cnt(i)-1),ny(i,1:cnt(i)-1),'linewidth', 2, 'color', 'g');
end
axis equal;