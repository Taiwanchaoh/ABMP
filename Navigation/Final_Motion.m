function New_Motion = Final_Motion(Fleet,Nav,Col,Nearby,dT)
% This function will decide the final motion of the agent. 
% Outputs: New_Motion.Position = [px,py,pz]
%          New_Motion.Velocity = [vx,vy,vz]

%% Inputs Information
% Fleet = [type,Position,Volicity,Statue,size,Dest_type,Dest,TMission]
% Type = 1 (UAV), = 2(GA)
% Statue = 0 (Rest),    = 1 (Start Flying), = 2 (Finish Mission), 
%        = 3 (Standby), = 4 (Crash), = 5 (Emergency)

% Nearby(k by 7) = [px,py,pz,vx,vy,vz,d];
% k = total number of Air Vehicle within the radius

% Col[1 by 3] = [vx,vy,vz]
% Nav[1 by 3] = [vx,vy,vz]



New_Motion.Position = Fleet.Position + New_Motion.Velocity*dT;
end