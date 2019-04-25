%% ________________________Space Robotics Lab___________________________ %%
%       Choosing the best locomotion mode in reconfigurable rovers        %
%             University of Malaga - European Space Agency                %
%                  Authors: G.J. Paz Delgado                              %
%                           P. Romeo Manrique                             %
%                           C.J. Pérez del Pulgar                         %
%                           J.R. Sánchez Ibáñez                           %
%                       E-mail: gonzalopd96@uma.es                        %
%-------------------------------------------------------------------------%
% Description:                                                            %
% Different figures representation including currents,velocities...       %
%-------------------------------------------------------------------------%

clear

%% Wheel-walking angular speeds

load('velocities.mat');
figure
subplot(2,1,1)
plot(simTime,dthetaWWreal,simTime,dthetaWWideal)
axis([0 8 -0.6 0.6])
legend('Simulation result','Planned velocity profile')
xlabel('t (s)')
ylabel('\omega (rad/s)')
set(gca,'FontSize',20);
title('Walking joint');
subplot(2,1,2)
plot(simTime,wheelSpeed,simTime,idealWheelSpeed)
axis([0 8 -0.5 2.5])
legend('Simulation result','Planned velocity profile')
xlabel('t (s)')
ylabel('\omega (rad/s)')
set(gca,'FontSize',20);
title('Wheel');


%% Base speed
figure
plot(simTime,vB)
hold on
plot(simTime,0.08*ones(size(simTime)))
axis([0 8 0 0.1])
legend('Simulation result','Planned velocity profile')
xlabel('t (s)')
ylabel('Linear speed (m/s)')
set(gca,'FontSize',20);

%% Current experiments

slip = [0 7.34 19.07 47.64 64.5 95]/100;
slope = [0 3 6 9 12];

AWWslip0  = [30.04  31.596  33.008 34.7180 36.46]/17;
AWWslip10 = [12.196 15.3240 20.59  26.254  31.43]/17;
AWWslip25 = [11.184 14.484  18.58  23.44   28.51]/17;
AWWslip50 = [13.81  17.3520 21.448 25.7740 9999]/17;
AWWslip75 = [34.58  37.5140 9999   9999    9999]/17;
AWWslip90 = [44.814 9999    9999   9999    9999]/17;

ANDslip0  = [0.06113 3.077   6.146 9.198  12.23]/17;
ANDslip10 = [2.526   5.988   9.151 12.24  15.26]/17;
ANDslip25 = [4.4     6.986   9.965 13.06  16.1]/17;
ANDslip50 = [9.378   12.7880 15.35 16.748 9999]/17;
ANDslip75 = [27.3648 28.2140 9999  9999   9999]/17;
ANDslip90 = [39.2428 9999    9999  9999   9999]/17;

AWW = [AWWslip0; AWWslip10; AWWslip25; AWWslip50; AWWslip75; AWWslip90]';

AND = [ANDslip0; ANDslip10; ANDslip25; ANDslip50; ANDslip75; ANDslip90]';
   
figure()
spAWW = surf(0:0.18:0.9,slope,AWW);
hold on
spAND = surf(0:0.18:0.9,slope,AND);
spAWW.FaceColor = [59 131 189]/255;
spAND.FaceColor = [228 160 16]/255;
spAWW.FaceAlpha = 0.8;
spAND.FaceAlpha = 0.8;
% title('Average current consumption of the two locomotion modes on different terrains')
legend('Wheel-walking','Normal driving')
xlabel('Different Terrains')
ylabel('Slope (º)')
zlabel('Average Current Consumption (A)')
set(gca,'FontSize',20);
axis([0 1 0 12 0 5])
set(gca,'xtick',0:0.18:0.9,'xticklabel',{'Terrain 1','Terrain 2','Terrain 3','Terrain 4','Terrain 5','Terrain 6'})
text(0,-0.5,-0.5,'\sigma = 0','FontSize',16)
text(0,-0.5,-0.75,'\rho = 0.0036','FontSize',16)
text(0.18,-0.5,-0.5,'\sigma = 0.0733','FontSize',16)
text(0.18,-0.5,-0.75,'\rho = 0.0663','FontSize',16)
text(0.36,-0.5,-0.5,'\sigma = 0.1985','FontSize',16)
text(0.36,-0.5,-0.75,'\rho = 0.118','FontSize',16)
text(0.54,-0.5,-0.5,'\sigma = 0.4764','FontSize',16)
text(0.54,-0.5,-0.75,'\rho = 0.2142','FontSize',16)
text(0.72,-0.5,-0.5,'\sigma = 0.65','FontSize',16)
text(0.72,-0.5,-0.75,'\rho = 0.2474','FontSize',16)
text(0.9,-0.5,-0.5,'\sigma = 0.95','FontSize',16)
text(0.9,-0.5,-0.75,'\rho = 0.2423','FontSize',16)
hold off

%% Velocity experiments

slip = [0 7.34 19.07 47.64 64.5 95]/100;
slope = [0 3 6 9 12];

VWWslip0  = [0.1012 0.0982 0.0945 0.0906 0.0860];
VWWslip10 = [0.0915 0.0846 0.0767 0.0678 0.0576];
VWWslip25 = [0.0848 0.0748 0.0652 0.0527 0.0293];
VWWslip50 = [0.0719 0.0602 0.0422 0.0170 0.0001];
VWWslip75 = [0.0497 0.0191 0.0001    0.0001    0.0001];
VWWslip90 = [0.0281 0.0001    0.0001    0.0001    0.0001];

VNDslip0  = [0.1000 0.0994 0.0989 0.0985 0.0981];
VNDslip10 = [0.0925 0.0825 0.0733 0.0643 0.0556];
VNDslip25 = [0.0808 0.0696 0.0565 0.0430 0.0252];
VNDslip50 = [0.0539 0.0383 0.0246 0.0130 0.0001];
VNDslip75 = [0.0360 0.0121 0.0001    0.0001   0.0001];
VNDslip90 = [0.0076 0.0001    0.0001    0.0001    0.0001];

vWW = [VWWslip0; VWWslip10; VWWslip25; VWWslip50; VWWslip75; VWWslip90]';

vND = [VNDslip0; VNDslip10; VNDslip25; VNDslip50; VNDslip75; VNDslip90]';
   

figure()  
spVWW = surf(0:0.18:0.9,slope,vWW);
hold on
spVND = surf(0:0.18:0.9,slope,vND);
spVWW.FaceColor = [59 131 189]/255;
spVND.FaceColor = [228 160 16]/255;
spVWW.FaceAlpha = 0.8;
spVND.FaceAlpha = 0.8;
% title('Speed of different locomotion modes in certain terrains')
legend('Wheel-walking','Normal driving')
xlabel('Different terrains')
ylabel('Slope (º)')
zlabel('Average Speed (m/s)')
set(gca,'FontSize',20);
set(gca,'xtick',0:0.18:0.9,'xticklabel',{'Terrain 1','Terrain 2','Terrain 3','Terrain 4','Terrain 5','Terrain 6'})
text(0,-1,-0.015,'\sigma = 0','FontSize',16)
text(0,-1,-0.025,'\rho = 0.0036','FontSize',16)
text(0.18,-1,-0.015,'\sigma = 0.0733','FontSize',16)
text(0.18,-1,-0.025,'\rho = 0.0663','FontSize',16)
text(0.36,-1,-0.015,'\sigma = 0.1985','FontSize',16)
text(0.36,-1,-0.025,'\rho = 0.118','FontSize',16)
text(0.54,-1,-0.015,'\sigma = 0.4764','FontSize',16)
text(0.54,-1,-0.025,'\rho = 0.2142','FontSize',16)
text(0.72,-1,-0.015,'\sigma = 0.65','FontSize',16)
text(0.72,-1,-0.025,'\rho = 0.2474','FontSize',16)
text(0.9,-1,-0.015,'\sigma = 0.95','FontSize',16)
text(0.9,-1,-0.025,'\rho = 0.2423','FontSize',16)
hold off


%% IV diagram

slip = [0 7.34 19.07 47.64 64.5 95]/100;
slope = [0 3 6 9 12];

ag = 9.81;
rWheels = 0.07;
mWheels = 0.484;
mBody = 11.2;
TANDslope0 = [0.005732 0.107 0.1905 0.3457 0.3993 0.3911];
FR = TANDslope0/rWheels;
FN = ag*(mBody+6*mWheels)/6;

rollingResistance = FR/FN;

AWWslip0  = [30.04  31.596  33.008 34.7180 36.46]/17;
AWWslip10 = [12.196 15.3240 20.59  26.254  31.43]/17;
AWWslip25 = [11.184 14.484  18.58  23.44   28.51]/17;
AWWslip50 = [13.81  17.3520 21.448 25.7740 999]/17;
AWWslip75 = [34.58  37.5140 99  99    inf]/17;
AWWslip90 = [44.814 999   inf  inf    inf]/17;

VWWslip0  = [0.1012 0.0982 0.0945 0.0906 0.0860];
VWWslip10 = [0.0915 0.0846 0.0767 0.0678 0.0576];
VWWslip25 = [0.0848 0.0748 0.0652 0.0527 0.0293];
VWWslip50 = [0.0719 0.0602 0.0422 0.0170 0.0001];
VWWslip75 = [0.0497 0.0191 0.0001    0.0001    0.0001];
VWWslip90 = [0.0281 0.0001    0.0001    0.0001    0.0001];

ANDslip0  = [0.06113 3.077   6.146 9.198  12.23]/17;
ANDslip10 = [2.526   5.988   9.151 12.24  15.26]/17;
ANDslip25 = [4.4     6.986   9.965 13.06  16.1]/17;
ANDslip50 = [9.378   12.7880 15.35 16.748 99]/17;
ANDslip75 = [27.3648 28.2140 999 999   inf]/17;
ANDslip90 = [39.2428 999   inf  inf   inf]/17;

VNDslip0  = [0.1000 0.0994 0.0989 0.0985 0.0981];
VNDslip10 = [0.0925 0.0825 0.0733 0.0643 0.0556];
VNDslip25 = [0.0808 0.0696 0.0565 0.0430 0.0252];
VNDslip50 = [0.0539 0.0383 0.0246 0.0130 0.0001];
VNDslip75 = [0.0360 0.0121 0.0001    0.0001   0.0001];
VNDslip90 = [0.0076 0.0001    0.0001    0.0001    0.0001];

AVWWslip0=AWWslip0./VWWslip0;
AVWWslip10=AWWslip10./VWWslip10;
AVWWslip25=AWWslip25./VWWslip25;
AVWWslip50=AWWslip50./VWWslip50;
AVWWslip75=AWWslip75./VWWslip75;
AVWWslip90=AWWslip90./VWWslip90;

AVNDslip0=ANDslip0./VNDslip0;
AVNDslip10=ANDslip10./VNDslip10;
AVNDslip25=ANDslip25./VNDslip25;
AVNDslip50=ANDslip50./VNDslip50;
AVNDslip75=ANDslip75./VNDslip75;
AVNDslip90=ANDslip90./VNDslip90;  

AVWW = [AVWWslip0; AVWWslip10; AVWWslip25; AVWWslip50 ;AVWWslip75; AVWWslip90];

AVND = [AVNDslip0; AVNDslip10; AVNDslip25; AVNDslip50; AVNDslip75; AVNDslip90];

figure()  
spAVWW = surf(0:0.18:0.9,slope,AVWW');
hold on
spAVND = surf(0:0.18:0.9,slope,AVND');
spAVWW.FaceColor = [59 131 189]/255;
spAVND.FaceColor = [228 160 16]/255;
spAVWW.FaceAlpha = 0.8;
spAVND.FaceAlpha = 0.8;
% title('Speed of different locomotion modes in certain terrains')
legend('Wheel-walking','Normal driving')
xlabel('Different Terrains')
ylabel('Slope (º)')
zlabel('Average Current Consumption per distance (As/m)')
set(gca,'FontSize',20);
set(gca,'xtick',0:0.18:0.9,'xticklabel',{'Terrain 1','Terrain 2','Terrain 3','Terrain 4','Terrain 5','Terrain 6'})
text(0,-0.5,-15,'\sigma = 0','FontSize',16)
text(0,-0.5,-22.5,'\rho = 0.0036','FontSize',16)
text(0.18,-0.5,-15,'\sigma = 0.0733','FontSize',16)
text(0.18,-0.5,-22.5,'\rho = 0.0663','FontSize',16)
text(0.36,-0.5,-15,'\sigma = 0.1985','FontSize',16)
text(0.36,-0.5,-22.5,'\rho = 0.118','FontSize',16)
text(0.54,-0.5,-15,'\sigma = 0.4764','FontSize',16)
text(0.54,-0.5,-22.5,'\rho = 0.2142','FontSize',16)
text(0.72,-0.5,-15,'\sigma = 0.65','FontSize',16)
text(0.72,-0.5,-22.5,'\rho = 0.2474','FontSize',16)
text(0.9,-0.5,-15,'\sigma = 0.95','FontSize',16)
text(0.9,-0.5,-22.5,'\rho = 0.2423','FontSize',16)
axis([0 1 0 12 0 150])
hold off

%% Best locomotion mode

slip = [0 7.34 19.07 47.64 64.5 95]/100;
slope = [0 3 6 9 12];

AWWslip0  = [30.04  31.596  33.008 34.7180 36.46]/17;
AWWslip10 = [12.196 15.3240 20.59  26.254  31.43]/17;
AWWslip25 = [11.184 14.484  18.58  23.44   28.51]/17;
AWWslip50 = [13.81  17.3520 21.448 25.7740 999]/17;
AWWslip75 = [34.58  37.5140 999  999    999]/17;
AWWslip90 = [44.814 999   999  999    999]/17;

VWWslip0  = [0.1012 0.0982 0.0945 0.0906 0.0860];
VWWslip10 = [0.0915 0.0846 0.0767 0.0678 0.0576];
VWWslip25 = [0.0848 0.0748 0.0652 0.0527 0.0293];
VWWslip50 = [0.0719 0.0602 0.0422 0.0170 0.0001];
VWWslip75 = [0.0497 0.0191 0.0001    0.0001    0.0001];
VWWslip90 = [0.0281 0.0001    0.0001    0.0001    0.0001];

ANDslip0  = [0.06113 3.077   6.146 9.198  12.23]/17;
ANDslip10 = [2.526   5.988   9.151 12.24  15.26]/17;
ANDslip25 = [4.4     6.986   9.965 13.06  16.1]/17;
ANDslip50 = [9.378   12.7880 15.35 16.748 999]/17;
ANDslip75 = [27.3648 28.2140 999 999   999]/17;
ANDslip90 = [39.2428 999   999  999   999]/17;

VNDslip0  = [0.1000 0.0994 0.0989 0.0985 0.0981];
VNDslip10 = [0.0925 0.0825 0.0733 0.0643 0.0556];
VNDslip25 = [0.0808 0.0696 0.0565 0.0430 0.0252];
VNDslip50 = [0.0539 0.0383 0.0246 0.0130 0.0001];
VNDslip75 = [0.0360 0.0121 0.0001    0.0001   0.0001];
VNDslip90 = [0.0076 0.0001    0.0001    0.0001    0.0001];

AVWWslip0=AWWslip0./VWWslip0;
AVWWslip10=AWWslip10./VWWslip10;
AVWWslip25=AWWslip25./VWWslip25;
AVWWslip50=AWWslip50./VWWslip50;
AVWWslip75=AWWslip75./VWWslip75;
AVWWslip90=AWWslip90./VWWslip90;

AVNDslip0=ANDslip0./VNDslip0;
AVNDslip10=ANDslip10./VNDslip10;
AVNDslip25=ANDslip25./VNDslip25;
AVNDslip50=ANDslip50./VNDslip50;
AVNDslip75=ANDslip75./VNDslip75;
AVNDslip90=ANDslip90./VNDslip90;  

AVWW = [AVWWslip0; AVWWslip10; AVWWslip25; AVWWslip50 ;AVWWslip75; AVWWslip90];

AVND = [AVNDslip0; AVNDslip10; AVNDslip25; AVNDslip50; AVNDslip75; AVNDslip90];

difAV = AVWW-AVND;

slipV = [slip slip slip slip slip];
slopeV = [slope(1)*ones(1,length(slip)) slope(2)*ones(1,length(slip)) slope(3)*ones(1,length(slip)) slope(4)*ones(1,length(slip)) slope(5)*ones(1,length(slip))];
difAVvector = [difAV(:,1)' difAV(:,2)' difAV(:,3)' difAV(:,4)' difAV(:,5)'];

F = scatteredInterpolant(slipV',slopeV',difAVvector','linear');

[Xmesh,Ymesh] = meshgrid(0:0.001:0.9,0:12/900:12);

Z = F(Xmesh,Ymesh);
maxP = max(max(Z));
minN = abs(min(min(Z)));


for i = 1:length(Z)
    for j = 1:length(Z)
        if Z(i,j) == 0
            Z(i,j) = NaN;
        elseif Z(i,j)>0
            Z(i,j) = Z(i,j)/maxP;
        elseif Z(i,j)<0
            Z(i,j) = Z(i,j)/minN;
        end
            
    end
end

figure
BLM = surf(Xmesh,Ymesh,zeros(size(Xmesh)),Z)
BLM.EdgeAlpha = 0.1
xlabel('')
ylabel('Slope (º)')
zlabel('Average Current Consumption per distance (As/m)')
c = colorbar;
c.Label.String = 'Wheel-walking                                                                       Normal driving';
set(gca,'FontSize',20);
set(gca,'xtick',0:0.18:0.9,'xticklabel',{'Terrain 1','Terrain 2','Terrain 3','Terrain 4','Terrain 5','Terrain 6'})
text(0-0.03,-0.7,0,'\sigma = 0','FontSize',16)
text(0-0.03,-1,0,'\rho = 0.0036','FontSize',16)
text(0.18-0.03,-0.7,0,'\sigma = 0.0733','FontSize',16)
text(0.18-0.03,-1,0,'\rho = 0.0663','FontSize',16)
text(0.36-0.03,-0.7,0,'\sigma = 0.1985','FontSize',16)
text(0.36-0.03,-1,0,'\rho = 0.118','FontSize',16)
text(0.54-0.03,-0.7,0,'\sigma = 0.4764','FontSize',16)
text(0.54-0.03,-1,0,'\rho = 0.2142','FontSize',16)
text(0.72-0.03,-0.7,0,'\sigma = 0.65','FontSize',16)
text(0.72-0.03,-1,0,'\rho = 0.2474','FontSize',16)
text(0.9-0.03,-0.7,0,'\sigma = 0.95','FontSize',16)
text(0.9-0.03,-1,0,'\rho = 0.2423','FontSize',16)

%% Accelerated steps

slip = [0 7.34 19.07 47.64 64.5 95]/100;


slipWW1 = [0.3082 0.3939 0.4718 0.5812 0.6890 1];
slipWW1_4 = [0.2030 0.3171 0.3900 0.4934 0.6955 1];
slipWW2 = [0.1091 0.2324 0.2883 0.4308 0.7618 0.9530];
slipWW3 = [0.0320 0.1839 0.2579 0.5586 0.8335 0.9197];
slipWW4 = [0 0.1784 0.2598 0.6530 0.8711 0.9259];
slipWW5 = [0 0.1691 0.2719 0.7175 0.8947 0.9381];

eww1 = slipWW1-slip;
eww1_4 = slipWW1_4-slip;
eww2 = slipWW2-slip;
eww3 = slipWW3-slip;
eww4 = slipWW4-slip;
eww5 = slipWW5-slip;

% figure
% hold on;
% plot(0:0.19:0.95,slipWW2,'Color',[0 0 255]/255)
% plot(0:0.19:0.95,slip,'Color',[135 206 235]/255)
% legend('Obtained slip','Real slip')
% xlabel('')
% ylabel('Slip ratio (\sigma)')
% set(gca,'FontSize',20);
% set(gca,'xtick',0:0.19:0.95,'xticklabel',{'Terrain 1','Terrain 2','Terrain 3','Terrain 4','Terrain 5','Terrain 6'})
% text(0-0.03,-0.075,0,'\sigma = 0','FontSize',16)
% text(0-0.03,-0.105,0,'\rho = 0.0036','FontSize',16)
% text(0.19-0.03,-0.075,0,'\sigma = 0.0733','FontSize',16)
% text(0.19-0.03,-0.105,0,'\rho = 0.0663','FontSize',16)
% text(0.38-0.03,-0.075,0,'\sigma = 0.1985','FontSize',16)
% text(0.38-0.03,-0.105,0,'\rho = 0.118','FontSize',16)
% text(0.57-0.03,-0.075,0,'\sigma = 0.4764','FontSize',16)
% text(0.57-0.03,-0.105,0,'\rho = 0.2142','FontSize',16)
% text(0.76-0.03,-0.075,0,'\sigma = 0.65','FontSize',16)
% text(0.76-0.03,-0.105,0,'\rho = 0.2474','FontSize',16)
% text(0.95-0.03,-0.075,0,'\sigma = 0.95','FontSize',16)
% text(0.95-0.03,-0.105,0,'\rho = 0.2423','FontSize',16)


figure
hold on;
plot(0:0.19:0.95,100*eww1,'Color',[0 0 128]/255,'LineWidth',2)
plot(0:0.19:0.95,100*eww1_4,'Color',[0 0 180]/255,'LineWidth',2)
plot(0:0.19:0.95,100*eww2,'Color',[0 0 255]/255,'LineWidth',2)
plot(0:0.19:0.95,100*eww3,'Color',[065 105 255]/255,'LineWidth',2)
plot(0:0.19:0.95,100*eww4,'Color',[030 144 255]/255,'LineWidth',2)
plot(0:0.19:0.95,100*eww5,'Color',[135 206 235]/255,'LineWidth',2)
legend('Speed x1','Speed x1.4','Speed x2','Speed x3','Speed x4','Speed x5')
xlabel('')
ylabel('Error (%)')
set(gca,'FontSize',20);
set(gca,'xtick',0:0.19:0.95,'xticklabel',{'Terrain 1','Terrain 2','Terrain 3','Terrain 4','Terrain 5','Terrain 6'})
text(0-0.03,-7-0.7,0,'\sigma = 0','FontSize',16)
text(0-0.03,-7-1.7,0,'\rho = 0.0036','FontSize',16)
text(0.19-0.03,-7-0.7,0,'\sigma = 0.0733','FontSize',16)
text(0.19-0.03,-7-1.7,0,'\rho = 0.0663','FontSize',16)
text(0.38-0.03,-7-0.7,0,'\sigma = 0.1985','FontSize',16)
text(0.38-0.03,-7-1.7,0,'\rho = 0.118','FontSize',16)
text(0.57-0.03,-7-0.7,0,'\sigma = 0.4764','FontSize',16)
text(0.57-0.03,-7-1.7,0,'\rho = 0.2142','FontSize',16)
text(0.76-0.03,-7-0.7,0,'\sigma = 0.65','FontSize',16)
text(0.76-0.03,-7-1.7,0,'\rho = 0.2474','FontSize',16)
text(0.95-0.03,-7-0.7,0,'\sigma = 0.95','FontSize',16)
text(0.95-0.03,-7-1.7,0,'\rho = 0.2423','FontSize',16)



%% Radius-error
radios = [1.05 0.6 0.45 0.4 0.3750];
errores = [max(eww1_4) max(eww2) max(eww3) max(eww4) max(eww5)]*100;

figure
plot(radios,errores,'x','Color','r')
hold on;
plot(radios,errores,'Color','b')
axis([0 1.5 0 35])
xlabel('Radius (m)')
ylabel('Max slip estimation error (%)')
set(gca,'FontSize',20);
% txt1 = 'Speed x1 \rightarrow'; 
% text(1.8,errores(1),txt1,'FontSize',20)
txt2 = ' \leftarrow Speed x1.4'; 
text(radios(1),errores(1),txt2,'FontSize',20)
txt3 = ' \leftarrow Speed x2'; 
text(radios(2),errores(2),txt3,'FontSize',20)
txt4 = ' \leftarrow Speed x3'; 
text(radios(3),errores(3)+0.2,txt4,'FontSize',20)
txt5 = ' \leftarrow Speed x4'; 
text(radios(4),errores(4),txt5,'FontSize',20)
txt6 = ' \leftarrow Speed x5'; 
text(radios(5),errores(5),txt6,'FontSize',20)
