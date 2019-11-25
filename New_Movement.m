brick = ConnectBrick('Error 404');
while true
    distance = brick.UltrasonicDist(4);
    pause(0.1);
    if distance > 60
        %turnRightandMoveForward();
        disp("Turned Right and Moved Forward");
        brick.MoveMotorAngleAbs('B', 10, 38); 
        brick.WaitForMotor('B'); 
        brick.MoveMotorAngleRel('A', 50, 1050); 
        brick.WaitForMotor('A');
        brick.MoveMotorAngleAbs('B', 10, 0); 
        brick.WaitForMotor('B');
        brick.MoveMotorAngleRel('A', 50, 1700); 
        brick.WaitForMotor('A');
    elseif distance <= 60
        %turnLeft();
        disp("Turned Left and Checked if front is clear");
        brick.MoveMotorAngleAbs('B', 10, 38); 
        brick.WaitForMotor('B');
        brick.MoveMotorAngleRel('A', 40, -1050); 
        brick.WaitForMotor('A');
        brick.MoveMotorAngleAbs('B', 10, 0); 
        brick.WaitForMotor('B');
        distance = brick.UltrasonicDist(4);
        if distance > 60
           disp("Front is Clear");
           %turnRightandMoveForward();
           brick.MoveMotorAngleAbs('B', 10, 38); 
           brick.WaitForMotor('B'); 
           brick.MoveMotorAngleRel('A', 50, 1050); 
           brick.WaitForMotor('A');
           brick.MoveMotorAngleAbs('B', 10, 0); 
           brick.WaitForMotor('B');
           brick.MoveMotorAngleRel('A', 50, 1700); 
           brick.WaitForMotor('A');
        elseif distance <= 60
            disp("Front is not clear");
           %moveForward();
           brick.MoveMotorAngleRel('A', 50, 1700); 
           brick.WaitForMotor('A');
        end
    end
end