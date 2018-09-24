syms L1 L2 L3 t1 t2 t3 dt1 dt2 dt3 d2t1 d2t2 d2t3 m1 m2 m3 real
syms g Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3 real

L1=4;
L2=3;
L3=2;
m1=20;
m2=15;
m3=10;
Izz1=0.5;
Izz2=0.2;
Izz3=0.1;


T01=[cos(t1) -sin(t1)     0     0;
     sin(t1)  cos(t1)     0     0;
     0          0         1     0;
     0          0         0     1];

T12=[cos(t2) -sin(t2)     0     L1;
     sin(t2)  cos(t2)     0     0;
     0          0         1     0;
     0          0         0     1];

T23=[cos(t3) -sin(t3)     0     L2;
     sin(t3)  cos(t3)     0     0;
     0          0         1     0;
     0          0         0     1];
 
T34=[1          0         0     L3;
     0          1         0     0;
     0          0         1     0;
     0          0         0     1];
 
T02=T01*T12;
T03=T01*T12*T23;
T04=T01*T12*T23*T34;
T13=T12*T23;
T14=T12*T23*T34;
T24=T23*T12;

Po=[0 0 0 1]';
%P01=T01*Po;
P02=T02*Po;
P03=T03*Po;
P04=T04*Po;

P14=T14*Po;
P24=T24*Po;
P34=T34*Po;
P13=T24*Po;
P23=T23*Po;
P12=T12*Po;

P1c1t=[L1/2 0 0 1]';
P2c2t=[L2/2 0 0 1]';
P3c3t=[L3/2 0 0 1]';

P0c1t=T01*P1c1t;
P0c2t=T02*P2c2t;
P0c3t=T03*P3c3t;

P0c1=P0c1t(1:3);
P0c2=P0c2t(1:3);
P0c3=P0c3t(1:3);

Jv1=[diff(P0c1,t1) diff(P0c1,t2) diff(P0c1,t3)];
Jv2=[diff(P0c2,t1) diff(P0c2,t2) diff(P0c2,t3)];
Jv3=[diff(P0c3,t1) diff(P0c3,t2) diff(P0c3,t3)];

Jw1=[0 0 0;0 0 0;1 0 0];
Jw2=[0 0 0;0 0 0;1 1 0];
Jw3=[0 0 0;0 0 0;1 1 1];

Ic1=[Ixx1 0 0;0 Iyy1 0;0 0 Izz1];
Ic2=[Ixx2 0 0;0 Iyy2 0;0 0 Izz2];
Ic3=[Ixx3 0 0;0 Iyy3 0;0 0 Izz3];


M = m1*Jv1'*Jv1 +m2*Jv2'*Jv2 +m3*Jv3'*Jv3 + Jw1'*Ic1*Jw1 +Jw2'*Ic2*Jw2 +Jw3'*Ic3*Jw3;
a=simplify(M);
 
for i=1:3
    for j=1:3
        m(i,j,1)=diff(M(i,j),t1);
        m(i,j,2)=diff(M(i,j),t2);
        m(i,j,3)=diff(M(i,j),t3);
    end
end

for i=1:3
    for j=1:3
        for k=1:3
            b(i,j,k)=( m(i,j,k)+m(i,k,j)-m(j,k,i) )/2;
        end
    end
end

            
            
C=[b(1,1,1) b(1,2,2) b(1,3,3);b(2,1,1) b(2,2,2) b(2,3,3);b(3,1,1) b(3,2,2) b(3,3,3)]
B=2*[b(1,1,2) b(1,1,3) b(1,2,3);b(2,1,2) b(2,1,3) b(2,2,2);b(3,1,2) b(3,1,3) b(3,2,3)]
V=C*[dt1^2 dt2^2 dt3^2]'+B*[dt1*dt2 dt1*dt3 dt2*dt3]';

G=Jv1'*[0 m1*g 0]' + Jv2'*[0 m2*g 0]' + Jv3'*[0 m3*g 0]'
b = simplify(G);


