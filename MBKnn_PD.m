
% Writing down th equation for many body Kapitza pendula



function dy = MBKnn_PD(t,y,mm,nn,w)

%% Setting the parameters
gam=1;mu=0.05;%w=1;
dy=zeros(nn,1);
J=1;

%% equations for the CGL model

for i=2:mm
    dy(i)=(J*(y(i+1)+y(i-1)-y(i))+(gam+mu)*y(i)-(y(i).^2+y(mm+i).^2).*y(i));
end

dy(mm+1)=(J*(y(mm)+y(2)-2*y(1))+(gam-mu)*y(1)-(y(1).^2+y(1).^2).*y(1))+cos(w*t);

%dy(mm+1)=(Lam/KK)*(sin(y(mm)-y(1))-sin(y(1)-y(2)))-(g0+g1*cos(gam*t))*sin(y(1))/(KK*Lam);

for i=2:mm-1
    dy(mm+i)=(J*(y(mm+i+1)+y(mm+i-1)-2*y(mm+i))+(gam-mu)*y(mm+i)-(y(i).^2+y(mm+i).^2).*y(mm+i))+cos(w*t);
end

%dy(nn) =(Lam/KK)*(sin(y(mm-1)-y(mm))-sin(y(mm)-y(1)))-(g0+g1*cos(gam*t))*sin(y(mm))/(KK*Lam);

dy(nn)=(J*(y(mm-1)+y(1)-2*y(mm))+(gam-mu)*y(mm)-(y(mm).^2+y(mm).^2).*y(mm))+cos(w*t);
