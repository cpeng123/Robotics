%%
t = [0 2 4 6 8];
q1 = [0 30 45 150 180];
xx =  0:.25:8;
sp1 = spline(t,[0 q1 0],xx);
plot(t,q1,'o',xx,sp1,'-');
h1 = gcf;
axesobj1 = get(h1,'Children');
dataobj1 = get(axesobj1,'Children');
xdata1 = get(dataobj1,'Xdata');
ydata1 = get(dataobj1,'Ydata');
a1 = xdata1{1,1};
b1 = ydata1{1,1};
Q1 = [a1' b1'];
%%
t = [0 2 4 6 8];
q2 = [0 -10 130 10 0];
xx =  0:.25:8;
sp2 = spline(t,[0 q2 0],xx);
plot(t,q2,'o',xx,sp2,'-');
h2 = gcf;
axesobj2 = get(h2,'Children');
dataobj2 = get(axesobj2,'Children');
xdata2 = get(dataobj2,'Xdata');
ydata2 = get(dataobj2,'Ydata');
a2 = xdata2{1,1};
b2 = ydata2{1,1};
Q2 = [a2' b2'];
%%
t = [0 2 4 6 8];
q3 = [90 70 -85 70 -90];
xx =  0:.25:8;
sp3 = spline(t,[0 q3 0],xx);
plot(t,q3,'o',xx,sp3,'-')
h3 = gcf;
axesobj3 = get(h3,'Children');
dataobj3 = get(axesobj3,'Children');
xdata3 = get(dataobj3,'Xdata');
ydata3 = get(dataobj3,'Ydata');
a3 = xdata3{1,1};
b3 = ydata3{1,1};
Q3 = [a3' b3'];