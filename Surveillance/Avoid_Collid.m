function Col = Avoid_Collid(Fleet,Nearby)
% This function will guid the agent to avoid collision. 
% Outputs: Col[1 by 3] = [vx,vy,vz]

%%
% Fleet = [type,Position,Volicity,Statue,size,Dest_type,Dest,TMission]
% Type = 1 (UAV), = 2(GA)
% Statue = 0 (Rest),    = 1 (Start Flying), = 2 (Finish Mission), 
%        = 3 (Standby), = 4 (Crash), = 5 (Emergency)

% Nearby(k by 7) = [px,py,pz,vx,vy,vz,d];
% k = total number of Air Vehicle within the radius


end