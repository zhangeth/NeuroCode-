
ln = plot(t/100,real_velocity)
ln.LineWidth = 2;
ln.Color = [0 0.5 0.5];
ln.Marker = 'o';
ln.MarkerEdgeColor = 'g';
xlabel('Time')
ylabel('Desired Acceleration (theta_dot_dot)')
title('Desired Acceleration of 1D Arm')