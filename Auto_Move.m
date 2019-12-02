%brick = ConnectBrick('Error 404')
disp("Calibrating Clutch");
brick.MoveMotor('B', -5);
pause(3);
brick.StopMotor('B');
brick.ResetMotorAngle('B')
brick.MoveMotor('B', 5);
pause(3);
brick.StopMotor('B');
C = brick.GetMotorAngle('B');
disp(C);

brick.MoveMotorAngleAbs('B', 10, 0)

disp("Done Calibrating");
pause(5);

 while true
    D = brick.UltrasonicDist(2);
    pause(0.1);
    if D > 60
        %turnRightandMoveForward();
        disp("Turned Right and Moved Forward");
        brick.MoveMotorAngleAbs('B', 10, C); 
        brick.WaitForMotor('B'); 
        brick.MoveMotorAngleRel('A', 50, 1090); 
        brick.WaitForMotor('A');
        brick.MoveMotorAngleAbs('B', 10, 0); 
        brick.WaitForMotor('B');
        brick.MoveMotorAngleRel('A', 50, 7590); 
        brick.WaitForMotor('A');
    elseif D <= 60
        %turnLeft();
        disp("Turned Left and Checked if front is clear");
        brick.MoveMotorAngleAbs('B', 10, C); 
        brick.WaitForMotor('B');
        brick.MoveMotorAngleRel('A', 40, -1090); 
        brick.WaitForMotor('A');
        brick.MoveMotorAngleAbs('B', 10, 0); 
        brick.WaitForMotor('B');
        D = brick.UltrasonicDist(4);
        if D > 60
           disp("Front is Clear");
           %turnRightandMoveForward();
           brick.MoveMotorAngleAbs('B', 10, C); 
           brick.WaitForMotor('B'); 
           brick.MoveMotorAngleRel('A', 50, 1090); 
           brick.WaitForMotor('A');
           brick.MoveMotorAngleAbs('B', 10, 0); 
           brick.WaitForMotor('B');
           brick.MoveMotorAngleRel('A', 50, 7590); 
           brick.WaitForMotor('A');
        elseif D <= 60
            disp("Front is not clear");
            brick.MoveMotorAngleAbs('B', 10, C);
            brick.WaitForMotor('B');
            brick.MoveMotorAngleRel('A', 200, -1090);
            brick.WaitForMotor('A');
            brick.MoveMotorAngleAbs('B', 10, 0)
            brick.WaitForMotor('B');
        end
    end
end