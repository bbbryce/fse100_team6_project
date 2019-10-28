global key
InitKeyboard();
clutchMotorPort = 2;
moveMotorPort = 1;
gyroPort = 1;

clutchEnabled = false;


while 1
    pause(0.1)
    switch key
        case 'uparrow'
            if clutchEnabled == false
                moveForward(moveMotorPort);
            end
        case 'downarrow'
            if clutchEnabled == false
                moveBackward(moveMotorPort);        
            end
        case 'leftarrow'
            if clutchEnabled == true
                turnLeft(moveMotorPort);
            end
            
        case 'rightarrow'
            if clutchEnabled == true
                turnRight(moveMotorPort);
            end
        
        case 'c'
            clutchEnabled = ~clutchEnabled;
            switchClutch(clutchMotorPort);
            
        case 0
            disp('No Key Being Pressed')
            
        case 'q'
            break;
            
    end
end
CloseKeyboard();
            
            
            