%addpath(MATLAB,'-end')
x= 45; %initial angle
p0=45; %initial position
xd = 0;
xdd = 0; 
goal = 90 %end angle
tau = .3 %time to get to goal
dt = .01 %time step
i = 2; %imagined inertia
ir = 2; %real inertia
c = 1;

%------------------------------------------------------------------------------------------------------------%
angle_d = zeros(1:dt:tau) %angular positions over tau
velocity_d = zeros(1:dt:tau) %desired velocities over tau
acc_d = zeros(1:dt:tau) %desired accelerations over tau
torque = zeros(1:dt:tau) %torques over tau
acc_r = zeros(1:dt:tau) %real accelerations over tau
velocity_r= zeros(1:dt:tau) %real velocities over tau
angle_r = zeros(1:dt:tau) %real angular positions over tau
t = zeros(1:dt:tau); %time vector
%brain command-----------------------------------------------------------------------------------------------%
for time= 0:dt:tau 
  [x,xd,xdd] = min_jerk_step(x,xd,xdd,goal, tau, dt);
  angle_d = [angle_d, x]
  velocity_d = [velocity_d, xd]
  acc_d = [acc_d, xdd]
  t = [t, time];
  torque = [torque, xdd*i];
  acc_r = [acc_r, (xdd*i)/ir];
%integration
  if time==0
      v1 = (xdd*i*dt)/(ir);
      velocity_r = [velocity_r, v1];
      angle_r = [angle_r, v1*dt+p0];
  else
    v1 = acc_r(c)*dt + velocity_r(c-1);
    velocity_r = [velocity_r, v1];
    p1 = velocity_r(c)*dt + angle_r(c-1);
    angle_r = [angle_r, p1];
    
  end 
  c = c+1;
  
end
zip('1Dzipped', {'TimeLoop.m' , 'min_jerk_step.m', 'TorquePlot.m', 'VelocityPlot.m', 'PositionPlot.m'})

%Notes
%x should be desired angle- angle_des
%xd should be desired velocity, this is sent to inverse dynamics to compute
%torque (motor command). This is sent to arm, which computes into real
%acceleration. Integrate this acceleration into real velocity. Then
%integrate into real position. Make two different parameters-inertia_real and
%inertia_brain. IN same plot, plot real and desired, include units. This
%code generates brain signals
%zip this code and figures
% rename code, and then combine the figures with subplot command

%add muscles to 1D- one that pulls and one that pushes. Muscles can
%cocontract to move or stabilize. Infinite ways of generating elbow command
%because of cocontraction.
%Goal: control 2D arm in space, you have two joints. On left, you have
%minimum jerks, x and d. These are translated to desired joint angles.
%Inverse kinematics. Once joint angles are gotten, then generate torques
%with equation. Both joints as a function of acceleration. Torques are then
%used to get real acceleration for both joints, which are sent to velocity
%and position. Get x and y position.
