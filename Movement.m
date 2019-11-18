%brick = ConnectBrick('Error 404');

global key
InitKeyboard();
liftEnabled = false;

while 1

    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotorAngleRel('A', 50, 1700, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            
        case 'downarrow'
            brick.MoveMotorAngleRel('A', 50, -1700, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
        
        case 'leftarrow'
            brick.MoveMotorAngleAbs('B', 10, 38); 
            brick.WaitForMotor('B'); % Wait for motor to complete motion
            brick.MoveMotorAngleRel('A', 40, -1050, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            brick.MoveMotorAngleAbs('B', 10, 0); 
            brick.WaitForMotor('B'); % Wait for motor to complete motion
            
            %disp(angle);
            
        case 'rightarrow'
            brick.MoveMotorAngleAbs('B', 10, 38); 
            brick.WaitForMotor('B'); % Wait for motor to complete motion
            brick.MoveMotorAngleRel('A', 50, 1050, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            brick.MoveMotorAngleAbs('B', 10, 0); 
            brick.WaitForMotor('B'); % Wait for motor to complete motion
            
            %disp(angle);
	    case 'l'
<<<<<<< HEAD
			liftEnabled = ~liftEnabled
            if liftEnabled == true
			
                brick.MoveMotorAngleRel('C', 50, 950, 'Brake')
            else 
			 
                brick.MoveMotorAngleRel('C', 50, -950, 'Brake');   
=======
			liftEnabled = ~liftEnabled;
            
            if liftEnabled == true
                brick.moveMotorAngleRel('C', 50, 950, 'Brake');
            else
                brick.moveMotorAngleRel('C', 50, -950, 'Brake');
>>>>>>> 8b575999781660da3cfeca2e70ad5c9a5d21c636
            end
			  
        case 0
            disp('No Key Pressed!');
            
        case 'q'
            break;
    end
end
 CloseKeyboard();