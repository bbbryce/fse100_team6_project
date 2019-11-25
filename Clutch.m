brick.MoveMotor('B', -5);
pause(3);
brick.StopMotor('B');
brick.ResetMotorAngle('B')
brick.MoveMotor('B', 5);
pause(3);
brick.StopMotor('B');
C = brick.GetMotorAngle('B');
disp(C);