%Keep the file frekon.m in the sam folder
tic

clear all; close all; clc;

mm=100;nn=2*mm;w=20.0;

%% integrating the Complex Ginzberg Landau model

pos=zeros(mm,1);mom=zeros(mm,1);

for ii=1:mm
    pos(ii)=0.001*cos((2*pi/mm)*ii);
    mom(ii)=0.001*sin((2*pi/mm)*ii);
end
    time=[0.0 25];
   
options = odeset('RelTol',1e-4,'AbsTol',1e-4);
[t,x]=ode45(@(t,x)MBKnn_PD(t,x,mm,nn,w),time,[pos,mom],options);

    pos=x(:,1:mm); mom=x(:,mm+1:nn);
    pos=pos';
    mom=mom';
    
    figure()
    
    subplot(2,1,1)
    plot(pos)
    subplot(2,1,2)
    plot(mom)
    %subplot(2,2,[3 4])
    %plot(pos,mom)
    print -depsc -painters plotw20.eps
toc



