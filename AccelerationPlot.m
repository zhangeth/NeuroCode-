hold on
ln = plot(t,acc_d)
ln.LineWidth = 2;
ln.Color = [0 0.5 0.5];
ln.Marker = 'o';
ln.MarkerEdgeColor = 'r';
ln2 = plot(t, acc_r);
ln2.LineWidth = 2;
ln2.Color = [0 0.5 0.5];
ln2.Marker = '*';
ln2.MarkerEdgeColor = 'b';
xlabel('Time (sec)')
ylabel('Acceleration (Degrees/sec^2) (theta dot)')
title('Desired and Real Acceleration of 1D Arm')
legend('Desired Acceleration','Real Acceleration')
hold off