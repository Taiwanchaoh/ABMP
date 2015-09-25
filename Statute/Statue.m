function [New_Statute,Near_Miss_C] = Statute(Fleet,Nearby)
% This function will check the statute of the agent. Weather it is flying,
% standing-by, near-miss, or crash

% Outputs: New_Statute = The new statute of the agent,
%          Near_Miss_C = [1 or 0], near miss happened or not

% Fleet = [type,Position,Volicity,Statue,size,Dest_type,Dest,TMission]

% Statue = 0 (Rest),    = 1 (Start Flying), = 2 (Finish Mission), 
%        = 3 (Standby), = 4 (Crash), = 5 (Emergency)

% Nearby(k by 7) = [px,py,pz,vx,vy,vz,d];
% k = total number of Air Vehicle within the radius

%% Statute Check
Near_Miss_C = 0;
New_Statute = 1;
end