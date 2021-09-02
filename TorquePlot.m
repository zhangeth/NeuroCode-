
ln = plot(t,torque,"b")
ln.LineWidth = 2;
ln.Color = [0 0.5 0.5];
ln.Marker = 'o';
ln.MarkerEdgeColor = 'm';
xlabel('Time (sec)')
ylabel('Torque (Newton-metre)')
title('Desired Torque of 1D Arm')