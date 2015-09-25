%% Initialize the AGMP environment


%% Initialize the fleet
% Fleet = [type,Position,Volicity,Statue,size,Dest_type,Dest,TMission]

% Type = 1 (UAV), = 2(GA)

% Statue = 0 (Rest),    = 1 (Start Flying), = 2 (Finish Mission), 
%        = 3 (Standby), = 4 (Crash), = 5 (Emergency)

% Dest_type = 0 (Delivery Destination), = 1 (Landing Path), = 2 (Take-off)
% Dest = [dx,xy,xz] (Dest is destination location when Dest_Type = 0)
%                   (Dest is number of flight path when Dest_Type ~= 0,
%                   e.g.: [1,1,1] or [2,2,2] or ...

% TMission = time (When the mission assigned to the agent)
for i = 1:N
    if i <= NU
        Fleet(i).Type      = 1;
        Fleet(i).size      = 50;  % m
        Fleet(i).Dest_type = 0;        
    else
        Fleet(i).Type      = 2;
        Fleet(i).size      = 100; % m
        Fleet(i).Dest_type = 1;
    end
    Fleet(i).Dest     = [0 0 0];
    Fleet(i).Position = [0 0 0];
    Fleet(i).Velocity = [0 0 0];
    Fleet(i).Statue   = 0;
    Fleet(i).TMission = 0;
end

%% Define the location of airport and warehouse
Constants.Airport   = [10,10, 0];
Constants.Warehouse = [ 1, 1, 0];

%% Define the Properties of UAV
Constants.UAV_Period = 20; % Define the minimum period (s) between two consecutive launch
Constants.UAV_AwareR = 10; % Define the radius that UAV can recodnize the nearby air vehicle (m)
Constants.UAV_Cruise = 10; % Define the curise speed of UAV (m/s)

%% Define the Properties of GA
Constants.GA_Period = 120; % Define the minimum period (s) between two consecutive launch
Constants.GA_AwareR = 100; % Define the radius that UAV can recodnize the nearby air vehicle (m)
Constants.GA_Cruise = 100; % Define the approaching speed of GA (m/s)
