brick = ConnectBrick('Error 404');
brick.GyroCalibrate(1);  % Calibrates the Gyro Sensor.
global key
InitKeyboard();
while 1
    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotorAngleAbs('A', 30, 30, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
        
        case 'leftarrow'
            brick.MoveMotorAngleAbs('B', 20, 20, 'Coast'); 
            brick.WaitForMotor('B'); % Wait for motor to complete motion
            brick.MoveMotorAngleAbs('A', 30, 90, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            brick.MoveMotorAngleAbs('B', 20, 0, 'Coast'); 
            brick.WaitForMotor('B'); % Wait for motor to complete motion
            angle = brick.GyroAngle(1);
            disp(angle);
            
        case 'rightarrow'
            brick.MoveMotorAngleAbs('B', 20, 20, 'Coast'); 
            brick.WaitForMotor('B'); % Wait for motor to complete motion
            brick.MoveMotorAngleAbs('A', 30, -90, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            brick.MoveMotorAngleAbs('B', 20, 0, 'Coast'); 
            brick.WaitForMotor('B'); % Wait for motor to complete motion
            angle = brick.GyroAngle(1);
            disp(angle);
            
        case 0
            disp('No Key Pressed!');
            
        case 'q'
            break;
    end
 end
 CloseKeyboard();