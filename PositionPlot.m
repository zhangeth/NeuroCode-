hold on
ln = plot(t,angle_d,"bl-o")
ln.LineWidth = 2;
ln.Color = [0 0.5 0.5];
ln.Marker = 'o';
ln.MarkerEdgeColor = 'r';
ln2 = plot(t, angle_r,"r");
ln2.LineWidth = 2;
ln2.Color = [0 0.5 0.5];
ln2.Marker = '*';
ln2.MarkerEdgeColor = 'b';
xlabel('Time')
ylabel('Angular Position (degrees)')
title('Angular Position of 1D Arm Trajectory')
legend('Desired Angle','Real Angle')
hold off