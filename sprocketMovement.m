brick = SimBrick;
brick.conn.write('SET simulateClutch 1 1');
brick.conn.write('SET motorRange 3 -31 31');
brick.conn.write('SET motorRange 2 -2000 2000');
brick.conn.write('SET driveGearRatio 0.1666666 1.0');
brick.conn.write('SET effectiveWheelbase 4.45');
while true
    distance = brick.UltrasonicDist(4);
    pause(0.1);
    if distance > 60
        %turnRightandMoveForward();
        disp("Turned Right and Moved Forward");
        brick.MoveMotorAngleAbs('B', 10, 31);
        pause(1.5);
        brick.MoveMotorAngleRel('A', 200, 1090); 
        brick.WaitForMotor('A');
        brick.MoveMotorAngleAbs('B', 10, -31);
        pause(1.5);
        brick.MoveMotorAngleRel('A', 200, 7590);
        state = brick.MotorBusy('A');
        while(state)
            color = brick.ColorColor(3);
            if(color == 5)
                disp("Red");
                brick.StopAllMotors();
                brick.MoveMotorAngleRel('A', 200, 3795);
            end
            state = brick.MotorBusy('A');
        end
        brick.WaitForMotor('A');
    elseif distance <= 60
        %turnLeft();
        disp("Turned Left and Checked if front is clear");
        brick.MoveMotorAngleAbs('B', 10, 31); 
        pause(1.5);
        brick.MoveMotorAngleRel('A', 200, -1090); 
        brick.WaitForMotor('A');
        brick.MoveMotorAngleAbs('B', 10, 31); 
        pause(1.5);
        distance = brick.UltrasonicDist(4);
        if distance > 60
           disp("Front is Clear");
           %turnRightandMoveForward();
           brick.MoveMotorAngleAbs('B', 10, 31); 
           pause(1.5); 
           brick.MoveMotorAngleRel('A', 50, 1090); 
           brick.WaitForMotor('A');
           brick.MoveMotorAngleAbs('B', 10, -31); 
           pause(1.5);
           brick.MoveMotorAngleRel('A', 200, 7590); 
           brick.WaitForMotor('A');
        elseif distance <= 60
            disp("Front is not clear");
           brick.MoveMotorAngleAbs('B',10,31);
           pause(1.5);
           brick.MoveMotorAngleRel('A', 200, -1090); 
           brick.WaitForMotor('A');
           brick.MoveMotorAngleAbs('B',10,-31);
           pause(1.5);
        end
    end
end