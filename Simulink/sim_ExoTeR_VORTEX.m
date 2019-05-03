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
% ExoTeR locomotion modes simulation with Simulink-VORTEX studio          %
%-------------------------------------------------------------------------%

    clear

% Choose locomotion mode (1 for Normal driving, 0 for Wheel-walking)
    mode = 0;
    
% If simulating Wheel-walking, choose acceleration
    acc = 5;

% Starts the simulation
    sim('Simulink_Vortex.slx')

% ExoTeR kinematics parameters
    rw = 0.075; % Wheel radius
    l = 0.125;  % Leg length


% Results obtained in function of the locomotion mode
    if mode == 0
    % If simulating Wheel-walking, accelerated steps give information
        ind = 0;
        first = 0;
        last = 0;
        c = true;
        while c || ind > length(halfAcceleration)
            ind = ind+1;
            if halfAcceleration(ind) ~= 0 && first == 0
                first = ind;
            end
            if (halfAcceleration(ind) == 0 && first ~= 0) || ind == length(halfAcceleration)
                last = ind;
                c = false;
            end
        end    
        sizAcc = last-first;
        
    % Position of one wheel during the accelerated step
        XwheelA = Xwheel(first:last);
        YwheelA = Ywheel(first:last);

    % Angular position of the wheel during the accelerated step
        RzwheelA = angularWheelPos(first:last,1);
        
    % Simulation time corresponding to the accelerated step
        times = simTime(first:last);
        t = times(end)-times(1);
        
    % Minimum distance obtention
        dmin = 2*sin(13.8656*pi/180)*l*0.7617;
        
    % Real distance covered by the wheel
        d = 0;
        for i = 2:length(times)
            d = d + norm([XwheelA(i),YwheelA(i)]-[XwheelA(i-1),YwheelA(i-1)]);   
        end
        
    % Maximum distance obtention
        theta = RzwheelA(end)-RzwheelA(1);
        A = theta*1*rw*0.824; 
        dmax = A+dmin;
        
    % Final slip ratio estimated
        WWslip = (dmax-d)/(dmax-dmin);
        if WWslip < 0
            WWslip = 0
        elseif WWslip < 1
            WWslip
        else
            WWslip = 1
        end

    % Turn radius during the accelerated steps
        idealR_acc = idealR(first:last);
        realR_acc = realR(first:last);

        idealTurnRadius = min(idealR_acc)
        
    % Current consumption during the whole simulation
        WWcurrentConsumption = WWcurrent(end)
        
    % Final speed of the rover    
        WWfinalSpeed = vB(end)

    else
    % Case simulating Normal driving
    % Slip ratio estimated
        sumSlip = cumsum(NDslipRatio(2:end));
        NDslip = sumSlip(end)/length(sumSlip)/100
    % Current consumption during the whole simulation
        NDcurrentConsumption = NDcurrent(end)
        
    % Final speed of the rover
        NDfinalSpeed = vB(end)
    end







