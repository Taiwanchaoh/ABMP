%% Agent Based Modeling Platform (ABMP)
% This software is designed to analyze the integration of Amazon Prime-Air
% UAV into Purdue University Airport Airspace

clear all
clc
% Map Folders
SetPath
% Set worker to do parallel computing
pool_size = 6;
pool_obj = gcp('nocreate');
if isempty(pool_obj)
    parpool(pool_size) % Setting how many workers into parallel computing
else
    if pool_size ~= pool_obj.NumWorkers
        delete(pool_obj)
        parpool(pool_size)
    end
end

%% Setting the simulation
T = 60*60*8; % (s)
dT = 60;     % Updating period (s)

NU = 20;  % Total number of UAV
NG = 20;  % Total number of GA

%% Initialize
N = NU + NG;
% Execute Initialize.m file
Initialize
% Dtat information:
% Fleet = [type,Position,Volicity,Statue,size,Dest_type,Dest]

% Type = 1 (UAV), = 2(GA)

% Statue = 0 (Rest),    = 1 (Start Flying), = 2 (Finish Mission), 
%        = 3 (Standby), = 4 (Crash), = 5 (Emergency)

% Dest_type = 0 (Delivery Destination), = 1 (Landing Path), = 2 (Take-off)
% Dest = [dx,xy,xz] (Dest is destination location when Dest_Type = 0)
%                   (Dest is number of flight path when Dest_Type ~= 0,
%                   e.g.: [1,1,1] or [2,2,2] or ...

Constants.Final = T;   Constants.dT = dT;
Constants.NU    = NU;  Constants.NG = NG;
Constants.N     = N;   
%% Start simulation
time = 0:dT:T;

for k = 1:length(time)
    
    t = time(i);
    Fleet = Assign_Job(Fleet,Constants);
    
    % Agent start thinking
    parfor i = 1:N
        if Fleet(i).Statue == 1
            % Measurement - This function should find out the position,
            % distance and the velocity of nearby air vehicle.
            [Nearby] = Measure(Fleet,i,Constants);

            % Check Statue - With the given nearby air vehicle position,
            % determine the statue of the current agent.
            [New_Statute(i),Near_Miss_C(i)] = Statue(Fleet(i),Nearby);
            
            if New_Statue(i) == 1
                % Navigation Strategy - Under the assumption that no other nearby
                % air vehicle, the wha9it the air vehicle would like to go
                Nav = Navigation(Fleet(i));

                % Collision Avoidance System Performance
                Col = Avoid_Collid(Fleet(i),Nearby);

                % Decide the weighting of the collision avoidance system and
                % navigation system
                New_Motion(i) = Final_Motion(Fleet(i),Nav,Col,Nearby,dT);
            elseif New_Statue(i) == 2
                New_Motion(i).Position = Fleet(i).Position;
                New_Motion(i).Velocity = zeros(1,3);
            end
        else
            New_Motion(i).Position = Fleet(i).Position;
            New_Motion(i).Velocity = zeros(1,3);
        end
    end
    
    % Update agents' position and velocity
    parfor i = 1:N
        if Fleet(i).Statue == 1
            Fleet(i).Position = New_Motion(i).Position;
            Fleet(i).Velocity = New_Motion(i).Velocity;
            Fleet(i).Statute  = New_Statute(i);
        end
    end
    
    Near_Miss = sum(Near_Miss_C);
end


